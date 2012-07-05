class Post < ActiveRecord::Base
  validates :message, presence: true, length: 5..255
  validates :name, presence: true, length: 3..70
  attr_accessible :message, :name
end
