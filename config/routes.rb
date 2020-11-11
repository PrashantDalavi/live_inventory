LiveInventory::Application.routes.draw do
  
  root 'homes#index'
  resources :products, :ware_houses

end
