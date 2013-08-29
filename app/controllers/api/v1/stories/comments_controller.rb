class Api::V1::Stories::CommentsController < Api::V1::Stories::ApplicationController

  def create
    @comment = Story::CommentNewType.new(params[:story_comment])
    @comment.story = resource_story
    @comment.user = current_user
    @comment.save

    respond_with(@comment, location: nil)
  end

  def destroy
    @comment = resource_story.comments.find(params[:id])
    @comment.destroy

    respond_with(@comment, location: nil)
  end

end