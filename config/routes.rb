Rails.application.routes.draw do
  devise_for :users, path: 'auth', controllers: { sessions: 'users/sessions' }

  root 'home#index'
end
