class Vote < ActiveRecord::Base

  belongs_to :voteable, polymorphic: true

  validates_uniqueness_of :user_id, scope: :voteable, message: "can only vote once per post!"

end
