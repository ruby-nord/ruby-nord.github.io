module MetaTagsHelper
  def meta_tag_description
    current_page.data.description || data.settings.site.description
  end

  def meta_tag_image
    host_url(image_path('logos/ruby-nord-red.png'))
  end

  def meta_tag_page_title
    if current_page.data.title
      "#{current_page.data.title} ▾ #{data.settings.site.title}"
    else
      data.settings.site.title
    end
  end

  def meta_tag_site_name
    data.settings.site.title
  end

  def meta_tag_title
    current_page.data.title || data.settings.site.title
  end

  def meta_tag_twitter
    "@#{data.settings.social.twitter.name}"
  end

  def meta_tag_url
    host_url(current_page.url)
  end
end
