APP_CONFIG = YAML.load_file("#{::Rails.root.to_s}/config/application.yml")
APP_TRACKING = YAML.load_file("#{::Rails.root.to_s}/config/tracking.yml")[RAILS_ENV]
