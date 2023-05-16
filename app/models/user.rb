class User < ApplicationRecord
  has_secure_password
  # 验证password_confirmation
  validates_confirmation_of :password
  # 加入这行验证 就会判断邮箱的唯一性，下次同一邮箱创建就会返回错误
  validates :eamil, uniqueness: true
  validates :password, length: { in: 5..12 }
end
