class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  before_save :generate_slug

  def generate_slug
    self.slug = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/,'')
  end

  def to_param
    self.slug
  end

end