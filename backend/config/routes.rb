# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  is_admin = -> (request) { User.find_by(id: request.session[:user_id])&.admin? }

  namespace :admin, constraints: is_admin do
    resources :users
    root to: "users#index"
  end

  mount Sidekiq::Web => "/admin/sidekiq", constraints: is_admin
  comfy_route :cms_admin, path: "/admin/blog"
  comfy_route :cms, path: "/blog"

  root "static#landing"

  namespace :authentication do
    get "", action: :login
    post "", action: :login_post
    delete "", action: :logout_delete

    get "/register", action: :register, as: :register
    post "/register", action: :register_post
  end

  namespace :account do
    get "", action: :index
    post "", action: :update
    post "update_password", action: :update_password, as: :update_password
  end
end
