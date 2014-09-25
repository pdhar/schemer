require 'spec_helper'

describe User do
  
  let(:user) { FactoryGirl.create(:user) }
  let(:options) { [
										{ title: "a1"},
										{ title: "a2"},
										{ title: "a3"},
										{ title: "a4"}
									]
								}

	let(:questions) { [ 
											{ title: "q1", options_attributes: options },
											{ title: "q2" }, 
											{ title: "q3" }
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

	before do
		::Schemer::Survey.create(survey_params)
	end

  context "should create a survey" do
  	it "succesfully" do
  		binding.pry
  	end
  end
end
