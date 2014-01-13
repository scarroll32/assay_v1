module WizardsHelper

  def primer3_files(primer3_parameter)
    
    batch_detail_id = primer3_parameter.batch_detail_id
    batch_id = BatchDetail.find(batch_detail_id).batch_id
    
    filename = "P3_INPUT_#{batch_id}_#{batch_detail_id}_#{primer3_parameter.id}"
    
    dirs = { base: "#{Rails.root}/doc/primer3/#{batch_id}", 
             raw: "#{Rails.root}/doc/primer3/#{batch_id}/raw", 
             formatted: "#{Rails.root}/doc/primer3/#{batch_id}/formatted" }
    
    Dir.chdir(Rails.root)
    directory = Rails.root + "doc/primer3/#{batch_id}"
    #Dir.chdir(directory)
    files = { :input_file => "#{dirs[:base]}/#{filename}",
            :formatted_file => "#{dirs[:formatted]}/#{filename}.formatted",
            :forward_file => "#{directory}/#{filename}.for",
            :reverse_file => "#{directory}/#{filename}.rev"
            }
    
    files.each do |key, value| 
      if File.exist?(value) == false
        files[key] = nil
      end
    end
    Rails.logger.debug "Files: #{files}"
    files
  end
  
  
end