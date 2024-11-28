Rails.application.routes.draw do
  mount InventoryManager::Engine => "/inventory_manager"
end
