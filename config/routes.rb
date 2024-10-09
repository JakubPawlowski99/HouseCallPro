Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "home#index"

  scope '/api' do
    post :assign, to: 'devices#assign'
    post :unassign, to: 'devices#unassign'
  end
   get '/devices', to: 'devices#index'
end