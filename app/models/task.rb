class Task < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  enum priority: { 高: 0, 中: 1, 低: 2 }
end
