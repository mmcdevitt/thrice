class AddFeedbackValueToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :feedback_value, :integer
  end
end
