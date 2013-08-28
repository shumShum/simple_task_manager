class Web::StoriesController < Web::ApplicationController

  add_breadcrumb :index, :stories_path

  before_filter :redirect_if_user_is_not_authorized

  def show
    @story = Story.find(params[:id]).decorate
    @comments = @story.comments.roots.decorate
    @comment = @story.comments.build
    add_breadcrumb @story.title, story_path(@story)
  end

  def index
    @search = Story.search(params[:q])
    @stories = @search.result.page(params[:page]).per(10).decorate
  end

  def new
    @story = Story.new
    add_breadcrumb :new, new_story_path
  end

  def create
    @story = StoryNewType.new(params[:story])
    @story.assigner = current_user

    if @story.save
      redirect_to @story
    else
      render 'new'
    end
  end

  def edit
    @story = Story.find(params[:id])
    add_breadcrumb :edit, new_story_path
  end

  def update
    story = Story.find(params[:id])
    @story = story.becomes StoryEditType
    @story.current_user = current_user

    if @story.update_attributes(params[:story])
      redirect_to story_path(@story)
    else
      f(:error)
      render :edit
    end
  end

end
