module UrlsHelper
  def host_url(url)
    URI.join(data.settings.site.url, url)
  end
end
