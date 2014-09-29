require 'spec_helper'

describe User do
  
  let(:user) { User.create(name: "test", email: "test") }
  let(:user_2) { User.create(name: "test", email: "test") }

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
  		incomplete_survey = ::Schemer::Survey.create(survey_params)
  		survey   					= ::Schemer::Survey.create(survey_params)
  		another_survey    = ::Schemer::Survey.create(survey_params)

			expect(user.list_incomplete_surveys.size).to eq(3)

			surveyor 			 	 = user.start_or_complete_survey(survey)
			other_surveyor 	 = user_2.start_or_complete_survey(incomplete_survey)
			another_surveyor = user_2.start_or_complete_survey(another_survey)

			expect(another_surveyor).to eq(user_2.start_or_complete_survey(another_survey))
			
			option = surveyor.survey.questions[0].options[0]
			answer = user.mark_survey_question(surveyor, option)

			expect(user.list_incomplete_surveys.size).to eq(3)
			expect(user.list_unanswered_questions(surveyor).size).to eq(2)

			option = surveyor.survey.questions[1].options[1]
			answer = user.mark_survey_question(surveyor, option)
			expect(user.list_incomplete_surveys.size).to eq(3)
			expect(user.list_unanswered_questions(surveyor).size).to eq(1)

			option = surveyor.survey.questions[2].options[2]
			answer = user.mark_survey_question(surveyor, option)
			expect(user.list_unanswered_questions(surveyor).size).to eq(0)

			expect(user.list_incomplete_surveys.size).to eq(2)
			expect(surveyor.reload.is_completed).to eq(true)
			expect(answer).to be_present

			expect(user.list_incomplete_surveys.size).to eq(2)
			
  	end
  end
end
