class Flashcard < ActiveRecord::Base
  validates_presence_of :character
  validates_presence_of :pinyin
  validates_presence_of :english_translation
  validates_presence_of :flashcard_set
  # validates_presence_of :flashcard_views

  # has_many :flashcard_views

  belongs_to :flashcard_set
end
