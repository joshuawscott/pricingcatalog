SALESFORCE_CONFIG = YAML.load_file("#{Rails.root.to_s}/config/salesforce.yml")[Rails.env]
