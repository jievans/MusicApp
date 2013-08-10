class UsersController < ApplicationController

  skip_before_filter :logged_in, :only => [:new, :create, :activate]

  def show
    @user = User.find_by_id(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    user = User.create!(params[:user])
    UserMailer.activation_email(user).deliver!
    render :text => "Check your email to activate your account!"
  end

  def activate
    user = User.find_by_activation_token(params[:activation_token])
    user.activated = true
    user.save!

    redirect_to new_session_url
  end


end
