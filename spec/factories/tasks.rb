FactoryBot.define do
  factory :task do
    now              { :"悲しい" }
    target           { :"わくわくする"}

    association :user
    
  end
end
