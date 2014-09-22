require 'spec_helper'

describe "surveys/edit" do
  before(:each) do
    @survey = assign(:survey, stub_model(Survey,
      :title => "MyString",
      :description => "MyText",
      :is_started => false,
      :is_complete => false
    ))
  end

  it "renders the edit survey form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", survey_path(@survey), "post" do
      assert_select "input#survey_title[name=?]", "survey[title]"
      assert_select "textarea#survey_description[name=?]", "survey[description]"
      assert_select "input#survey_is_started[name=?]", "survey[is_started]"
      assert_select "input#survey_is_complete[name=?]", "survey[is_complete]"
    end
  end
end
