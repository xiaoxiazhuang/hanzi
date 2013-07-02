# encoding: UTF-8 

require 'csv'

Flashcard.destroy_all
FlashcardSet.destroy_all

#establish a relationship between set names and their seed files
set = {
  # 'Countries' => 'flashcards_countries.csv',
  # 'Basic' => 'flashcards.csv',
  'HSK Level 1' => 'flashcards_hsk_level_1.csv',
  'HSK Level 2' => 'flashcards_hsk_level_2.csv',
  'HSK Level 3' => 'flashcards_hsk_level_3.csv',
  'HSK Level 4' => 'flashcards_hsk_level_4.csv',
  'HSK Level 5' => 'flashcards_hsk_level_5.csv',
  'HSK Level 6' => 'flashcards_hsk_level_6.csv'
}

set.each do |set_name, filename|
  #we find or create the flashcard set
  flashcard_set = FlashcardSet.find_or_create_by_name(set_name)

  position_counter = 0
  #loop through each row
  CSV.foreach(File.join(Rails.root, filename)) do |row|
    position_counter += 1
    flashcard = Flashcard.new
    # flashcard = Flashcard.find_by_english_translation(row[2])

    #if the flashcard was not found in the db, we initialize a new one
    if flashcard.nil?
      flashcard = Flashcard.new
    end

    #update attributes
    flashcard.character = row[0]
    flashcard.pinyin = row[1]
    flashcard.english_translation = row[2]
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
# Otherwise, creates a flashcard with the attributes listed and these are a part of the flashcard set. This is then saved.
