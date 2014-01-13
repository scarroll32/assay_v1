class AddSourceToBatches < ActiveRecord::Migration
  def change
    add_column :batches, :source, :string
  end
end
