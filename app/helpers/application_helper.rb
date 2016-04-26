module ApplicationHelper
  FLASH_CLASSES = {
    :success => "success",
    :notice => "success",
    :flash => "info",
    :message => "info",
    :alert => "warning",
    :error => "danger"
  }

  def render_flash_alerts
    render 'layouts/shared/alerts' if !flash.empty?
  end

  def alert_class_for(status)
    FLASH_CLASSES[status.to_sym]
  end
end
