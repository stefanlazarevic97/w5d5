class AddResponsesCountToAnswerChoices < ActiveRecord::Migration[7.0]
  def change
    add_column :answer_choices, :responses_count, :bigint, default: 0
  end
end
