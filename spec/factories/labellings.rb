FactoryBot.define do
  factory :labelling_first, class: Labelling do
    task_id { 1 }
    label_id { 1 }
  end
  factory :labelling_second, class: Labelling do
    task_id { 1 }
    label_id { 2 }
  end
end
