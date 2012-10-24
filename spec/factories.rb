FactoryGirl.define do
  factory :user do
    name "MyString"
    email "MyString"
    provider "MyString"
    uid "MyString"
    access_token "MyText"
  end
  
  factory :idea do
    title "MyString"
    description "MyText"
    short_description "MyText"
    user_id 1
  end
  
  factory :registration do
    user
    idea
  end
end