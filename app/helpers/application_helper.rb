module ApplicationHelper
  def more_zero(c)
    if c == 0
      return "btn-default"
    elsif c < 6
      return "btn-success"
    else
      return "btn-primary"
    end
  end
end
