Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  %w[404 401 500 503].each do |code|
    get code, to: 'errors#show', code: code
  end

  resources :faqs,        only: %i[index]
  resources :posts,       only: %i[index show]
  resources :contacts,    only: %i[new create]

  constraints format: :js do
    resources :subscribers, only: %i[create]
  end

  get :pricing, to: 'home#pricing', as: :pricing

  match :contacts, to: 'contacts#new', via: %i[get]

  root 'home#index'
end
