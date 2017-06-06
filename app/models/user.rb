class User < ApplicationRecord
  validates :email, presence: true, uniqueness: {case_sensitivity: false}

  validates :password, length: { in: 8..72}, on: :create

  has_secure_password

  has_many :posts
  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate, params[:password])
  end


end
