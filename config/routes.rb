Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'urls#index'
  get '/:shortened' => "urls#show"
  resources :urls
end
