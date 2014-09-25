module Schemer
  class SurveySerializer < ActiveModel::Serializer
    attributes :id, :questions

    def questions
	    object.questions.map do |question|
	      QuestionSerializer.new(question, scope: scope, root: false)
	    end
	  end
  end
end
