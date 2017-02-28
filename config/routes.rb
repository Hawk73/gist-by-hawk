Rails.application.routes.draw do
  resources :snippets
  devise_for :users, path: 'auth', controllers: { sessions: 'users/sessions' }

  root 'home#index'

  resources :snippets do

  end
end
