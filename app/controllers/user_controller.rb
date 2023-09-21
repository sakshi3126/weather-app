class UserController < ApplicationController
  require 'rest-client'
  require 'json'

  def index

  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to '/login'
    else
      flash[:notice]="Please try again"
      redirect_to '/signup'
    end
  end

  def get_weather
    # render json: params[:city]
    if params[:city]
      @response = RestClient.get("https://api.openweathermap.org/data/2.5/weather?q=#{params[:city]}&appid=ff2b2c7fbdef209150a13860f16c38e6&units=metric")
      render json: @response
    end
  rescue RestClient::ExceptionWithResponse => e
    flash[:error] = 'City not found'
  end

  def new

  end

  private

   def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password_digest)
    end
end
