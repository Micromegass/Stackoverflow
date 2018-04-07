# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  votos       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Question < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  def voted_by?(user)
    votes.exists?(user: user)
  end




end
