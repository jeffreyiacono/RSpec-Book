class Genre < ActiveRecord::Base
  has_many :categories
  has_many :movies, :through => :categories
end
