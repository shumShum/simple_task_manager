class Web::StoriesController < Web::ApplicationController
  include Concerns::StatesBtn

  before_filter :redirect_if_user_is_not_authorized

  def show
    @story = Story.find(params[:id])
    @comments = @story.comments.all
    @comment = @story.comments.build

    @change_buttons = states_btn[@story.state.to_sym]
  end

  def index
    @search = Story.search(params[:q])
    @stories = @search.result
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(params[:story])
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
