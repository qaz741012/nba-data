class PlayersController < ApplicationController
  respond_to :html, :json, only: [:show]

  before_action :set_player, only: [:show, :export_csv]

  def index
    @players = Player.all.order(:full_name)
  end

  def show
    @records = PersonalRecord.includes(:game)
                             .where(player_id: @player.id)
                             .order("games.date desc")
                             .limit(params[:limit])
    
    @opponents = Team.where.not(id: @player.team)
    gon.player_id = @player.id
  end

  def export_csv
    send_data @player.to_csv, filename: "#{@player.full_name}.csv"
  end

  private
  def set_player
    @player = Player.find(params[:id])
  end
end
