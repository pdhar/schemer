class CreateSchemerOptions < ActiveRecord::Migration
  def change
    create_table :schemer_options do |t|
      t.text :title
      t.integer :question_id

      t.timestamps
    end
  end
end
