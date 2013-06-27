class FlashcardSet < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
  validates_presence_of :user

  has_many :flashcards
end
