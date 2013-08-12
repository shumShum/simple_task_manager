class StoriesController < ApplicationController

  STATES_BTN = {
    new: [{label: 'start', color: '#7fcee2'}],
    start: [{label: 'finish', color: '#f68f85'}],
    finish: [{label: 'accept', color: '#b2ffb2'}, {label: 'reject', color: '#ffff66'}],
    accept: [],
    reject: [{label: 'start', color: '#7fcee2'}]
  }

  before_filter :redirect_if_user_is_not_authorized, :def_option

  def show
    @story = Story.find(params[:id])
    @story_comment = StoryComment.new

    @change_buttons = STATES_BTN[@story.state.to_sym]
  end

  def index
    case params[:option]
    when 'to'
      @search = Story.where(child_id: current_user).search(params[:q])
      @option[:to] = true
    when 'by'
      @search = Story.where(parent_id: current_user).search(params[:q])
      @option[:by] = true
    else
      @search = Story.search(params[:q])
      @option[:all] = true
    end
    @stories = @search.result
  end

  def out_by_filters
    assigner_option = params[:assigner_option] if params[:assigner_option] != 'all'
    assignee_option = params[:assignee_option] if params[:assignee_option] != 'all'
    state_option = params[:state_option] if params[:state_option] != 'all'

    @stories = Story.page
    @stories = @stories.where(parent_id: assigner_option) if assigner_option.present?
    @stories = @stories.where(child_id: assignee_option) if assignee_option.present?
    @stories = @stories.where(state: state_option) if state_option.present?
    @stories = @stories.all

    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
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

    respond_to do |format|
      format.html { redirect_to @story }
      format.js
    end
  end

  private

  def def_option
    @option = { to: false, by: false, all: false }
  end

end
