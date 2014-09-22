# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :schemer_survey, :class => 'Survey' do
    title "MyString"
    description "MyText"
    is_started false
    is_complete false
  end
end
