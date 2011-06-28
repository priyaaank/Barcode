class RoomsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(params[:room])
    if @room.save
      redirect_to room_messages_path(:room_id => @room.id)
    else
      flash.now[:error] = @room.errors
      render :new
    end
  end

end
