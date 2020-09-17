FactoryBot.define do
  factory :user do
    name { '佐藤一' }
    email { 'satou@gmail.com' }
    password { 'satousan' }
    password_confirmation { 'satousan' }
  end
end
