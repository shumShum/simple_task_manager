class StoryCommentsController < ApplicationController

  #TODO
  # код выглядит по меньшей мере странно, но как решить проблему с обнулением переменной @story 
  # пока не знаю, поэтому оставлю как есть до лучших времен.
  def create
    @story_comment = StoryComment.new(params[:story_comment])
    unless @story_comment.save
      flash[:error] = 'Error: comment not created'
    end
    @story = @story_comment.story
    @story_comment = StoryComment.new
    respond_to do |format|
      format.html { redirect_to @story }
      format.js
    end
  end

  def destroy
    @story_comment = StoryComment.find(params[:id])
    @story = @story_comment.story
    @story_comment.destroy
    respond_to do |format|
      format.html { redirect_to @story }
      format.js
    end
  end

end