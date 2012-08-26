class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :post_type
      t.references :site
      t.string :title
      t.text :content
      t.string :attachment

      t.timestamps
    end
    add_index :posts, :post_type_id
    add_index :posts, :site_id
  end
end
