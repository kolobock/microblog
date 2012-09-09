# Load the rails application
require File.expand_path('../application', __FILE__)

Microblog::Application.configure do
  # THIS IS A WORKAROUND FOR A I18N BUG IN RAILS!
  config.before_configuration do
    I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.yml').to_s]
    I18n.reload!
  end
end

# Initialize the rails application
Microblog::Application.initialize!
