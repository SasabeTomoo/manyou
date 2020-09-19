class Task < ApplicationRecord
  has_many :labellings, dependent: :destroy
  # こちらはidsを使うために必要
  has_many :labels, through: :labellings
  # こちらは通常の多対多（viewでのラベルの一覧表示）のために必要
  has_many :labellings_labels, through: :labellings, source: :label
  belongs_to :user
  validates :name, presence: true
  validates :content, presence: true
  enum priority: { 高: 0, 中: 1, 低: 2 }

  # scope :name_search, -> (query) { where('name LIKE ?',  "%#{query}%") }
  # expired_atカラムを降順で取得する
  # scope :sorted, -> { order(expired_at: :desc) }
  # deletedカラムがfalseであるものを取得する
  # scope :active, -> { where(status: params[:search2]) }
end
