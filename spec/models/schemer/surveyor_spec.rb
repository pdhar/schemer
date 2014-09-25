require 'spec_helper'

module Schemer
  describe Surveyor do
  	
  	context "associations" do
    	it { should have_many :answers }
    	it { should belong_to :survey }
  	end

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

		let(:surveyor_params) {

													}

		it "should create survey with answers" do
			survey = Survey.create(survey_params)
			surveyor = Surveyor.create({survey: survey})
			option = surveyor.survey.questions[0].options[0]

			answer = surveyor.answers.create(option: option, question: option.question)
			expect(answer).to be_present
		end
  end
end
