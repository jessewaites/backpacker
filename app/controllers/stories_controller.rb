class StoriesController < ApplicationController
  #before_action :logged_in_user, only: [:create, :destroy]

  def index
    @story = Story.all
  end

  def new
    @story = Story.new
    @user = current_user
  end

  def create
    @story = current_user.stories.new(story_params)
    if @story.save
      flash[:success] = "Travel Story created!"
      redirect_to @story
    else
      render '/'
    end
  end

  def show
    @story = find_story
  end

  def destroy
    @story.destroy
    redirect_to stories_path
  end

  private

  def story_params
    params.require(:story).permit(:content, :title, :subtitle)
  end

  def find_story
    Story.find(params[:id])
  end

end