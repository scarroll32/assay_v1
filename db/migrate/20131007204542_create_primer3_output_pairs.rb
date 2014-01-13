class CreatePrimer3OutputPairs < ActiveRecord::Migration
  def change
    create_table :primer3_output_pairs do |t|
      t.string :primer_left_problems
      t.string :primer_internal_problems
      t.string :primer_right_problems
      t.integer :primer_left
      t.integer :primer_internal
      t.integer :primer_right
      t.string :primer_left_sequence
      t.string :primer_internal_sequence
      t.string :primer_right_sequence
      t.string :primer_pair_product_size
      t.decimal :primer_left_penalty
      t.decimal :primer_internal_penalty
      t.decimal :primer_right_penalty
      t.decimal :primer_pair_penalty
      t.decimal :primer_left_tm
      t.decimal :primer_internal_tm
      t.decimal :primer_right_tm
      t.decimal :primer_pair_product_tm
      t.decimal :primer_pair_product_tm_oligo_tm_diff
      t.decimal :primer_pair_t_opt_a
      t.decimal :primer_left_gc_percent
      t.decimal :primer_internal_gc_percent
      t.decimal :primer_right_gc_percent
      t.decimal :primer_left_self_any
      t.decimal :primer_internal_self_any
      t.decimal :primer_right_self_any
      t.decimal :primer_left_self_any_th
      t.decimal :primer_internal_self_any_th
      t.decimal :primer_right_self_any_th
      t.decimal :primer_right_hairpin_th
      t.decimal :primer_pair_compl_any
      t.decimal :primer_pair_compl_any_th
      t.decimal :primer_left_self_end
      t.decimal :primer_internal_self_end
      t.decimal :primer_right_self_end
      t.decimal :primer_left_self_end_th
      t.decimal :primer_internal_self_end_th
      t.decimal :primer_right_self_end_th
      t.decimal :primer_left_hairpin_th
      t.decimal :primer_internal_hairpin_th
      t.decimal :primer_pair_compl_end
      t.decimal :primer_pair_compl_end_th
      t.decimal :primer_left_end_stability
      t.decimal :primer_right_end_stability
      t.decimal :primer_left_template_mispriming
      t.decimal :primer_right_template_mispriming
      t.decimal :primer_pair_template_mispriming
      t.decimal :primer_left_template_mispriming_th
      t.decimal :primer_right_template_mispriming_th
      t.decimal :primer_pair_template_mispriming_th
      t.string :primer_left_library_mispriming
      t.string :primer_right_library_mispriming
      t.string :primer_pair_library_mispriming
      t.string :primer_internal_library_mishyb
      t.integer :primer_left_min_seq_quality
      t.integer :primer_internal_min_seq_quality
      t.integer :primer_right_min_seq_quality
      t.integer :primer_left_position_penalty
      t.integer :primer_right_position_penalty

      t.timestamps
    end
  end
end
