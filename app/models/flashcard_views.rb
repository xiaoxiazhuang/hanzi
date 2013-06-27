class FlashcardViews < ActiveRecord::Base
  validates_presence_of :user
  validates_presence_of :flashcard


  belongs_to :user
  belongs_to :flashcard
end
