require_relative "lib/inventory_manager/version"

Gem::Specification.new do |spec|
  spec.name        = "inventory_manager"
  spec.version     = InventoryManager::VERSION
  spec.authors     = ["Bhavani Singh Thakur"]
  spec.email       = ["bhavanisinghthakur001@gmail.com"]
  spec.homepage    = "https://github.com/bhavani-thakur/inventory-management.git"
  spec.summary     = "Summary of InventoryManager."
  spec.description = "Description of InventoryManager."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/bhavani-thakur/inventory-management.git"
  spec.metadata["changelog_uri"] = "https://github.com/bhavani-thakur/inventory-management.git"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7"
  spec.add_dependency "fast_jsonapi"
  spec.add_runtime_dependency "order_management"
  spec.add_development_dependency 'appraisal'

end
