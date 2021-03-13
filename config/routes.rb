Rails.application.routes.draw do
  root :to => 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, :only => [:index, :create, :edit, :show, :update, :destroy]
  # get '/books' => 'books#new'
end
