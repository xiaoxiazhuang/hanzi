# encoding: UTF-8 

require 'csv'

Flashcard.destroy_all
FlashcardSet.destroy_all

flashcard_set = FlashcardSet.create(name: '1')

CSV.foreach(File.join(Rails.root, 'flashcards.csv')) do |row|
  flashcard = Flashcard.new
  flashcard.character = row[0]
  flashcard.pinyin = row[1]
  flashcard.english_translation = row[2]
  flashcard.position = row[3]
  
  flashcard.flashcard_set = flashcard_set

  flashcard.save
end
