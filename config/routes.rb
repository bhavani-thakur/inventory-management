InventoryManager::Engine.routes.draw do
  resources :brands
  resources :categories
  resources :brand_categories
  resources :items do
    collection do
      get :low_stock
    end
  end
end
