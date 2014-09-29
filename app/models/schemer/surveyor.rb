module Schemer
  class Surveyor < ActiveRecord::Base
  	attr_accessible :survey, :is_completed

  	belongs_to :surveyable, polymorphic: true
  	belongs_to :survey
  	has_many :answers
  end
end
