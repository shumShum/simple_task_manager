require 'test_helper'

class StoriesControllerTest < ActionController::TestCase

  def setup
    @user = create :user
    sign_in(@user.id)

    @story = create :story
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show, {id: @story.id}
    assert_response :success
  end

  test "should create story" do
    attrs = attributes_for(:story, title: 'test create')
    attrs[:parent_id] = create :user, email: 'parentnewtask@mail.ru'
    attrs[:child_id] = create :user, email: 'childnewtask@mail.ru'
    post :create, story: attrs

    assert_response :redirect
    story = Story.where(title: attrs[:title]).first
    assert story
  end

  test "should call event" do

  end

end
