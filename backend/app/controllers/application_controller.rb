# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include RedirectHelper

  def require_login
    unless current_user.present?
      redirect_to_js(authentication_path, "Login Required")
    end
  end
end
