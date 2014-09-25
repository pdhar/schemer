module Schemer
  class QuestionSerializer < ActiveModel::Serializer
    attributes :id, :title, :options

    def options
	    object.options.map do |option|
	      OptionSerializer.new(option, scope: scope, root: false)
	    end
	  end

  end
end
