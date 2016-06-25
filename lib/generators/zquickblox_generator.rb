class ZQuickbloxGenerator < Rails::Generators::Base
  def create_config
    template "zquickblox.rb", "config/initializers/zquickblox.rb"
  end
end
