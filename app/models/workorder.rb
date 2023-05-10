class Workorder < ActiveRecord::Base
  belongs_to :user, foreign_key: true

  validates :title, presence: true
  validates :labor_hours, presence: true
end