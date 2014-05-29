require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  setup do
    @article = articles(:one)
  end
  
  test "title and article_attachment attributes must not be empty" do
    article = Article.new
    assert article.invalid?
    assert article.errors[:title].any?
    assert article.errors[:article_attachment].any?
  end

  test "article should have unique title" do 

    article_two = Article.create(title: @article.title, article_attachment: "more content")
    assert article_two.errors[:title].any?
  end

end
