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
        ::Schemer::Survey.
          joins("LEFT JOIN schemer_surveyors ON schemer_surveyors.survey_id = schemer_surveys.id").
          where(" (schemer_surveyors.surveyable_id IS NULL) 
                    OR 
                  (schemer_surveyors.surveyable_id != ? AND schemer_surveyors.surveyable_type = ?)
                    OR
                  (schemer_surveyors.surveyable_id = ? AND schemer_surveyors.surveyable_type = ? AND schemer_surveyors.is_completed != ?)  
                ", id, self.class.name, id, self.class.name, true) 
      end

      def list_all_surveys_by_name
        list_all_surveys.map(&:name)
      end

      def list_all_survey_questions(survey)
        survey.questions
      end

      def start_or_complete_survey(survey)
        if (surveyor = feedbacks.where(survey: survey).where(is_completed: false).first).present?
          return surveyor
        else
          feedbacks.create(survey: survey)
        end
      end

      def list_unanswered_questions(surveyor)

        return  surveyor.
                survey.
                questions.
                joins("LEFT JOIN schemer_answers ON schemer_questions.id = schemer_answers.question_id ").
                where("schemer_answers.id IS NULL")

      end

      def mark_survey_question(surveyor, option)
        # create an answer record for surveyor record
        answer = surveyor.answers.create(option: option, question: option.question)

        questions = surveyor.survey.questions.map(&:id)
        answers   = surveyor.answers.map(&:question_id)

        # check if all question in the survey are answered
        if (questions - answers).empty?
          # mark surveyor record as completed
          surveyor.update(is_completed: true)
        end

        return answer
      end

      def squawk
        "hello"
      end
    end

  end
end

ActiveRecord::Base.send :include, ::Schemer::ActsAsSurveyor