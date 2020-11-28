FactoryBot.define do
  factory :review do
    
    rev_1           { :"最初よりも" }
    rev_2           { :"朝早く起きる"}
    rev_3           { :"聴く学習"}
    rev_4           { :"タイマーの使用"}

    association :user
    association :prep
    association :task
    association :active
  end
end
