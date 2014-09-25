class CreateSchemerAnswers < ActiveRecord::Migration
  def change
    create_table :schemer_answers do |t|
      t.integer :surveyor_id
      t.integer :question_id
      t.integer :option_id

      t.timestamps
    end
  end
end
