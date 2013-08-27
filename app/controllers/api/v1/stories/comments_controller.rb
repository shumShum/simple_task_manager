class Api::V1::Stories::CommentsController < Api::V1::Stories::ApplicationController

  def create
    # TODO это нужно обсудить
    # такой вариант красивей и теперь (после 'has_many comments, class_name: CommentsNewType')
    # но тогда так нужно делать и в стори (для единообразия), но там все не так просто (у стори несколько типов)
    # плюс ко всему все эти пертурбации привели к тому, что 'user.stories.comments' выдает ошибку (логично)
    @comment = resource_story.comments.build(params[:story_comment])
    @comment.user = current_user
    @comment.save

    respond_with(@comment, location: nil)
  end

  def destroy
    @comment = resource_story.comments.find(params[:id])
    @comment.destroy

    respond_with(@comments, location: nil)
  end

end