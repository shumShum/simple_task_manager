class StoryCommentsController < ApplicationController

  before_filter :find_story

  #TODO
  # код выглядит по меньшей мере странно, но как решить проблему с обнулением переменной @story 
  # пока не знаю, поэтому оставлю как есть до лучших времен.
  def create
    @story_comment = StoryComment.new(params[:story_comment])
    @story_comment.story = @story
    flash[:error] = 'Error: comment not created' unless @story_comment.save 
    
    @story_comments = @story.story_comments.sort{|x,y| x.created_at <=> y.created_at}
    @story_comment = @story.story_comments.build

    respond_to do |format|
      format.html { redirect_to @story }
      format.js
    end
  end

  def destroy
    @story_comment = StoryComment.find(params[:id])
    @story_comment.destroy
    @story_comments = @story.story_comments.sort{|x,y| x.created_at <=> y.created_at}
    respond_to do |format|
      format.html { redirect_to @story }
      format.js
    end
  end

  def find_story
    @story = Story.find(params[:story_id])
  end

end