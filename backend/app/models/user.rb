# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!

  enum role: [:basic, :admin]

  validates :email, presence: true, uniqueness: true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  validates :name, presence: true
  validates :role, presence: true
end
