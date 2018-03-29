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
end
