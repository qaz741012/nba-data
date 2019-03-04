class TeamsController < ApplicationController
  respond_to :html, :js, only: [:index, :show]

  def index
    @subareas = Subarea.all
    @subarea_id = params[:subarea_id] || "all"

    if @subarea_id != "all"
      @teams = Team.where(subarea_id: @subarea_id)
    else
      @teams = Team.all
    end
  end

  def show
    @team = Team.find(params[:id])
    @order = params[:order] || "coach_play_price"
    @players = @team.players.order(@order => "desc")
  end
end