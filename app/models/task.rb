class Task < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :name, presence: true
  validates :content, presence: true
  enum priority: { 高: 0, 中: 1, 低: 2 }

  # scope :name_search, -> (query) { where('name LIKE ?',  "%#{query}%") }
  # expired_atカラムを降順で取得する
  # scope :sorted, -> { order(expired_at: :desc) }
  # deletedカラムがfalseであるものを取得する
  # scope :active, -> { where(status: params[:search2]) }
end
