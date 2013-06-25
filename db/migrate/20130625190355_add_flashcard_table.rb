class AddFlashcardTable < ActiveRecord::Migration
  def change
    create_table :flashcards do |t|
      t.string :character, null: false
      t.string :pinyin, null: false
      t.string :english_translation, null: false
      t.integer :flashcard_set_id, null: false

      t.timestamps
    end
  end
end
