class CreatePrimer3Outputs < ActiveRecord::Migration
  def change
    create_table :primer3_outputs do |t|
      t.string :primer_error
      t.string :primer_warning
      t.integer :primer_left_num_returned
      t.integer :primer_right_num_returned
      t.integer :primer_interval_num_returned
      t.integer :primer_pair_num_returned

      t.timestamps
    end
  end
end
