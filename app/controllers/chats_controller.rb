class ChatsController < ApplicationController

  def index

  end

  def show
    respond_to do |format|
      format.js
    end
  end

end
