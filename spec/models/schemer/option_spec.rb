require 'spec_helper'

module Schemer
  describe Option do
    context "associations" do
    	it { should belong_to :question }
  	end
  end
end
