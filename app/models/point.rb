class Point < ApplicationRecord
  belongs_to :voteable, polymorphic: true
  belongs_to :user
end
