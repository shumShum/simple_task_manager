class StoriesController < ApplicationController

  before_filter :to_signin

  def show
    @story = Story.find(params[:id])
  end

  def index
    @stories = Story.all
  end

  def new

  end

  def create

  end

  

end
