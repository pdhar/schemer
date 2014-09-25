module Schemer
  module ActsAsSurveyor

    extend ActiveSupport::Concern

    module ClassMethods
    	def acts_as_surveyor(options={})
    		include Schemer::ActsAsSurveyor::LocalInstanceMethods

        has_many :feedbacks,
          :class_name => "::Schemer::Surveyor",
          :as => :surveyable 

    		class << self
    			def test
    				"test"
    			end
    		end
    	end
    end

    module LocalInstanceMethods
      def list_all_surveys
        ::Schemer::Survey.all
      end

      def list_incomplete_surveys
        ::Schemer::Survey.joins("LEFT JOIN schemer_surveyors ON schemer_surveyors.survey_id = schemer_surveys.id").where("(schemer_surveyors.surveyable_id IS NULL) OR (schemer_surveyors.surveyable_id != ? AND schemer_surveyors.surveyable_type = ?)", self.id, self.class.name) 
      end

      def list_all_surveys_by_name
        list_all_surveys.map(&:name)
      end

      def list_all_survey_questions(survey)
        survey.questions
      end

      def mark_survey_question(question, option)
        # create an answer record for surveyor record
      end

      def squawk
        "hello"
      end
    end

  end
end

ActiveRecord::Base.send :include, ::Schemer::ActsAsSurveyor