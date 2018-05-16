# frozen_string_literal: true

require "rails_helper"


describe "Authentication", type: :feature do
  describe "login" do
    it "valid login" do
      password = "123456"
      user = create(:user, password: password)
      user.activate!
      visit authentication_path

      within("form[action='#{authentication_path}']") do
        fill_in :email, with: user.email
        fill_in :password, with: password
        find("#remember_me").set(true)

        find('input[name="commit"]').click
      end

      expect(page).to have_current_path(root_path)
    end

    it "invalid login" do
      password = "123456"
      user = create(:user, password: password)
      visit authentication_path

      within("form[action='#{authentication_path}']") do
        fill_in :email, with: user.email
        fill_in :password, with: "1234"
        find('input[name="commit"]').click
      end

      expect(page).to have_current_path(authentication_path)
    end
  end

  describe "register" do
    context "valid" do
      it "registers forms and activates through email", background: true do
        visit authentication_register_path
        user = build(:user)

        within("form[action='#{authentication_register_path}']") do
          fill_in :email, with: user.email
          fill_in :name, with: user.name
          fill_in :password, with: "123456"
          fill_in :password_confirmation, with: "123456"

          find('input[name="commit"]').click
        end

        expect(page).to have_current_path(authentication_path)
        expect(ActionMailer::Base.deliveries).not_to be_empty

        user = User.find_by(email: user.email)
        expect(user.activation_state).to eq('pending')

        visit authentication_activate_path(user.activation_token)
        expect(page).to have_current_path(authentication_path)

        expect(user.reload.activation_state).to eq('active')
      end
    end

    it "invalid form register" do
      visit authentication_register_path

      within("form[action='#{authentication_register_path}']") do
        fill_in :email, with: "111"
        fill_in :password, with: "123456"
        fill_in :password_confirmation, with: "123456"

        find('input[name="commit"]').click
      end

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
