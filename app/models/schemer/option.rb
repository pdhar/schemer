module Schemer
  class Option < ActiveRecord::Base
  	attr_accessible :title

  	belongs_to :question
  end
end
