class Vote < ActiveRecord::Base

  belongs_to :voteable, polymorphic: true

  validates_uniqueness_of :user_id, :scope => [:voteable_id, :voteable_type], message: "can only vote once per post!"

end
