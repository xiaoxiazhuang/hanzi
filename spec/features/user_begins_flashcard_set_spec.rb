require 'spec_helper'

feature 'User begins flashcard set', %{
  As a User
  I want to begin the flashcard set
  So I can start the flashcard set
} do

  scenario 'clicking on button on homepage starts the set' do
    set = FactoryGirl.create(:flashcard_set)
    flashcard = FactoryGirl.create(:flashcard, flashcard_set: set)

    visit root_path

    click_button 'Start Set'

    page.should have_content(flashcard.character)
    page.should have_content(flashcard.pinyin)
    page.should have_content(flashcard.english_translation)
  end

end
