class RoomsController < ApplicationController
	def create
    @room = Room.new(params_room)
    @room.user_id = current_user.id
    @room.save
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id, :product_id => @room.product_id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id, :product_id).merge(:room_id => @room.id))
    redirect_to "/rooms/#{@room.id}"
  end
  

  def show
    @room = Room.find(params[:id])
    @messages = Message.where(room_id: params[:id])
    @message = Message.new
    @entries = @room.entries
    # 	if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
    #   	@messages = @room.messages
    # 		@message = Message.new
    #   	@entries = @room.entries
    # 	end
  end
  
  def index
    @product = Product.find(params[:id])
  end

  def new
  
  end
  
  private
  
  def params_room
    params.require(:room).permit(:user_id, :product_id)
  end
  
  def star
  end
end
