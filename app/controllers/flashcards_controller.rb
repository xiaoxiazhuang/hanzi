class FlashcardsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @set = FlashcardSet.find(params[:flashcard_set_id])
    @flashcard = Flashcard.find(params[:id])
    @next_flashcard = @set.flashcards.find_by_position(@flashcard.position + 1)
  end
end
