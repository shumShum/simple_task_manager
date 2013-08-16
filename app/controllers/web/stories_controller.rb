class Web::StoriesController < Web::ApplicationController

  STATES_BTN = {
    new: [{label: 'start', color: '#7fcee2'}],
    start: [{label: 'finish', color: '#f68f85'}],
    finish: [{label: 'accept', color: '#ccf2b9'}, {label: 'reject', color: '#ffc40d'}],
    accept: [],
    reject: [{label: 'start', color: '#7fcee2'}]
  }

  before_filter :redirect_if_user_is_not_authorized

  def show
    @story = Story.find(params[:id])
    @comments = @story.comments.all
    @comment = @story.comments.build

    @change_buttons = STATES_BTN[@story.state.to_sym]
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

  def event
    @story = Story.find(params[:story_id])
    @story.fire_state_event(params[:event])
    @change_buttons = STATES_BTN[@story.state.to_sym]

    render json: {
      story: @story,
      buttons: @change_buttons
      }, status: 201
  end

end
