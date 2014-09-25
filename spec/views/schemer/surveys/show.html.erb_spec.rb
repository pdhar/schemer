require 'spec_helper'

describe "schemer/surveys/show" do

  before(:each) do

    @survey = assign(:survey, stub_model(::Schemer::Survey,
      :title => "Title",
      :description => "MyText",
      :is_started => false,
      :is_complete => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
