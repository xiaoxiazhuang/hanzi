require 'spec_helper'

feature 'User begins flashcard set', %q{
  As a User
  I want to begin the flashcard set
  So I can start the flashcard set
} do

  # -User sees 'Start set' button on home page
  # -User clicks 'Start set' button and is redirected to a flashcard within flashcard set

  scenario 'clicking on button on homepage starts the set' do
    set = FactoryGirl.create(:flashcard_set)
    flashcard = FactoryGirl.create(:flashcard, flashcard_set: set)

    visit root_path

    click_link 'Start Set'

    page.should have_content(flashcard.character)
    page.should have_content(flashcard.pinyin)
    page.should have_content(flashcard.english_translation)
  end

end
