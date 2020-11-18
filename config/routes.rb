LiveInventory::Application.routes.draw do
  
  root 'products#index'
  get '/bulk-upload' => 'products#bulk_upload', :as => "bulk_upload"
  post '/import' => 'products#import', :as => 'import'
  resources :ware_houses
  resources :products do
    collection { post :import }
  end

end
