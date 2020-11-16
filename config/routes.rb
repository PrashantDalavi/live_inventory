LiveInventory::Application.routes.draw do
  
  root 'products#index'
  resources :products, :ware_houses

end
