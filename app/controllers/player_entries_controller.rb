class PlayerEntriesController < ApplicationController
  before_action :set_room, only: [:create]

  def create
    player_entry = @room.enter_as_player!(current_user)

    # GameStarter.new(@room).start! if @room.ready?

    render json: player_entry, status: :created
  # rescue ActiveRecord::StaleObjectError, Errors::FullHouseError
    # render_error FullHouseError.new("room#{params[:id]} was full house")
  end

  def destroy
    @player_entry = PlayerEntry.find(params[:id]).delete
    # Geister.leave_room!(player_entry: @player_entry)

    render json: @player_entry
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end
end
