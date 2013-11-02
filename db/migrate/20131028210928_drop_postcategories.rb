class DropPostcategories < ActiveRecord::Migration
  def change
    drop_table :postcategory
  end
end
