# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :schemer_surveyor, :class => 'Surveyor' do
    survey_id 1
  end
end
