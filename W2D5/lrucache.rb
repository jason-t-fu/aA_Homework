  class LRUCache
    def initialize(num)
        @size = num
        @cache = []
    end

    def count
      # returns number of elements currently in cache
        @cache.size
    end

    def add(el)
      # adds element to cache according to LRU principle
        if @cache.delete(el)
            @cache.push(el)
        elsif count >= 4
            @cache.shift
            @cache.push(el)
        else
            @cache.push(el)
        end
    end

    def show
      # shows the items in the cache, with the LRU item first
        print @cache
    end

    private
    # helper methods go here!

  end