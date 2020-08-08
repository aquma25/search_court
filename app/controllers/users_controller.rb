class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  def show
    @user_image = User.disp_prof_image(current_user.image)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
