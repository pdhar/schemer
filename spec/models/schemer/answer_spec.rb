require 'spec_helper'

module Schemer
  describe Answer do
    context "associations" do
    	it { should belong_to :surveyor }
    	it { should belong_to :question }
    	it { should belong_to :option }
  	end
  end
end
