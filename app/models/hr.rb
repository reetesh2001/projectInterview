class Hr < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :status, presence: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness:true
  validates :phone_number, presence: true,uniqueness:true, format: { with: /\A\d{10}\z/, message: "must be 10 digits long" }
end
