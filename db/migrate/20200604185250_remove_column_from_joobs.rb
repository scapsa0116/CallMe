class RemoveColumnFromJoobs < ActiveRecord::Migration[6.0]
  def change
    remove_column :jobs, :category, :strng
  end
end
