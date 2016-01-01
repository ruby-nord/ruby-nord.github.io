module LangHelper
  def active_lang?(lang)
    lang == I18n.locale
  end

  def head_lang_links
    links = []

    links << "<link href=\"#{lang_url(I18n.locale)}\" rel=\"canonical\">"

    langs.each do |lang|
      next if lang == I18n.locale
      links  << "<link href=\"#{lang_url(lang)}\" hreflang=\"#{lang}\" rel=\"alternate\" />"
    end

    links.join
  end

  def lang_path(lang)
    if lang == I18n.default_locale # no prefix for default locale
      current_page.url.gsub("/#{I18n.locale}/", "/")
    elsif I18n.locale != I18n.default_locale
      current_page.url.gsub("/#{I18n.locale}/", "/#{lang}/")
    else
      "/#{lang}#{current_page.url}"
    end
  end

  def lang_url(lang)
    host_url(lang_path(lang))
  end
end
