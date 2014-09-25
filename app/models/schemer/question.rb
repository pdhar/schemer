module Schemer
  class Question < ActiveRecord::Base
  	attr_accessible :title, :options_attributes

  	belongs_to :survey
  	has_many :options
  	has_one :answer

  	accepts_nested_attributes_for :options, :reject_if => :all_blank, :allow_destroy => true
  end
end
