FactoryBot.define do
    factory :pet do
      # 下記の内容は実際に作成するカラム名に合わせて変更してください
      name { 'alen' }
      content { 'alen' }
      association :family
    end
  end