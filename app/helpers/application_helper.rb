module ApplicationHelper
  def format_datetime(time)
    time.strftime("%B %e, %Y at %l:%M:%S %p")
  end
end
