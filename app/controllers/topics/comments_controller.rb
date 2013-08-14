class Stories::CommentsController < ApplicationController

  before_filter :find_story

  #TODO
  # код выглядит по меньшей мере странно, но как решить проблему с обнулением переменной @story 
  # пока не знаю, поэтому оставлю как есть до лучших времен.
  def create
    @comment = StoryComment.new(params[:topic_comment])
    @comment.story = @story
    
    @comment.save 
    
    @comments = @story.comments.sort{|x,y| x.created_at <=> y.created_at}
    @comment = @story.comments.build

    render json: @comments, status: 201
  end

  def destroy
    @comment = StoryComment.find(params[:id])
    @comment.destroy
    @comments = @story.comments.sort{|x,y| x.created_at <=> y.created_at}

    render json: @comments, status: 201
  end

  def find_story
    @story = Story.find(params[:story_id])
  end

end