module Schemer
  class Answer < ActiveRecord::Base
  	belongs_to :surveyor
  	belongs_to :option
  	belongs_to :question

  	attr_accessible :option, :question, :surveyor
  end
end
