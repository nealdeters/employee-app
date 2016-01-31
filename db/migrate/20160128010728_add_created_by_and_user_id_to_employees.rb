class AddCreatedByAndUserIdToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :created_by, :string
    add_column :employees, :user_id, :integer
  end
end
