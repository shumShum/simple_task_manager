class Web::Stories::ApplicationController < Web::ApplicationController

  def resource_story
    Story.find(params[:story_id])
  end

end