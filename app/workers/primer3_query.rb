class Primer3Query
  
  def self.log(message)
    indent = '    '
    Delayed::Worker.logger.debug("#{indent}#{message}")
  end
    
   
  

  class << self
    def perform(batch_id)
      self.log("PRIMER 3 Start #{batch_id}")
      primer3(batch_id)
    end
    handle_asynchronously :perform, queue: :primer3_queue, :run_at => Proc.new { 1.second.from_now }
  end
  

  def self.primer3(batch_id)
    self.log("self.primer3")
    Batch.update(batch_id, :step => 'primer3', :status => 'processing')
    dirs = make_directory(batch_id)    
    @batch_detail = BatchDetail.find(:all, :conditions => {:batch_id => batch_id}).each do |batch_detail|
      self.log("..batch_detail: #{batch_detail.id}")
      @primer3_parameter = Primer3Parameter.find(:all, :conditions => {:batch_detail_id => batch_detail.id}).each do |primer3_parameter|
        primer3_parameter.status = 'processing'
        primer3_parameter.save
        
        filename = "P3_INPUT_#{batch_detail.batch_id}_#{batch_detail.id}_#{primer3_parameter.id}"
        primer3_parameter.sequence_id = filename
        write_input_file(dirs[:base], filename, primer3_parameter)
        
        
        Dir.chdir(dirs[:primer3])
        self.log(`pwd`)
        cmd = "primer3_core < #{dirs[:base]}/#{filename}"
        self.log("#{cmd} > #{dirs[:raw]}/#{filename}.raw")
        primer3_return_code1 = `#{cmd} > #{dirs[:raw]}/#{filename}.raw`
        self.log("Primer 3 return: #{primer3_return_code1}")
        
        Dir.chdir(dirs[:primer3])
        self.log(`pwd`)
        cmd = "#{dirs[:primer3]}/primer3_core < #{dirs[:base]}/#{filename}"
        cmd2 = "#{cmd} > #{dirs[:formatted]}/#{filename}.formatted -format_output"
        self.log(cmd2)
        primer3_status = Open4::popen4("sh") do |pid, stdin, stdout, stderr|
          stdin.puts "cd #{dirs[:primer3]}"
          stdin.puts "#{cmd2}"  
          stdin.close
          self.log("    pid: #{ pid }")
          self.log("    stdout: #{stdout.read.strip}")
          self.log("    stderr: #{stderr.read.strip}")
        end
        self.log("    primer3_status: #{primer3_status.inspect}")
        self.log("    exitstatus: #{primer3_status.exitstatus}")
        #primer3_return_code2 = `#{cmd} > #{dirs[:formatted]}/#{filename}.formatted -format_output`
        #primer3_return_code2 = system("#{cmd} > #{dirs[:formatted]}/#{filename}.formatted -format_output")
        #seteself.log("Primer 3 return: #{primer3_return_code2}")
       
        primer3_parameter.status = 'complete'
        primer3_parameter.save
  	  end
      batch_detail.status = 'complete'
      batch_detail.save
    end
    Batch.update(batch_id, :step => 'assay', :status => 'completed')
    self.log("Ending Primer3")
  end
  
 
  def self.make_directory(batch_id)
    self.log("Starting self.make_directory")
    Dir.chdir(Rails.root)
    dirs = FileUtils.mkdir_p ["#{Rails.root}/doc/primer3/#{batch_id}",
                              "#{Rails.root}/doc/primer3/#{batch_id}/raw",
                              "#{Rails.root}/doc/primer3/#{batch_id}/formatted"]
    self.log("Ending self.make_directory")
    dir_hash = { base: dirs[0], raw: dirs[1], formatted: dirs[2], 
                 primer3: "#{Rails.root}/bin/primer3/src",
                 thermo: "#{Rails.root}/bin/primer3/src/primer3_config" }
    self.log(dir_hash)
    return dir_hash
  end
  
  
  def self.write_input_file(directory, filename, primer3_parameter)
    Dir.chdir(Rails.root)
    File.open(File.join(directory, filename), 'w') do |f|
      Primer3Template.accessible_attributes.each do |name|
          unless primer3_parameter.send(name).nil?
            case primer3_parameter.send(name)
              when true
                f.puts "#{name.upcase}=1"
              when false
                f.puts "#{name.upcase}=0"
              else
                f.puts "#{name.upcase}=#{primer3_parameter.send(name)}"
            end
          end
      end
      f.puts '='
    end
  end
  
  
  def self.call_primer3_raw(directory, filename)
    # TODO add back in -strict-tags
    Rails.logger.debug("dir: #{directory}")
    Dir.chdir(directory)
    cmd = "primer3_core < #{filename} -output=raw/#{filename}.raw -error=#{filename}.error"
    self.log("cmd: #{cmd}")
    p3_data = system(cmd)
  end
  
  
  
  
  def self.call_primer3_formatted(directory, filename)
    Rails.logger.debug("dir: #{directory}")
    Dir.chdir(directory)
    cmd = "primer3_core < #{filename} -output=raw/#{filename}.raw -error=#{filename}.error -format_output"
    self.log("cmd: #{cmd}")
    p3_data = system(cmd)
  end
  
  
  def self.load_rawfile(directory, filename, primer3_parameter)
    rawfile = "#{directory}/raw/#{filename}.raw"
    #rawfile_hash = parse_rawfile(rawfile)
    #load_primer_pair(rawfile_hash, primer3_parameter)
    
    #load_primer3_output(rawfile_hash)
    #primer3_output = Primer3Output.new
    #load_primer3_output(rawfile_hash, primer3_output)
    #primer3_output.save
  end
  
  
  # TODO This code is not working
  # should be called from self.load_rawfile
  def load_primer_pair(directory, filename, primer3_parameter)
    results = []
    row = 0
    cosmic_mut_id = BatchDetail.find(:all, :conditions => {:id => primer3_parameter.batch_detail_id}).first.cosmic_mut_id
    
    rawfile = "#{directory}/raw/#{filename}.raw"
    File.open(rawfile, "r").each_line do |line|
      key, value = line.strip.split("=")
      id = key.scan(/\d+/).first.to_i
      column_name = key.gsub(/_\d+/, "").downcase
      results[id] = {"primer3_parameter_id" => id} unless results[id]
      results[id][column_name] = value
      if id > row
        PrimerPair.create!(results[row])
        results[row] = nil
        row = id
      end
      p.primer3_parameter_id = primer3_parameter.id
      p.ranking = 1
    end
    PrimerPair.create!(results.last)
  end
  
  
  
  def self.parse_rawfile(rawfile)
    rawfile_hash = {}
    File.open(rawfile,"r").each_line do |line|
      key, value = line.chomp.split('=', 2)
      if !(key.empty? && value.empty?)
        rawfile_hash[key.downcase.to_sym] = value
      end
    end
    self.log("rawfile: #{rawfile_hash}")
    rawfile_hash
  end
  
  
  
  
  def self.load_primer3_output(rawfile_hash)
    primer3_output = Primer3Output.new
    rawfile_hash.each do |key, value|
      if primer3_output.class.accessible_attributes.include?(key)
        primer3_output.send("#{key}=", value)
        #eval("primer3_output.#{key} = value")
      end
    end
    primer3_output.save
  end
  

  
end


