# frozen_string_literal: true

class AccountController < ApplicationController
  before_action :require_login

  def index
    @user = current_user
  end

  def update
    UpdateEmail.new(params.merge(user: current_user)) do |form|
      unless form.valid?
        return render_form_errors_js(form)
      end

      render_ok_js("Account Updated!")
    end
  end

  def update_password
    ChangePassword.new(params.merge(user: current_user)) do |form|
      unless form.valid?
        return render_form_errors_js(form)
      end
      render_ok_js("Password Updated!")
    end
  end

  class UpdateEmail < FormService::Base
    strong_params :email

    process do
      user.update!(strong_params)
    end
  end

  class ChangePassword < AuthenticationController::RegisterForm
    strong_params :password, :password_confirmation

    process do
      user.update!(strong_params.slice(:password))
    end
  end
end
