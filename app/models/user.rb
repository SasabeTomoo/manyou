class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  before_validation { email.downcase! }
  # before_destroy :least_one
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  private

  # def least_one
  #   if User.all.where(admin: true).count == 1
  #     errors.add :base, '少なくとも一人、管理者ユーザーが必要です'
  #     throw :abort
  #   end
  # end
end
