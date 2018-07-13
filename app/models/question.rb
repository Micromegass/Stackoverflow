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

  belongs_to :user, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :points, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :points, as: :voteable, dependent: :destroy


  def voted_by?(user)
    points.exists?(user: user)
  end



end
