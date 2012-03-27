class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments, id: false do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.date :started_on, null: false
      t.date :ended_on, null: true
      
      t.timestamps
    end
    
    add_index :departments, [ :code, :started_on ], unique: true
  end
end
