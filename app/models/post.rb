class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, -> { order "created_at DESC" }
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable

  before_create :generate_slug

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

  def generate_slug
    slug = self.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/,'')
    if Post.where(:slug => slug).count > 0
      n = 1
      while Post.where(:slug => "#{slug}-#{n}").count > 0
        n += 1
      end
      self.slug = "#{slug}-#{n}"
    else
      self.slug = "#{slug}"
    end
  end

  def to_param
    self.slug
  end 


end