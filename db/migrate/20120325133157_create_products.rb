class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products, id: false do |t|
      t.string :code, null: false
      t.string :department_code, null: false
      t.string :name, null: false
      t.text :description
      t.date :started_on, null: false
      t.date :ended_on, null: true

      t.timestamps
    end
    
    add_index :products, [ :code, :started_on ], unique: true
  end
end
