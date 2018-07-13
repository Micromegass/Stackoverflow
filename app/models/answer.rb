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
#  content     :string
#

class Answer < ApplicationRecord
  validates :description, presence: true

  belongs_to :user, dependent: :destroy
  belongs_to :question, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  has_many :points, as: :voteable, dependent: :destroy

  def voted_by?(user)
    points.exists?(user: user)
  end



end
