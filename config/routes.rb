Rails.application.routes.draw do
  resources :ad_users,  :only => [:index] do
    collection do
      post :index
    end
  end

  mount Wobauth::Engine, at: '/auth'

  root 'ad_users#index'

end
