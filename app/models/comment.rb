class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :votes, as: :voteable
  
  validates :body, presence: true 

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