class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :xxx

      t.timestamps
    end
  end
end
