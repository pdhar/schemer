# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :schemer_answer, :class => 'Answer' do
    surveyor_id 1
    question_id 1
    option_id 1
  end
end
