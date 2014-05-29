class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, :article_attachment, presence: true
  validates :title, uniqueness: true

  mount_uploader :article_attachment, ArticleUploader
end
