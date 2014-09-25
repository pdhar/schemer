# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :schemer_option, :class => 'Option' do
    title "MyText"
    question_id 1
  end
end
