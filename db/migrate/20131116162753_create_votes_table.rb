class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :vote
      t.integer :user_id
      t.text :votable_type
      t.integer :votable_id
      t.timestamps
    end
  end
end
