class SessionsController < ApplicationController

  layout "login"
  skip_before_action :check_user, only: [:new, :create]

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
  	log_out if logged_in? #SessionsHelper中的方法
    redirect_to root_path
  end

end
