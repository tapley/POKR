class Objective < ActiveRecord::Base
  belongs_to :user

  validates :description, presence:true
  validates :due, presence:true
end
