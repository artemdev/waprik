class Public::MusicAlphabetController < ApplicationController
	layout 'mobile'

  def eng
  	@eng_letters = Mp3Alphabet.sorted
  	@rus_letters = Mp3Alphabet.sorted
  end

  def rus
   	@letters = Mp3Alphabet.rus.sorted
  end
end
