Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'urls#index'
  resources :urls

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :urls
    end
  end

  get '/:shortened' => "urls#shortened"
end
