Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      #exchange rates
      get 'exchange_rates', to: 'exchange_rates#index'
      get 'exchange_rates/base/:base/to/:to', to: 'exchange_rates#get_rates'
      get 'exchange_rates/base/:base/to/:to/at/:date', to: 'exchange_rates#get_rate_for_date'
      post 'exchange_rates', to: 'exchange_rates#create'
      delete 'exchange_rates/:id', to: 'exchange_rates#destroy'

      #currencies
      get 'currencies', to: 'currencies#index'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
