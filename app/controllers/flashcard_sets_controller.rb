class FlashcardSetsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @flashcard_sets = FlashcardSet.all
  end

  def show
    @flashcard_set = FlashcardSet.find(params[:id])
  end
end
