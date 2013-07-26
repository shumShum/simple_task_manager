class StoriesController < ApplicationController

  before_filter :to_signin

  def show
    @story = Story.find(params[:id])
  end

  def index
    @option = {
      to: false,
      by: false,
      all: false
    }
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

  def new

  end

  def create

  end

end
