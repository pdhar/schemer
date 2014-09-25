class CreateSchemerSurveyors < ActiveRecord::Migration
  def change
    create_table :schemer_surveyors do |t|
      t.integer :survey_id

      t.references :surveyable, polymorphic: true
      t.timestamps
    end
  end
end
