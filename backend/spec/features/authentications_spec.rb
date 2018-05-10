# frozen_string_literal: true

require "rails_helper"


describe "Authentication", type: :feature do
  describe "login" do
    it "valid login" do
      password = "123456"
      user = create(:user, password: password)
      visit authentication_path

      fill_in :email, with: user.email
      fill_in :password, with: password
      find("#remember_me").set(true)

      find('input[name="commit"]').click


      expect(page).to have_current_path(root_path)
    end

    it "invalid login" do
      password = "123456"
      user = create(:user, password: password)
      visit authentication_path

      fill_in :email, with: user.email
      fill_in :password, with: "1234"
      find('input[name="commit"]').click

      expect(page).to have_current_path(authentication_path)
    end
  end

  describe "register" do
    it "valid" do
      visit authentication_register_path
      user = build(:user)


      fill_in :email, with: user.email
      fill_in :password, with: "123456"
      fill_in :password_confirmation, with: "123456"

      find('input[name="commit"]').click

      expect(page).to have_current_path(authentication_path)
    end

    it "invalid" do
      visit authentication_register_path

      fill_in :email, with: "111"
      fill_in :password, with: "123456"
      fill_in :password_confirmation, with: "123456"

      find('input[name="commit"]').click

      expect(page).to have_current_path(authentication_register_path)
    end
  end

  describe "logout" do
    it "logouts user" do
      login(create(:user))

      find("#authentication-dropdown").click
      find("a", text: "Logout").click

      expect(page).to have_current_path(root_path)
    end
  end
end
