class User < ActiveRecord::Base
  validates_presence_of :flashcard_views

  has_many :flashcard_views
end
