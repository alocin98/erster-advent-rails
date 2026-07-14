# Pagy uses its own i18n (independent of Rails I18n); load the German
# locale so the nav renders "Zurück / Weiter" instead of "Prev / Next".
Pagy::I18n.load(locale: "de")
