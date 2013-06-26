# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require_relative flashcards.csv

Seeders::Flashcards.seed

Flashcard.delete_all
  open(flashcards.csv) do |flashcards|
    flashcards.read.each_line do |flashcard|
      character, pinyin, english_translation = flashcard.chomp.split(",")
      Flashcard.create!(:character => character, :pinyin => pinyin, :english_translation => english_translation)
  end
end
