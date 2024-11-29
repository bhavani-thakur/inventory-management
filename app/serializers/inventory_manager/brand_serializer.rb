module InventoryManager
  class BrandSerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :name, :manufacturer, :manufacturer_email, :manufacturer_office
  end
end
