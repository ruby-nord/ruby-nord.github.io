module MetaTagsHelper
  def meta_tag_description
    if current_page.data.i18n_scope
      I18n.t("#{current_page.data.i18n_scope}.meta.description")
    else
      data.settings.site.description
    end
  end

  def meta_tag_image
    host_url(image_path('logos/ruby-nord-red.png'))
  end

  def meta_tag_page_title
    if current_page.data.i18n_scope
      page_title = I18n.t("#{current_page.data.i18n_scope}.meta.page_title")

      "#{page_title} ▾ #{data.settings.site.title}"
    else
      data.settings.site.title
    end
  end

  def meta_tag_site_name
    data.settings.site.title
  end

  def meta_tag_title
    if current_page.data.i18n_scope
      I18n.t("#{current_page.data.i18n_scope}.meta.page_title")
    else
      data.settings.site.title
    end
  end

  def meta_tag_twitter
    "@#{data.settings.social.twitter.name}"
  end

  def meta_tag_url
    host_url(current_page.url)
  end
end
