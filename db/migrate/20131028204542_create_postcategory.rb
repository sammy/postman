class CreatePostcategory < ActiveRecord::Migration
  def change
    create_table :postcategory do |t|
      t.integer :post_id
      t.integer :category_id
    end
  end
end
