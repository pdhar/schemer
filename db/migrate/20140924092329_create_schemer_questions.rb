class CreateSchemerQuestions < ActiveRecord::Migration
  def change
    create_table :schemer_questions do |t|
      t.text :title
      t.integer :survey_id

      t.timestamps
    end
  end
end
