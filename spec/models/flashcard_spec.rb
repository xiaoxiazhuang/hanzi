require 'spec_helper'

describe Flashcard do
  it { should validate_presence_of :character }
  it { should validate_presence_of :pinyin }
  it { should validate_presence_of :english_translation }
  it { should validate_presence_of :flashcard_set }

  it { should belong_to :flashcard_set }
end
