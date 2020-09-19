class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :labellings_tasks, through: :labellings, source: :task
  has_many :tasks, through: :labellings
end
