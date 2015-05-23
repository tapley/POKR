class Update < ActiveRecord::Base
  belongs_to :keyresult

  validates :prev_value, presence:true
end
