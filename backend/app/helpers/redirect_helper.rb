# frozen_string_literal: true

module RedirectHelper
  def redirect_to_js(path, message)
    respond_to do |format|
      format.html { redirect_to(path) }
      format.js do
        render "js_helpers_redirect/_visit", locals: { path: path, message: message }, formats: [:js]
      end
    end
  end

  def render_form_errors_js(model)
    render "js_helpers_redirect/_form_errors", locals: { model: model }, status: 422, formats: [:js]
  end

  def render_error_js(message)
    render "js_helpers_redirect/_error", locals: { message: message }, status: 422, formats: [:js]
  end

  def render_ok_js(message)
    render "js_helpers_redirect/_ok", locals: { message: message }, formats: [:js]
  end
end
