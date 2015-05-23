class Keyresult < ActiveRecord::Base
  belongs_to :objective

  validates :number, presence:true
  validates :unit, presence:true
  validates :action, presence:true
end
