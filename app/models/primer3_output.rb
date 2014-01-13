class Primer3Output < ActiveRecord::Base
  belongs_to :batch_detail
  has_many :primer3_output_pairs, :dependent => :destroy
  attr_accessible :primer_error, :primer_interval_num_returned, :primer_left_num_returned, 
                  :primer_pair_num_returned, :primer_right_num_returned, :primer_warning
end


