require 'spec_helper'
require 'factory_girl_rails'

feature 'User sees flashcards', %{
  As a User
  I want to take the flashcard test
  So I can learn Chinese characters
} do

  scenario "User sees all flashcards at least once during set" do
    visit flashcard_set_path
  end

  scenario "User sees a flashcard only once during each set"
  scenario "User sees flashcards in random order"
  scenario "User sees progress bar indicating how many characters they have gone through"
  scenario "User redirected to dashboard after last flashcard in set has been answered"

end
