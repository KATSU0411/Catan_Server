class RoomsController < ApplicationController

  def index
    rooms = Room.where.not(status: :finished).includes(player_entries: [:user])

    render json: rooms, each_serializer: RoomSerializer, adapter: :json
  end

  def show
    @room = Room.find(params[:id])
    render json: @room
  end

  def create
    # room = RoomFactory.new(current_user).create!
    room = Room.create!(status: :waiting)

    room.player_entries.create!(user: current_user)
    player_entry = PlayerEntry.find_by(room: room, user: current_user)

    render json: player_entry, status: :created
  end


end
