class AddReverseBasePairOffsetToBatchDetails < ActiveRecord::Migration
  def change
    add_column :batch_details, :forward_base_pair_offset, :string
    add_column :batch_details, :reverse_base_pair_offset, :string
  end
end
