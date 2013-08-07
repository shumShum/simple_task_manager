require 'test_helper'

class StoriesControllerTest < ActionController::TestCase
  include Authorization

  fixtures :stories

  def setup
    FactoryGirl.create(:user) do |user|
      sign_in(user.id)
    end
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show, {id: stories(:one).id}
    assert_response :success
    assert_not_nil assigns(:story)
  end

  test "should create story" do
    assert_difference('Story.count') do
      post :create, story: FactoryGirl.attributes_for(:story)
    end
   
    assert_redirected_to assigns(:story)
  end

end
