class User < ActiveRecord::Base

  validates :name, presence:true
  validates :password_hash, presence:true
  validates :email, presence:true

end
