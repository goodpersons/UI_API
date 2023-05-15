class User < ApplicationRecord
  has_secure_password
  # 验证password_confirmation
  validates_confirmation_of :password
end
