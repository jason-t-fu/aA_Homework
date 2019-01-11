class Map
    def initialize
        @map = []
    end

    def set(key, value)
        map.each do |el|
            if el.first == key
                el[1] = value
                return
            end
        end
        map.push([key,value])
        nil
    end

    def get(key)
        map.each do |el|
            return el.last if el.first == key
        end
        nil
    end

    def delete(key)
        map.reject! { |el| el.first == key }
        nil
    end

    def show
        map
    end

    private
    attr_reader :map
end