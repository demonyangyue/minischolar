class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, :article_attachment, presence: true
  validates :title, uniqueness: true
end
