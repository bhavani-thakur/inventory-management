require 'rails/generators'
require 'rails/generators/active_record'


module InventoryManager
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def run_migration_generator
      say_status("info", "Running migration generator...", :blue)
      generate "inventory_manager:migration"
    end

    # def run_controller_generators
    #   say_status("info", "Running controller generators...", :blue)
      
    #   # List of controllers to generate
    #   controllers = %w[brands categories brand_categories items]

    #   controllers.each do |controller|
    #     generate "controller", "inventory_manager/#{controller} --skip-routes --no-helper --no-assets"
    #   end
    # end

    # def run_model_generators
    #   say_status("info", "Running model generators...", :blue)
    #   # List of controllers to generate
    #   modules = %w[brands categories brand_categories items]

    #   modules.each do |controller|
    #     generate "model", "inventory_manager/#{controller} --skip-routes --no-helper --no-assets"
    #   end
    # end

    def add_routes
      route "mount InventoryManager::Engine, at: '/'"
    end

    def display_completion_message
      say_status("info", "Installation complete! Migrations, models, and controllers have been generated.", :green)
    end
  end
end
