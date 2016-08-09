class AddBudgetToProjects < ActiveRecord::Migration
  def change
  	#to add new column
  	#add_column :table_name, :column_name, :coulmn_type
 	add_column :projects,:budget,:integer
 	#add_column :clients, :tin_no, :string 
  end
end
