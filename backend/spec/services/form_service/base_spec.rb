# frozen_string_literal: true


require "rails_helper"

describe FormService::Base do
  let :klass do
    Class.new(described_class) do
      validates :password, presence: true

      strong_params :email, :password

      process do
        User.create!(strong_params)
      end
    end
  end


  it "strong_params" do
    expect(klass.strong_params).to eq(%w(email password))
  end

  describe "process" do
    it "valid" do
      attributes = build(:user).attributes.merge("password" => "1234")
      expect do
        klass.new(attributes) do |form|
          expect(form.valid?).to be_truthy
        end
      end.to change { User.count }
    end

    context "invalid" do
      it "password missing" do
        attributes = build(:user).attributes
        expect do
          klass.new(attributes) do |form|
            expect(form.valid?).not_to be_truthy
            expect(form.errors).to be_present
          end
        end.not_to change { User.count }
      end

      it "email missing" do
        attributes = build(:user).attributes.merge("password" => "1234")
        attributes.delete("email")
        expect do
          klass.new(attributes) do |form|
            expect(form.valid?).not_to be_truthy
            expect(form.errors).to be_present
          end
        end.not_to change { User.count }
      end
    end
  end
end
