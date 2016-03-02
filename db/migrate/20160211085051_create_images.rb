class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :description
      t.belongs_to :user, index: true
      t.belongs_to :occasion, index: true
      t.timestamps null: false
      t.attachment :image
    end
  end
end
