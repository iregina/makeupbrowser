class CreateJoinTableProductImage < ActiveRecord::Migration
  def change
    create_join_table :products, :images do |t|
      t.index :product_id
      t.index :image_id
    end
  end
end
