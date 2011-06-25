class HomeController < ApplicationController

  before_filter :authenticate_user!

  def show
    puts "*"*100
    puts current_user
    puts "*"*100
  end

end
