module ApplicationHelper

  def toast_alert
    alerts = ["success", "info", "warning", "danger"]
    alerts.each do |alert|
      if flash[alert]
        return "<div class='alert alert-#{alert} alert-dismissible fade show' role='alert'>
          <%= #{flash[alert]} %>
          <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
            <span aria-hidden='true'>&times;</span>
          </button>
        </div>".html_safe
      end
    end
    return
  end

  def path_exist?(path)
    begin
      Rails.application.routes.recognize_path(path)
    rescue
      return false
    end
    true
  end

  def show_game_header
    if params[:controller] == "players" && params[:action] == "show"
      "Date"
    elsif params[:controller] == "games" && params[:action] == "show"
      "Player"
    end
  end

  def show_game_column(record)
    if params[:controller] == "players" && params[:action] == "show"
      record.game.date.strftime("%Y-%m-%d")
    elsif params[:controller] == "games" && params[:action] == "show"
      record.player.full_name
    end
  end

  def show_opponent(record)
    player_team = record.player.team
    racing_teams = record.game.racing_teams

    racing_teams.each do |racing_team|
      if player_team != racing_team
        return racing_team.abbr_name
      end
    end
  end

end
