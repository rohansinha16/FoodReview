class User < ActiveRecord::Base
  attr_accessible :email, :name

  validates :name, :email, :presence => true
  validates :name, :email, :uniqueness => true
end
