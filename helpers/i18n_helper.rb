module I18nHelper
  def l10n_date(date_string)
    date = Date.parse(date_string)
    I18n.localize(date, format: '%B %Y')
  end
end
