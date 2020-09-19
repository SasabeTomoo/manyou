class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  # こちらはidsを使うために必要
  has_many :tasks, through: :labellings
  # こちらは通常の多対多（viewでのラベルの一覧表示）のために必要
  has_many :labellings_tasks, through: :labellings, source: :task
end
