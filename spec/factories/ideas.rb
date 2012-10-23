# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :idea do
    title "MyString"
    description "MyText"
    short_description "MyText"
    user_id 1
  end
end
