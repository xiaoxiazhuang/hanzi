# encoding: UTF-8 

require 'csv'

# Flashcard.destroy_all
# FlashcardSet.destroy_all

set = {
  'Countries' => 'flashcards_countries.csv',
  'Basic' => 'flashcards.csv'
}

set.each do |set_name, filename|
  flashcard_set = FlashcardSet.find_or_create_by_name(set_name)

  position_counter = 0
  CSV.foreach(File.join(Rails.root, filename)) do |row|
    position_counter += 1
    unless flashcard = Flashcard.find_by_english_translation(row[0])
      flashcard = Flashcard.new
    end
    flashcard.english_translation = row[0]
    flashcard.character = row[1]
    flashcard_set.pinyin = row[2]
    flashcard.position = row[3] || position_counter
    
    flashcard.flashcard_set = flashcard_set

    flashcard.save!
  end
end

# Each set is a hash and each hash is composed of a 'name' key and 'filename' value.
# For each 'set', we want to create a flashcard_set. This flashcard_set is found/created by the attribute 'name' in the FlashcardSet model. We pass in the set_name to this method.
# For each csv file we find the file by 'filename' (the value in the key/value store) and for each row in the file--
#   Executes creation of new flashcard if 'unless' conditional is false (i.e. if an english_translation cannot be found)
#   a flashcard will be generated unless an english_translation cannot be found
# Otherwise, creates a flashcard with the attributes listed and these are a part of the flashcard set.
