class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  before_validation { email.downcase! }
  # エラーになるので、とりあえずenumは飛ばしています
  # enum admin: { 一般: false, 管理者: true }
  before_destroy :least_one1
  before_update :least_one2
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  private
  def least_one1
    throw :abort if User.where(admin: true).count == 1 && self.admin == true
  end
  def least_one2
    throw :abort if User.where(admin: true).count == 1 && self.admin == false
  end
end
