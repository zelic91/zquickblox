class InitializerGenerator < Rails::Generators::Base
  def create_config
    template "zquickblox", "config/initializers/zquickblox.rb"
  end
end
