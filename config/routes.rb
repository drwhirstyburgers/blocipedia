Rails.application.routes.draw do
  resources :wikis do
    resources :collaborations, only: [:create, :destroy]
  end

  match "wikis/:wiki_id/collaborations" => "collaborations#create", :as => "create_collaboration", via: [:get, :post]

  devise_for :users

  resources :charges, only: [:new, :create]

  match "users/:id/downgrade" => "users#downgrade", :as => "downgrade_user", via: [:get, :post]

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
