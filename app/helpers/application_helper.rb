module ApplicationHelper
  def flash_css_class(key)
    case key.to_sym
    when :notice
      "alert alert-info"
    when :alert, :error
      "alert alert-danger"
    when :success
      "alert alert-success"
    else
      "alert alert-secondary"
    end
  end
end
