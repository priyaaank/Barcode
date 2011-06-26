class MessagesController < ApplicationController

  def index
    room = Room.find(params[:room_id])
    @messages = room.messages.all_messages_after(Time.zone.now.beginning_of_day) if room
    respond_to do |format|
      format.html {render 'index'}
    end
  end

  def show
    room = Room.find(params[:room_id]) 
    if last_known_id = params[:id]
      @messages = room.messages.all_messages_from(last_known_id)
    end
    respond_to do |format|
      format.js {render :show}
    end
  end

  def create
    message = params[:message]
    room = Room.find(params[:room_id])
    if message.present?
      if current_user.messages.build(:text => message, :room => room).save
        render :status => :ok, :json => {:message => message}
      else
        render :status => 400, :json => error_json 
      end
    end
  end


  private

  def error_json
    {:error => "Your message was not received by others!"}
  end

end
