class RemoveColumnFromAnswers < ActiveRecord::Migration[7.0]
  def change
    remove_column :answers, :manager_id, :integer
  end
end
