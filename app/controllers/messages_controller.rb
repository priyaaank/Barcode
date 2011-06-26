class MessagesController < ApplicationController

  before_filter :load_room

  def index
    @messages = @room.messages.all_messages_after(Time.zone.now.beginning_of_day) if @room
    respond_to do |format|
      format.html {render 'index'}
    end
  end

  def show
    if last_known_id = params[:id]
      @messages = @room.messages.all_messages_from(last_known_id)
    end
    respond_to do |format|
      format.js {render :show}
    end
  end

  def create
    message = params[:message]
    if message.present?
      new_message = current_user.messages.build(:text => message, :room => @room)
      if new_message.save
        render :status => :ok, :json => { :sender => new_message.user.email,
                                          :message => new_message.text}
      else
        render :status => :unprocessable_entity, :text => "Your message was not received by others!"
      end
    end
  end

  private

  def load_room
    @room ||= Room.find(params[:room_id])
  end
end
