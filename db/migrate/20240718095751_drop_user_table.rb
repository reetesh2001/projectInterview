class DropUserTable < ActiveRecord::Migration[7.1]
 
    def up
      drop_table :users
    end
  
    def down
      create_table :users do |t|
        t.datetime :created_at, null: false
        t.datetime :updated_at, null: false
      end
    end
  
end
