class ApplicationController < ActionController::Base
	#protect_from_forgery with::exception
	before_action :check_user
  include SessionsHelper
  def hello
  	render html:"hello,world"
  end
end
