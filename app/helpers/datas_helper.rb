module DatasHelper
  def go_game_detail(game, finish)
    return if !finish

    current_game = Game.find_by_stat_id(game[:stat_id])
    return if !current_game

    path = game_path(current_game)
    return "wating for data" if !path_exist?(path)
    
    link_to "Detail", path
  end
end
