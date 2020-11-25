FactoryBot.define do
  factory :user do
    nickname              { :"たぬぅ" }
    email                 { :"bbb@bbb"}
    password              { :bbbbbb2 }
    password_confirmation { password }
  end
end
