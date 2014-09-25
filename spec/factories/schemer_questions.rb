# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :schemer_question, :class => 'Questions' do
    title "MyText"
    survey_id 1
  end
end
