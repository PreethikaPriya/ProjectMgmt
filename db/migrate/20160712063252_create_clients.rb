class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
    	t.string :name
    	t.string :company
    	t.string :mobile
    	t.string :email
    	t.string :website
    	
      t.timestamps null: false
      # creteas 2 columns. 
      #1) => t.datetime :created_at
      #2) => t.datetime : updated_at
    end
  end
end
 