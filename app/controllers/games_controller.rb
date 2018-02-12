class GamesController < ApplicationController
  def new
    @letters = Array.new(9) { ("A".."Z").to_a.sample }
  end

  def score
    @word = params[:word]
    @word_split = @word.upcase.chars
    @token_letters = params[:token].chars

    reject_array = @word_split.reject { |letter| @token_letters.include? letter }
    if reject_array.empty? && @word.size > 0
      @result = "Congratulations your word is #{@word} for #{@word.size} points"
    else
      @result = "Sorry but '<b>#{@word.upcase}</b>' can't be built out of <b>#{@token_letters.join(", ")}</b>"
    end
  end
end

