Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'exchange_rates/index'
      get 'exchange_rates/show'
      get 'exchange_rates/create'
      get 'exchange_rates/update'
      get 'exchange_rates/destroy'

      get 'currencies', to: 'currencies#index'
      get 'currencies/show'
      get 'currencies/create'
      get 'currencies/update'
      get 'currencies/destroy'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
