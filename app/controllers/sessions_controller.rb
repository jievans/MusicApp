class SessionsController < ApplicationController
  skip_before_filter :logged_in, :only => [:create, :new]

  def create
    #log in
    user = User.find_by_email(params[:email])
    if params[:password] == user.password && user.activated
      session[:session_token] = user.token

      redirect_to user_url(user)
    else
      flash[:notices] ||= []
      flash[:notices] << "Login failed"

      redirect_to new_session_url
    end
  end

  def destroy

  end

  def new
    render :new
  end

end
