module PagesHelper
  def alert_type(type)
    case type
    when :error, "error"
      "is-danger"
    when :notice, "notice", :alert, "alert"
      "is-warning"
    when :success, "success"
      "is-success"
    when :info, "info"
      "is-info"
    else
      type.to_s
    end
  end

  def title
    base = "Mistake Log"

    if @title.blank?
      base
    else
      "#{base} | #{@title}"
    end
  end

  def sidenav_is_active(el, opts = {})
    inactive_str = 'panel-block'
    active_str = 'panel-block is-active'

    if @active_sidenav
      if @active_sidenav.to_s == el.to_s
        return active_str
      else
        return inactive_str
      end
    end

    return active_str if el.to_s == opts['action'].to_s
    return inactive_str
  end
end
