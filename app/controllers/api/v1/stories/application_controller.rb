class Api::V1::Stories::ApplicationController < Api::ApplicationController

  def resource_story
    Story.find(params[:story_id])
  end

end