class PrimerPair < ActiveRecord::Base
  belongs_to :primer3_parameter
  #attr_accessible :primer3_parameter_id, :cosmic_mut_id, :left_seq_selected, :modified_left_sequence, :modified_right_sequence, :primer_left, :primer_left_end_stability, :primer_left_gc_percent, :primer_left_hairpin_th, :primer_left_penalty, :primer_left_self_any_th, :primer_left_self_end_th, :primer_left_sequence, :primer_left_tm, :primer_pair_compl_any_th, :primer_pair_compl_end_th, :primer_pair_penalty, :primer_pair_product_size, :primer_right, :primer_right_end_stability, :primer_right_gc_percent, :primer_right_hairpin_th, :primer_right_penalty, :primer_right_self_any_th, :primer_right_self_end_th, :primer_right_sequence, :primer_right_tm, :ranking, :right_seq_selected
end
