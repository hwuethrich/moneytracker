# tell the I18n library where to find your translations 
I18n.load_path += Dir[ File.join(RAILS_ROOT, 'config', 'locales', '**', '*.{rb,yml}') ]

# set default locale to something else then :en 
I18n.default_locale = :en