class CreatePrimerPairs < ActiveRecord::Migration
  def change
    create_table :primer_pairs do |t|
      t.references :primer3_parameter
      t.integer :ranking
      t.string :cosmic_mut_id
      t.boolean :left_seq_selected
      t.boolean :right_seq_selected
      t.text :modified_left_sequence
      t.text :modified_right_sequence
      t.decimal :primer_pair_penalty
      t.decimal :primer_left_penalty
      t.decimal :primer_right_penalty
      t.text :primer_left_sequence
      t.text :primer_right_sequence
      t.string :primer_left
      t.string :primer_right
      t.decimal :primer_left_tm
      t.decimal :primer_right_tm
      t.decimal :primer_left_gc_percent
      t.decimal :primer_right_gc_percent
      t.decimal :primer_left_self_any_th
      t.decimal :primer_right_self_any_th
      t.decimal :primer_left_self_end_th
      t.decimal :primer_right_self_end_th
      t.decimal :primer_left_hairpin_th
      t.decimal :primer_right_hairpin_th
      t.decimal :primer_left_end_stability
      t.decimal :primer_right_end_stability
      t.decimal :primer_pair_compl_any_th
      t.decimal :primer_pair_compl_end_th
      t.integer :primer_pair_product_size

      t.timestamps
    end
    add_index :primer_pairs, :primer3_parameter_id
  end
end
