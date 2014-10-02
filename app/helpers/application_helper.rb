module ApplicationHelper

  def format_datetime(time)
    time.strftime("%B %e, %Y at %l:%M:%S %p")
  end

  def photo_for_cat(cat)
    if cat.url.present?
      image_tag(cat.url)
    else
      image_tag(cat.cat_photo.url)
    end
  end

end
