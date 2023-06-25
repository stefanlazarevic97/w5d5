# == Schema Information
#
# Table name: answer_choices
#
#  id              :bigint           not null, primary key
#  text            :string           not null
#  question_id     :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  responses_count :bigint           default(0)
#
class AnswerChoice < ApplicationRecord
    validates :text, presence: true

    belongs_to :question,
        primary_key: :id,
        foreign_key: :question_id,
        class_name: 'Question'

    has_many :responses,
        primary_key: :id, 
        foreign_key: :question_id,
        class_name: 'Response',
        dependent: :destroy
end
