class FlashcardSet < ActiveRecord::Base
  validates_presence_of :name

  has_many :flashcards
end
