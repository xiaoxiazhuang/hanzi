# encoding: utf-8

FactoryGirl.define do

  factory :flashcard_set do
    name 'foo'
  end

  factory :flashcard do
    flashcard_set
    character '福'
    pinyin 'fu'
    english_translation 'luck'
  end
  
end
