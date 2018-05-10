# frozen_string_literal: true

module AuthenticationForFeatureRequest
  def login(user)
    visit authentication_path
    fill_in :email, with: user.email
    fill_in :password, with: "123456"
    find('input[name="commit"]').click
    expect(page).to have_current_path(root_path)
    user
  end
end
