class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = place_stones
    @player1_name = name1
    @player2_name = name2
  end

  def place_stones
    cups = Array.new(14) { Array.new(4) {:stone} } 
    cups[6] = []
    cups[13] = []
    cups
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless (0..13) === start_pos
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    num_stones = cups[start_pos].length
    cups[start_pos] = []

    next_cup_idx = start_pos
    num_stones.times do |idx|
      next_cup_idx += 1
      next_cup_idx = 0 if next_cup_idx == 14
      case current_player_name
      when @player1_name
        next_cup_idx = 0 if next_cup_idx == 13
      when @player2_name
        next_cup_idx = 7 if next_cup_idx == 6
      end
      cups[next_cup_idx] << :stone
    end

    render
    next_turn(next_cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 13 || ending_cup_idx == 6
      :prompt 
    elsif cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[7..12].all?(&:empty?) || cups.take(6).all?(&:empty?)
  end

  def winner
    player1_points = cups[6].count
    player2_points = cups[13].count
    case player1_points <=> player2_points
    when -1
      @player2_name
    when 0
      :draw
    when 1
      @player1_name
    end
  end

end
