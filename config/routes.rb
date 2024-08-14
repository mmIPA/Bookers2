Rails.application.routes.draw do
  root to: "homes#top"
  get 'about', to: 'homes#about', as: :about  

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :index, :show, :destroy, :edit, :create],path_names: { show: 'book' }
  resources :users, only: [:update, :edit, :show, :index]
end
