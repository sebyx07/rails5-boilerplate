# frozen_string_literal: true

Rails.application.routes.draw do
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
