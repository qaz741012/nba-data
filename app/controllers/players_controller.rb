class PlayersController < ApplicationController
  def index
    @players = Player.all.order(:full_name)
  end
end
