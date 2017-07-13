
class HangpersonGame


  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
attr_accessor :word ,:guesses ,:wrong_guesses ,:valid ,:word_with_guesses ,:check_win_or_lose 


  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
    @valid = ''
    @word_with_guesses =''
    @status 
  end
  def guess(guess_char)
    if !check_guess(guess_char)
      raise ArgumentError.new()
    end
    guess_char = guess_char.downcase
    @valid = match_char_in_guesses(guess_char)
    
  if @valid 
    return false
  end
  else
    
    if word.match(guess_char)
      @guesses.concat(guess_char)
      @word_with_guesses = display_guess_in_word
      return guess_char
    else
      
      @wrong_guesses.concat(guess_char)
      return false
    end
  end
  def display_guess_in_word
    
    @word.gsub(/[^ #{@guesses}]/, '-')
  
  end
 
  def match_char_in_guesses (guess_char_in)
    if @guesses.match(guess_char_in) || @wrong_guesses.match(guess_char_in)
      return true
    end
  else 
    return false
  end
  
  def check_guess (guess_char_in)
    if guess_char_in =~ /[a-zA-Z]/
      return true
    else
      return false
    end
  end
  def check_win_or_lose 
    if wrong_guesses.length >= 7
      return :lose
    end
    if @word_with_guesses == @word
      return :win
    end
  return :play
  end
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
