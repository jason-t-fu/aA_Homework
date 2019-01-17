
FISH = [
    'fish', 
    'fiiish', 
    'fiiiiish', 
    'fiiiish', 
    'fffish', 
    'ffiiiiisshh', 
    'fsh', 
    'fiiiissshhhhhh'
]

def sluggish_octopus(array_o_fish)
    longest_fish = array_o_fish.first

    array_o_fish.each do |fish|
        if array_o_fish.all? { |fishes| fish.length >= fishes.length }
            longest_fish = fish 
        end
    end

    longest_fish
end

def dominant_octopus(array_o_fish)
    prc = Proc.new { |fish1, fish2| fish1.length <=> fish2.length }

    array_o_fish.merge_sort(&prc).last
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if self.length <= 1

    midpoint = self.length / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged + left + right
  end
end

def clever_octopus(array_o_fish)
    longest_fish = array_o_fish.first

    array_o_fish.each do |fish|
        longest_fish = fish if fish.length > longest_fish.length
    end

    longest_fish
end

TILES_ARRAY = [
    "up", 
    "right-up",
    "right", 
    "right-down", 
    "down", 
    "left-down", 
    "left", 
    "left-up" 
]

TILES_HASH = {
    "up" => 0, 
    "right-up" => 1,
    "right" => 2, 
    "right-down" => 3, 
    "down" => 4, 
    "left-down" => 5, 
    "left" => 6, 
    "left-up" => 7 
}

def slow_dance(direction, tiles_array)
    tiles_array.each_index do |tile_index|
        return tile_index if tiles_array[tile_index] == direction
    end
end

def fast_dance(direction, new_tiles_data_structure)
    new_tiles_data_structure[direction]
end

if __FILE__ == $PROGRAM_NAME
    p sluggish_octopus(FISH)
    p dominant_octopus(FISH)
    p clever_octopus(FISH)
    p slow_dance("up", TILES_ARRAY)
    p fast_dance("up", TILES_HASH)
end