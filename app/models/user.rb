class User < ApplicationRecord
  validates :username, presence: true,
                       uniqueness: { case_sensive: false },
                       length: { minimum: 3, maximum: 25 }
  validates :accepted_terms, acceptance: true
  has_many :messages
  has_secure_password
end
