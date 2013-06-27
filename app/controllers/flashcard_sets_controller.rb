class FlashcardSetsController < ApplicationController
  def index
    @flashcard_sets = FlashcardSet.all
  end

  def show
    @flashcard_set = FlashcardSet.find(params[:id])
  end
end
