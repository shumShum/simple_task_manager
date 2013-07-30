require 'test_helper'

class StoriesControllerTest < ActionController::TestCase
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stories)
  end

  test "should create story" do
    assert_difference('Story.count') do
      post :create, story: { title: 'Some title', body: 'discription', parent_id: 1, child_id: 1}
    end
   
    assert_redirected_to post_path(assigns(:story))
  end

end
