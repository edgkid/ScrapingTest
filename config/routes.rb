Rails.application.routes.draw do
  devise_for :users
  #get 'main/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "main#home"

  devise_scope :user do
    get '/users/sign_out' => 'sessions#destroy'
  end

end
