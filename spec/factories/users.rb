FactoryBot.define do
  factory :user, class: User do
    id  { 1 }
    name { '佐藤一' }
    email { 'satou@gmail.com' }
    password { 'satousan' }
    password_confirmation { 'satousan' }
    admin { false }
  end

  factory :user2, class: User do
    id  { 2 }
    name { '中村花子' }
    email { 'nakamura@gmail.com' }
    password { 'nakamurasan' }
    password_confirmation { 'nakamurasan' }
    admin { false }
  end
end
