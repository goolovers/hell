class SessionsController < ApplicationController

  layout "login"

  def new
  end

  def create
  	user = User.find_by(user_code: params[:session][:user_code].downcase)
  	if user && user.password == params[:session][:password]
  		log_in user
  		redirect_to '/home'
  	else
  		flash.now[:danger] = '用户名或密码错误'
  		render 'new'
  	end
  end

  def destroy
  	
  end

end
