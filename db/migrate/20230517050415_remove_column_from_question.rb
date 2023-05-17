class RemoveColumnFromQuestion < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :employee_id, :integer
  end
end
