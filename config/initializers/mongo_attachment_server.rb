MONGO_ATTACHMENT_SERVER = YAML.load_file(Rails.root.join('config', 'mongo_attachment_server.yml'))[Rails.env].freeze

