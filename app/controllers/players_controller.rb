class PlayersController < ApplicationController
  respond_to :html, :json, only: [:show]

  before_action :set_player, only: [:show, :export_csv]

  def index
    @players = Player.all.order(:full_name)
  end

  def show
    @all_opponents = Team.where.not(id: @player.team)
    @limit = player_params[:limit]

    if player_params[:selected_opponents_id].present?
      @selected_opponents_id = player_params[:selected_opponents_id]
    else
      @selected_opponents_id = @all_opponents.pluck(:id)
    end

    @records = PersonalRecord.joins(:player, :game)
                             .where(player_id: @player.id)
                             .merge(Game.where(home_team_id: @selected_opponents_id).or(Game.where(away_team_id: @selected_opponents_id)))
                             .order("games.date desc")
                             .limit(@limit)
    
    gon.player_id = @player.id
  end

  def export_csv
    if player_params[:selected_opponents_id].length != 29
      opponents_name = player_params[:selected_opponents_id].map { |id| Team.find(id).abbr_name }
                                                            .join(",")
    else
      opponents_name = nil
    end

    filename = "#{@player.full_name}"
    filename += "_vs. #{opponents_name}" if opponents_name
    filename += "_recent #{player_params[:limit]} games" if player_params[:limit].present?
    filename += ".csv"
    send_data @player.to_csv(
      limit: player_params[:limit], 
      selected_opponents_id: player_params[:selected_opponents_id]
    ), filename: filename
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    if params[:player].present?
      params.require(:player).permit(:limit, selected_opponents_id: [])
    else
      {}
    end
  end
end
