class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(
          params[:user][:username],
          params[:user][:password]
    )

    if user.nil?
      render :new
    else
      user.reset_session_token!
      self.current_user = user
      redirect_to cats_url
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
