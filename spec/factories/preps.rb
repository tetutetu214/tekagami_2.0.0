FactoryBot.define do
  factory :prep do
      now              { :"悲しい" }
      target           { :"わくわくする"}
  
      association :user
  end
end
