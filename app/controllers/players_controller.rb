class PlayersController < ApplicationController
  respond_to :html, :json, only: [:show]

  def index
    @players = Player.all.order(:full_name)
  end

  def show
    @player = Player.find(params[:id])
    @records = PersonalRecord.includes(:game)
                             .where(player_id: @player.id)
                             .order("games.date desc")
                             .limit(params[:limit])
    
    gon.player_id = @player.id
  end
end
