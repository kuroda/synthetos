class CreateCategoryProductLinks < ActiveRecord::Migration
  def change
    create_table :category_product_links, id: false do |t|
      t.string :category_code
      t.string :product_code
      t.date :started_on, null: false
      t.date :ended_on, null: true

      t.timestamps
    end
    
    add_index :category_product_links,
      [ :category_code, :product_code, :started_on ], unique: true,
      name: "index_category_product_links_on_codes"
  end
end
