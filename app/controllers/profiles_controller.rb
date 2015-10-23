class ProfilesController < ApplicationController
  def new
    @user = User.find(params[:user_id]) # determines who's logged in
    @profile = Profile.new
  end

  def create
    @user = User.find(params[:user_id]) # geting this from the url
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = 'Profile Updated'
      redirect_to user_path(params[:user_id])
    else
      flash[:error] = 'Update Failed'
      render action: :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  private
  def profile_params
    params.require(:profile).permit(:first_name,:last_name,:job_title,:phone_number,:contact_email,:description)
  end
end