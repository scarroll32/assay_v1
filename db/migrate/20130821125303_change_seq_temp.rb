class ChangeSeqTemp < ActiveRecord::Migration
  def change
    change_column(:primer3s, :sequence_template, :text)
  end
end
