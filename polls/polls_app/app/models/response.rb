# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  answer_choice_id :bigint           not null
#  respondent_id    :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Response < ApplicationRecord
    belongs_to :respondent,
        primary_key: :id,
        foreign_key: :respondent_id,
        class_name: 'User'

    belongs_to :answer_choice,
        primary_key: :id,
        foreign_key: :answer_choice_id,
        class_name: 'AnswerChoice',
        counter_cache: true # bonus 2

    has_one :question,
        through :answer_choice,
        source: :question

    has_one :poll,
        through: :question,
        source: :poll
end
