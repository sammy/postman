class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :order => "created_at DESC"
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, :description, :url, presence: true

end