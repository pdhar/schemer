require 'spec_helper'

describe User do
  
  let(:user) { FactoryGirl.create(:user) }
  let(:user_2) { FactoryGirl.create(:user) }

  let(:options) { [
										{ title: "a1"},
										{ title: "a2"},
										{ title: "a3"},
										{ title: "a4"}
									]
								}

	let(:questions) { [ 
											{ title: "q1", options_attributes: options },
											{ title: "q2", options_attributes: options }, 
											{ title: "q3", options_attributes: options }
										] 
									}

	let(:survey_params) { {
													title: "test", 
													description: "test", 
													questions_attributes: questions
											} }

	# it "should be succesful" do
	# 	survey = Survey.create(survey_params)
	# 	expect(survey).to be_present
	# 	expect(survey.questions.size).to eq(3)
	# 	expect(survey.questions[0].options.size).to eq(4)
	# end

  context "should create a survey" do
  	it "succesfully" do
  		incomplete_survey   = ::Schemer::Survey.create(survey_params)
  		survey   = ::Schemer::Survey.create(survey_params)
  		another_survey   = ::Schemer::Survey.create(survey_params)

			surveyor = user.feedbacks.create(survey: survey)
			other_surveyor = user_2.feedbacks.create(survey: incomplete_survey)
			
			option = surveyor.survey.questions[0].options[0]
			answer = surveyor.answers.create(option: option, question: option.question)
			expect(answer).to be_present

			expect(user.list_incomplete_surveys.size).to eq(2)
			
  	end
  end
end
