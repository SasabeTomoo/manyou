FactoryBot.define do
  factory :task do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    name { 'test_name' }
    content { 'test_content' }
  end

  factory :task_first, class: Task do
    name { 'name1' }
    content { 'content1' }
    expired_at { 20200903 }
    priority { 0 }
    after(:build) do |user|
      task.user = FactoryBot.create(:user)
    end
  end
  factory :task_second, class: Task do
    name { 'name2' }
    content { 'content2' }
    expired_at { 20200902 }
    priority { 2 }
    after(:build) do |user|
      task.user = FactoryBot.create(:user)
    end
  end
  factory :task_third, class: Task do
    name { 'name3' }
    content { 'content3' }
    expired_at { 20200901 }
    priority { 1 }
    user_id  { 1 }
    after(:build) do |user|
      task.user = FactoryBot.create(:user)
    end
  end


end
