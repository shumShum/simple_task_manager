class StoriesController < ApplicationController

  STATES_BTN = {
    new: [{label: 'start', color: '#7fcee2'}],
    start: [{label: 'finish', color: '#f68f85'}],
    finish: [{label: 'accept', color: '#b2ffb2'}, {label: 'reject', color: '#ffff66'}],
    accept: [],
    reject: [{label: 'start', color: '#7fcee2'}]
  }

  before_filter :to_signin, :def_option

  def show
    @story = Story.find(params[:id])
    @story_comment = StoryComment.new

    @change_buttons = STATES_BTN[@story.state.to_sym]
  end

  def index
    case params[:option]
    when 'to'
      @stories = current_user.to_stories
      @option[:to] = true
    when 'by'
      @stories = current_user.by_stories
      @option[:by] = true
    else
      @stories = Story.all
      @option[:all] = true
    end
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
    @story.send(params[:event].to_s)
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
