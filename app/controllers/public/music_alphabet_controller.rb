class Public::MusicAlphabetController < ApplicationController
	layout 'mobile'

  def eng
  	@eng_letters = Mp3Alphabet.eng
  end

  def rus
  	@rus_letters = Mp3Alphabet.sorted
  end
end
