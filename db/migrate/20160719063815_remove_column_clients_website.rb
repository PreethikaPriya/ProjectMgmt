class RemoveColumnClientsWebsite < ActiveRecord::Migration
  def change
  	#to remove existing column
  	#remove_column :projects ,:budget
  	remove_column :clients, :website
  end
end
