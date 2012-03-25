class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments, id: false do |t|
      t.string :code, null: false
      t.integer :seq_number, null: false
      t.string :name, null: false
      t.date :established_on, null: false
      
      t.timestamps
    end
    
    add_index :departments, [ :code, :seq_number ], unique: true
  end
end
