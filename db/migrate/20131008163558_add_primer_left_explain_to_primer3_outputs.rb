class AddPrimerLeftExplainToPrimer3Outputs < ActiveRecord::Migration
  def change
    add_column :primer3_outputs, :primer_left_explain, :string
    add_column :primer3_outputs, :primer_internal_explain, :string
    add_column :primer3_outputs, :primer_right_explain, :string
    add_column :primer3_outputs, :primer_pair_explain, :string
    add_column :primer3_outputs, :primer_stop_codon_position, :integer
  end
end
