class DropManagers < ActiveRecord::Migration[7.0]
  def change
    drop_table :managers
  end
end
