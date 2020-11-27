FactoryBot.define do
  factory :active do

    way_1           { :"仕事帰り" }
    way_2           { :"電車で"}
    way_3           { :"よくなりそう"}

    association :user
    association :prep
    association :task
    
  end
end
