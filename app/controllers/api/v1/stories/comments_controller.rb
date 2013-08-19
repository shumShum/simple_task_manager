class Api::V1::Stories::CommentsController < Api::V1::Stories::ApplicationController

  #TODO
  # код выглядит по меньшей мере странно, но как решить проблему с обнулением переменной @story
  # пока не знаю, поэтому оставлю как есть до лучших времен.
  def create
    comment = resource_story.comments.new(params[:story_comment])
    comment.save

    @comments = resource_story.comments.all
    @comment = resource_story.comments.build

    respond_with(@comments, location: nil)
  end

  def destroy
    @comment = Story::Comment.find(params[:id])
    @comment.destroy
    @comments = resource_story.comments.all

    respond_with(@comments, location: nil)
  end

end