require 'spec_helper'

module Schemer
  describe Survey do
    
    context "associations" do
    	it { should have_many :questions }
  	end

  	context "creating survey with questions" do

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
  		
  		it "should be succesful" do
  			survey = Survey.create(survey_params)
  			expect(survey).to be_present
  			expect(survey.questions.size).to eq(3)
  			expect(survey.questions[0].options.size).to eq(4)
  		end
  	end

  end
end
