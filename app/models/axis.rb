class Axis < ActiveRecord::Base
  has_many :axis_events
  belongs_to :user
end
