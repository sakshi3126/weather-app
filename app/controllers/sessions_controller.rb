class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.password_digest == (params[:password_digest])
      session[:user_id] = user.id
      flash[:notice]="Login successful"
      redirect_to '/'
    else
      flash[:notice]="Invalid Email or Password"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice]="Logged Out"
    redirect_to '/login'
  end
end
