require 'test_helper'

class Web::StoriesControllerTest < ActionController::TestCase

  def setup
    @user = create :user
    sign_in(@user)

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
    get :show, id: @story.id
    assert_response :success
  end

  test "should create story" do
    attrs = attributes_for(:story, title: 'test create')
    attrs[:assigner_id] = create :user, email: 'parentnewtask@mail.ru'
    attrs[:assignee_id] = create :user, email: 'childnewtask@mail.ru'
    post :create, story: attrs

    assert_response :redirect
    story = Story.where(title: attrs[:title]).first
    assert story
  end

  test "should call event" do
    put :update, event: 'to_start', id: @story
    assert_response :success
    @story.reload
    assert @story.start?
  end

end
