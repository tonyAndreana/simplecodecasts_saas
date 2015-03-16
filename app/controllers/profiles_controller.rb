class ProfilesController < ApplicationController
  def new
    # form where a user can fill out their own profile
    @user = User.find( params[:user_id] )
    @profile = @user.build_profile
  end
  
  def create
    @user = User.find( params[:user_id] ) # This is taken from the URL which is carried over
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile Updated!"
      redirect_to user_path( params[:user_id] )
    else
      render action: :new
    end   
  end
  
  private
  # This is the whitelisting for this form
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
  end
  
end