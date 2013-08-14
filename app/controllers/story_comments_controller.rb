class StoryCommentsController < ApplicationController

  before_filter :find_story

  #TODO
  # код выглядит по меньшей мере странно, но как решить проблему с обнулением переменной @story 
  # пока не знаю, поэтому оставлю как есть до лучших времен.
  def create
    @story_comment = StoryComment.new(params[:story_comment])
    @story_comment.story = @story
    
    @story_comment.save 
    
    @story_comments = @story.story_comments.sort{|x,y| x.created_at <=> y.created_at}
    @story_comment = @story.story_comments.build

    render json: @story_comments, status: 201
  end

  def destroy
    @story_comment = StoryComment.find(params[:id])
    @story_comment.destroy
    @story_comments = @story.story_comments.sort{|x,y| x.created_at <=> y.created_at}

    render json: @story_comments, status: 201
  end

  def find_story
    @story = Story.find(params[:story_id])
  end

end