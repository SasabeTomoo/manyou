FactoryBot.define do
  factory :task do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    name { 'test_name' }
    content { 'test_content' }
  end
  factory :task_first, class: Task do
    name { 'name1' }
    content { 'content1' }
  end
  factory :task_second, class: Task do
    name { 'name2' }
    content { 'content2' }
  end
  factory :task_third, class: Task do
    name { 'name3' }
    content { 'content3' }
  end
end
