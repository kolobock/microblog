class Post < ActiveRecord::Base
  validates :name, presence: true, length: 3..70
  validates :message, presence: true, length: 5..255
  attr_accessible :name, :message
end
