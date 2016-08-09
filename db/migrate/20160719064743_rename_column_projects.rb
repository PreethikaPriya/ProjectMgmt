class RenameColumnProjects < ActiveRecord::Migration
  def change
  	#to renmae column with new name
  	#rename_column :table_name, :old_column_name, :new_column_name
  	rename_column :projects, :budget, :estimated_budget

  	#to chnage column type
  	#change_column :table_name, :column_name, :new_column_type
  	change_column :projects, :estimated_budget, :float
  end
end

# setting value to zero Project.all.each {|project| project.update_attributes(estimated_budget: 0)}

