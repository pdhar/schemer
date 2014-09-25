require 'spec_helper'

module Schemer
  describe Question do
    context "associations" do
    	it { should belong_to :survey }
    	it { should have_many :options }
    	it { should have_one :answer }
  	end
  end
end
