
class HangpersonGame


  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
attr_accessor :word ,:guesses ,:wrong_guesses ,:valid


  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
    @valid = ''
  end
  def guess(guess_char)
    guess_char = guess_char.downcase
    @valid = match_char_in_guesses(guess_char)
  if @valid  
    return false
  end
  else
    if word.match(guess_char)
      @guesses.concat(guess_char)
    
      return guess_char
    else
      @wrong_guesses.concat(guess_char)
      return false
    end
  end 
  def match_char_in_guesses (guess_char_in)
    if @guesses.match(guess_char_in) || @wrong_guesses.match(guess_char_in)
      return true
    end
  else 
    return false
  end
    
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
