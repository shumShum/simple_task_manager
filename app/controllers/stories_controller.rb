class StoriesController < ApplicationController

  STATES_BTN = {
    new: [{label: 'start', color: '#7fcee2'}],
    start: [{label: 'finish', color: '#f68f85'}],
    finish: [{label: 'accept', color: '#ccf2b9'}, {label: 'reject', color: '#ffc40d'}],
    accept: [],
    reject: [{label: 'start', color: '#7fcee2'}]
  }

  before_filter :redirect_if_user_is_not_authorized, :def_option

  def show
    @story = Story.find(params[:id])
    @story_comments = @story.story_comments.sort{|x,y| x.created_at <=> y.created_at}
    @story_comment = @story.story_comments.build

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
