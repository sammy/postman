class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :order => "created_at DESC"
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable

  validates :title, :description, :url, presence: true 


  def total_votes
    positive_votes - negative_votes
  end

  def positive_votes
    self.votes.where(vote: true).size
  end 

  def negative_votes
    self.votes.where(vote: false).size
  end


end