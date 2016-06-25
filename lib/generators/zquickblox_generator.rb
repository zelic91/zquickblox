class ZquickbloxGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)

  def create_config
    template "zquickblox.rb", "config/initializers/zquickblox.rb"
  end
end
