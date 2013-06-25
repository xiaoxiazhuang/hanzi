class FlashcardsController < ApplicationController
  def show
    @flashcard = Flashcard.find(params[:id])
  end
end
