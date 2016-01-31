class RemoveCreatedByFromEmployees < ActiveRecord::Migration
  def change
    remove_column :employees, :created_by, :string
  end
end
