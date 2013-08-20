class Api::V1::Stories::CommentsController < Api::V1::Stories::ApplicationController

  #TODO
  # код выглядит по меньшей мере странно, но как решить проблему с обнулением переменной @story
  # пока не знаю, поэтому оставлю как есть до лучших времен.
  def create
    @comment = resource_story.comments.build(params[:story_comment])
    @comment.save

    respond_with(@comment, location: nil)
  end

  def destroy
    @comment = resource_story.comments.find(params[:id])
    @comment.destroy

    respond_with(@comments, location: nil)
  end

end