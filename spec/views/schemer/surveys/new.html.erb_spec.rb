require 'spec_helper'

describe "surveys/new" do
  before(:each) do
    assign(:survey, stub_model(Survey,
      :title => "MyString",
      :description => "MyText",
      :is_started => false,
      :is_complete => false
    ).as_new_record)
  end

  it "renders new survey form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", surveys_path, "post" do
      assert_select "input#survey_title[name=?]", "survey[title]"
      assert_select "textarea#survey_description[name=?]", "survey[description]"
      assert_select "input#survey_is_started[name=?]", "survey[is_started]"
      assert_select "input#survey_is_complete[name=?]", "survey[is_complete]"
    end
  end
end
