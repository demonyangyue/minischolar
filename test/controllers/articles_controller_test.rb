require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase

  setup do
    sign_in :user, users(:one)
    @article = articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post :create, article: { title: "another article" }

    end

    assert_redirected_to article_path(assigns(:article))

    assert_equal Article.find_by_title("another article").user, @controller.current_user
  end

  test "should show article" do
    get :show, id: @article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @article
    assert_response :success
  end

  test "should update article" do
    patch :update, id: @article, article: {  title: @article.title}
    assert_redirected_to article_path(assigns(:article))
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete :destroy, id: @article
    end

    assert_redirected_to articles_path
  end
end
