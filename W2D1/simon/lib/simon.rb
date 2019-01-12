class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game
    puts "Play again? (y/n)"
    play if (gets.chomp.downcase == "y")
  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    puts "The current sequence will be displayed for #{sequence_length} seconds:"
    puts seq.join(",")
    sleep(sequence_length)
    system("clear")
  end

  def require_sequence
    puts "Enter the colors in sequence, each followed enter:"
    seq.each do |color|
      input = gets.chomp.downcase
      unless color == input
        self.game_over = true 
        break
      end
    end
  end

  def add_random_color
    self.seq.push(COLORS.sample)
  end

  def round_success_message
    puts "You entered the correct sequence! Next round..."
  end

  def game_over_message
    puts "Incorrect move! You lose."
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end