FactoryBot.define do
  factory :user, class: User do
    id  { 1 }
    name { '佐藤一' }
    email { 'satou@gmail.com' }
    password { 'satousan' }
    password_confirmation { 'satousan' }
    admin { false }
  end
end
