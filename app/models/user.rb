class User < ApplicationRecord
	# adds virtual attributes for authentication
  has_secure_password
  # validates email
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :role, presence: true

  enum role: {buyer: 0, seller: 1}
end
