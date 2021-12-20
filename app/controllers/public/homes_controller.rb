class Public::HomesController < ApplicationController
  def top
    @note = Note.new
  end
end
