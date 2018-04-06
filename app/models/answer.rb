# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string
#

class Answer < ApplicationRecord
  validates :description, presence: true

  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable, dependent: :destroy

end
