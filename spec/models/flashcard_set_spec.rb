require 'spec_helper'

describe FlashcardSet do
  it { should validate_presence_of(:name) }
end
