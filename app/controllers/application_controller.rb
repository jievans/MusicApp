class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :logged_in
  before_filter :authorized, :only => [:destroy]

  def current_user
    @current_user ||= User.find_by_token(session[:session_token])
  end

  def logged_in
    redirect_to new_session_url if current_user.nil?
  end

  def authorized
    flash[:notices] ||= []
    unless params[:controller] == :notes
      unless @current_user.is_admin
        flash[:notices] << "You aren't allowed to delete that."
        redirect_to :back
      end
    end
  end

end
