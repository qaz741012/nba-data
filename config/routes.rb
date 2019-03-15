Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :players do
    member do
      get :export_csv
    end
  end

  resources :teams

  resources :games

  get :daily, to: "datas#daily"
end
