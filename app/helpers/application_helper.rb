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

end
