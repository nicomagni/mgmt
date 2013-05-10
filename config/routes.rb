Mgmt::Application.routes.draw do

  devise_for :users, controllers: { 
    omniauth_callbacks: "users/callbacks",
    registrations: "users/registrations", 
    passwords: "users/passwords"
  }

  post 'github/notifications/:organization/:name/issues' => "github_notifications#issues", as: 'issues_github_notifications'

  resources :projects, only: [:index, :show, :update] do
    resources :issues, only: [:update] do
      member do
        post :log_worked_hours
      end
    end
  end
  
  root :to => 'home#index'
end
