FactoryBot.define do
    factory :group do
      # 下記の内容は実際に作成するカラム名に合わせて変更してください
      association:user
      association:family
    end
end