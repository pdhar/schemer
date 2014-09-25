module Schemer
  class Survey < ActiveRecord::Base
  	attr_accessible :description, :title, :questions_attributes

  	has_many :questions
  	has_many :surveyors

  	accepts_nested_attributes_for :questions, :reject_if => :all_blank, :allow_destroy => true

  end
end
