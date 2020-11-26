FactoryBot.define do
  factory :task do
    task_1           { :"3日間" }
    task_2           { :"日記をつける"}
    task_3           { :"一言だけ"}

    association :user
    association :prep
    
  end
end
