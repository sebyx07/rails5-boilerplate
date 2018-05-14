# frozen_string_literal: true

require "rails_helper"

describe "Account" do
  describe "update account" do
    it "successful" do
      user = login(create(:user))
      email = "aa@aa.com"
      visit account_path

      within("form[action='#{account_path}']") do
        fill_in("Email", with: email)
        fill_in("Name", with: user.name)
        find('input[type="submit"]').click
      end
      expect(page).to have_content("Account Updated!")
      expect(user.reload.email).to eq(email)
    end

    it "failed" do
      user = login(create(:user))
      email = "aa@aa"
      visit account_path

      within("form[action='#{account_path}']") do
        fill_in("Email", with: email)
        find('input[type="submit"]').click
      end
      expect(page).to have_content("Please Correct The Form")
      expect(user.reload.email).to eq(user.email)
    end
  end

  describe "update password" do
    it "successful" do
      user = login(create(:user))
      password = "12345678"
      visit account_path

      within("form[action='#{account_update_password_path}']") do
        fill_in("Password", with: password)
        fill_in("Password Confirmation", with: password)
        find('input[type="submit"]').click
      end

      expect(page).to have_content("Password Updated!")
      expect(User.authenticate(user.email, password)).to be_present
    end

    it "successful" do
      user = login(create(:user))
      password = "1234"
      visit account_path

      within("form[action='#{account_update_password_path}']") do
        fill_in("Password", with: password)
        fill_in("Password Confirmation", with: password)
        find('input[type="submit"]').click
      end

      expect(page).to have_content("Please Correct The Form")
      expect(User.authenticate(user.email, password)).to be_nil
    end
  end
end
