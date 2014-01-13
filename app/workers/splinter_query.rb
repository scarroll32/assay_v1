class SplinterQuery

  @queue = :splinter_queue

  class << self
    def perform(batch_id)
        splinter(batch_id)
    end

    handle_asynchronously :perform, queue: :splinter_queue
  end

  def limits
    @upper_limit = 5
    @lower_limit = @upper_limit
    @range = @lower_limit + @upper_limit
    @step = 1  # 1 pct
  end



  def self.field_list
    #@fieldlist = [{:primer_internal_dna_conc => :decimal}, {:primer_internal_dntp_conc => :integer},{:primer_internal_max_gc => :decimal}, {:primer_internal_max_hairpin_th => :decimal},{:primer_internal_max_library_mishyb => :decimal}]

    fieldlist = Hash.new
    Primer3Template.accessible_attributes.each do |fieldname|
      fieldtype =  Primer3Template.columns_hash[fieldname].type
      if fieldtype == :integer || fieldtype == :decimal
        fieldlist[fieldname] = fieldtype
      end
    end

    fieldlist
  end


  def self.splinter(batch_id)

    # create a variable for the only entered or defaulted primer3 row
    # create stop +/- variables, with a max of 5% on relevent fields
    # step up and then down until max reached

    # loop through batch_detail rows
    fieldlist = self.field_list
    @batch_detail = BatchDetail.find(:all, :conditions => {:batch_id => batch_id}).each do |batch_detail|
      @p3_base  = Primer3Parameter.find(:all, :conditions => {:batch_detail_id => @batch_detail.id, :generated => false}).first

      # start at (base - lower_limit)
      @p3_previous = @p3_base
      reduction = (1 - (@lower_limit_pct/100))
      fieldlist.each_with_index do |element, index|
        element.each do |field, type|
          if type == :decimal
 #           @p3_previous.send(field) = @p3_previous.send(field) * reduction
          end
          if type == :integer
 #           @p3_previous.send(field) = (@p3_previous.send(field) * reduction).to_i
          end
        end
      end


      (@step).step(@range,@step).each do |step_index|
        @p3_current = @p3_previous.dup
        # 2d matrix of fields and iterate for stepped updates
        # each full iteration updates one column only
        fieldlist.each_with_index do |element, outer_index|
          fieldlist.each_with_index do |element, inner_index|
            if inner_index == outer_index
              if type == :decimal
#                element.each {|field, type| @p3_current.send(field) = @p3_current.send(field) + @step }
              end
              if type == :integer
 #               element.each {|field, type| @p3_current.send(field) = (@p3_current.send(field) + @step).to_i }
              end
            end
          end
        end
        @p3_current.save
        @p3_previous = @p3_current
      end
    end
  end
end
