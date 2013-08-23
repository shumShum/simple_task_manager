require 'test_helper'

class Web::StoriesControllerTest < ActionController::TestCase

  def setup
    @user = create :user
    sign_in(@user)

    @story = create :story
    @attrs = attributes_for :story, title: 'edited title'
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
    get :show, id: @story
    assert_response :success
  end

  test "should create story" do
    attrs = attributes_for(:story, title: 'test create')
    attrs[:assigner_id] = create :user, email: 'parentnewtask@mail.ru'
    attrs[:assignee_id] = create :user, email: 'childnewtask@mail.ru'
    post :create, story: attrs

    assert_response :redirect
    story = Story.where(title: attrs[:title]).first
    assert { story }
  end

  test "should get edit" do
    get :edit, id: @story
    assert_response :success
  end

  test "should update story" do
    put :update, id: @story, story: @attrs
    assert_response :redirect
    @story.reload
    assert { @attrs[:title] == @story.title }
  end

  test "should call event" do
    put :event, event: 'to_start', story_id: @story
    assert_response :success
    @story.reload
    assert { @story.start? }
  end

end
