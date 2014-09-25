# module Schemer
# 	module Concerns
# 	  module Surveyor

#       extend ActiveSupport::Concern

#       module ClassMethods
#       	def acts_as_surveyor(options={})
#       		include Schemer::Concerns::Surveyor::LocalInstanceMethods

#       		class << self
#       			def test
#       				"test"
#       			end
#       		end
#       	end
#       end

#       module LocalInstanceMethods
# 	      def squawk
# 	        "hello"
# 	      end
# 	    end

#       included do |receiver|
#         has_many :feedbacks, :as => :surveyable
#       end

# 	  end
# 	end
# end

# ActiveRecord::Base.send :include, ::Schemer::Concerns::Surveyor