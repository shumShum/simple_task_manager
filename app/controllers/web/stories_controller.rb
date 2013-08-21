class Web::StoriesController < Web::ApplicationController
  include Concerns::StatesBtn

  add_breadcrumb :index, :stories_path

  before_filter :redirect_if_user_is_not_authorized

  def show
    @story = Story.find(params[:id])
    @comments = @story.comments.roots
    @comment = @story.comments.build

    @change_buttons = states_btn[@story.state.to_sym]

    add_breadcrumb @story.title, story_path(@story)
  end

  def index
    @search = Story.search(params[:q])
    @stories = @search.result
  end

  def new
    @story = Story.new
    add_breadcrumb :new, new_story_path
  end

  def create
    @story = current_user.by_stories.build(params[:story])
    if @story.save
      redirect_to @story
    else
      render 'new'
    end
  end

  def update
    @story = Story.find(params[:id])
    @story.fire_state_event(params[:event])
    @change_buttons = states_btn[@story.state.to_sym]

    render json: {
      story: @story,
      buttons: @change_buttons
      }, status: 201
  end

end
