class CreateSchemerSurveys < ActiveRecord::Migration
  def change
    create_table :schemer_surveys do |t|
      t.string :title
      t.text :description
      t.boolean :is_started
      t.boolean :is_complete

      t.timestamps
    end
  end
end
