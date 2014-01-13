class AddStanfordToCosmics < ActiveRecord::Migration
  def change
    add_column :cosmics, :stanford, :boolean
  end
end
