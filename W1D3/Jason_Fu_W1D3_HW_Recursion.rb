def sum_to(num)
    return nil if num < 1
    if num == 1
        1
    else
        num + sum_to(num-1)
    end
end

def add_numbers(nums_array)
    return nil if nums_array.empty?
    if nums_array.length == 1
        nums_array.first
    else
        num = nums_array.shift
        num + add_numbers(nums_array)
    end
end

def gamma_fnc(num)
    return nil if num == 0
    num -= 1
    if num <= 1
        1
    else
        num * gamma_fnc(num)
    end
end

def ice_cream_shop(flavors, favorite)
    return nil if flavors.empty?
    if flavors.length == 1
        flavors.first == favorite 
    else
        flavor = flavors.shift 
        if flavor == favorite
            return true
        else
            ice_cream_shop(flavors, favorite)
        end
    end
end

def reverse(string)
    if string.length == 0
        ""
    else
        char = string.slice!(0)
        reverse(string) + char
    end
end