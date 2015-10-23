class ProfilesController < ApplicationController
  def new
    @user = User.find(params[:user_id]) # determines who's logged in
    @profile = @user.build_profile
  end
end