class RoomsController < ApplicationController

  before_action :set_room, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]

  def index
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:notice] = "Room was successfully created"
      redirect_to listing_room_path(@room)
    else
      flash[:notice] = "Something went wrong"
        render 'new'
    end
  end

  def listing

  end

  def pricing
  end

  def description
  end

  def photo_upload
    @photos = @room.photos
  end

  def amenities
  end

  def location
  end

  def show
  end

  def update
    if @room.update(room_params)
      flash[:notice] = "Room was successfully updated"
      redirect_to listing_room_path(@room)
    else
      #24!!!
        render 'edit'
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  # Don't have ability to change room data
  def is_authorised
    redirect_to root_path, alert: "You don't have permission" unless current_user.id == @room.user_id
  end

  def room_params
    params.require(:room).permit(:home_type, :room_type, :accommodate, :bed_room, :bath_room, :listing_name, 
      :summary, :address, :is_tv, :is_kitchen, :is_air, :is_heating, :is_internet, :price, :active)
  end
end
