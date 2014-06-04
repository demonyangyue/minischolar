require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  setup do
    @article = Article.create(title: "sample", article_attachment: File.open(file_path('bork.txt')), user_id: 1)
  end
  
  test "title  attributes must not be empty" do
    article = Article.new
    assert article.invalid?
    assert article.errors[:title].any?
  end

  test "article should have unique title" do 

    article_two = Article.create(title: @article.title, article_attachment: "more content")
    assert article_two.errors[:title].any?
  end

end
