Rails.application.routes.draw do
  resources :people
  get "welcome/say_hello" => "tosaysomething#say"
  get "welcome/" => "tosaysomething#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match ':controller(/:action(/:id(.:format)))', :via => :all
end
