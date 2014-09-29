class AddIsCompletedToSurveyor < ActiveRecord::Migration
  def change
    add_column :schemer_surveyors, :is_completed, :boolean, default: false
  end
end
