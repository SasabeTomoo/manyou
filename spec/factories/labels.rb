FactoryBot.define do
  factory :label_first, class: Label do
    id   { 1 }
    name { '開発' }
  end
  factory :label_second, class: Label do
    id   { 2 }
    name { '運用' }
  end
end
