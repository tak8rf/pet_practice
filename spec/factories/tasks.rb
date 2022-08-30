FactoryBot.define do
  factory :task do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    content { 'test_content' }
    start_time { DateTime.now }
    association :pet
  end
end
