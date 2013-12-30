# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inquiry do
    first_name "Paul"
    last_name "Dornfeld"
    email "pdornfel@gmail.com"
    subject "Very Important"
    description "blah"
  end
end
