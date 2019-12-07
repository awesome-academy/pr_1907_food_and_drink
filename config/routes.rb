Rails.application.routes.draw do
  # For details on the DSL available within this file, see 
  # http://guides.rubyonrails.org/routing.html

  scope "(:locale)", locale: /en|vi/ do
    root "pages#home"
    get "/about", to: "pages#about"
  end
  devise_for :users, path: '', path_names: { sign_in: 'login', 
    sign_out: 'logout', edit: "profile", confirmation: "confirmation", }, 
    controllers: { omniauth_callbacks: "omniauth_callbacks", 
    registrations: "registrations"}
end
