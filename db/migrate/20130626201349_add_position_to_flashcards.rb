class AddPositionToFlashcards < ActiveRecord::Migration
  def change
    add_column :flashcards, :position, :integer, null: false
  end
end
