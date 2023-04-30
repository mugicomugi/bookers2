Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => "homes#about",as: :about
  resources :books
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 resources :users, only:[:show, :index, :edit, :update, :new, :create]
end
