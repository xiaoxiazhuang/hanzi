class ChangeEnglishTranslationFromStringToText < ActiveRecord::Migration
  def up
    change_column(:flashcards, :english_translation, :text, :null => false)
  end

  def down
    change_column(:flashcards, :english_translation, :string, :null => false)
  end
end
