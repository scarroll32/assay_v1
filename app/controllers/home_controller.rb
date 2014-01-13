class HomeController < ApplicationController
  def index
    #render :layout => false
    @users = User.all
  end
end
