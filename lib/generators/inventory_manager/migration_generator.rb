require 'rails/generators/active_record'

module InventoryManager
  class MigrationGenerator < Rails::Generators::Base
    include Rails::Generators::Migration

    # Set the base directory for templates
    source_root File.expand_path('../active_record/templates', __dir__)

    # Define the Rails migration version
    def migration_version
      "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
    end

    # Generate a unique migration number
    def self.next_migration_number(dirname)
      @last_migration_number ||= Time.now.utc.strftime("%Y%m%d%H%M%S").to_i

      # Increment by 1 for each call to ensure uniqueness
      @last_migration_number += 1
      @last_migration_number.to_s
    end

    # Create the migration files for each model
    def inventories_migration
      migration_template "create_brands.rb", "db/migrate/create_brands.rb", migration_version: migration_version
      migration_template "create_categories.rb", "db/migrate/create_categories.rb", migration_version: migration_version
      migration_template "create_products.rb", "db/migrate/create_products.rb", migration_version: migration_version
      migration_template "create_items.rb", "db/migrate/create_items.rb", migration_version: migration_version
    end
  end
end
