# frozen_string_literal: true

class AuthenticationController < ApplicationController
  def login_post
    if login(params[:email], params[:password])
      return redirect_to_js(root_path, "Logged In!")
    end

    render_error_js("Invalid Login")
  end

  def register_post
    RegisterForm.new(params) do |form|
      unless form.valid?
        return render_form_errors_js(form)
      end

      redirect_to_js(authentication_path, "Log In With Your New Account")
    end
  end

  def logout_delete
    logout
    redirect_to_js(root_path, "Logged Out!")
  end


  class RegisterForm < FormService::Base
    strong_params :email, :name, :password, :password_confirmation

    validates :password, length: { minimum: 6, maximum: 64 }
    validates :password_confirmation, length: { minimum: 6, maximum: 64 }
    validate :passwords_match

    def passwords_match
      unless password == password_confirmation
        errors.add(:password_confirmation, "passwords don't match")
      end
    end

    process do
      self.user = User.create!(strong_params.slice(:email, :name, :password))
    end
  end
end
