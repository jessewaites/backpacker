class StoriesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @story = current_user.stories.build(story_params)
    if @story.save
      flash[:success] = "Story created!"
      redirect_to root_url
    else
      render '/'
    end
  end

  def destroy
  end

  private

    def story_params
      params.require(:micropost).permit(:content)
    end
end