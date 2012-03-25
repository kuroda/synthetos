class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products, id: false do |t|
      t.string :code, null: false
      t.integer :model_number, null: false
      t.string :department_code, null: false
      t.integer :department_seq_number, null: false
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
    
    add_index :products, [ :code, :model_number ], unique: true
  end
end
