class TypeError < StandardError
end

class Arg < ArgumentError
end


def dec2hex(decimal_number)

    if decimal_number == nil
        raise Arg, "Argument decimal number is empty (example: dec2hex(1337))"
    end

    if decimal_number.class != Integer
        raise TypeError, "Incorrect class object Integer"
    end

    hexa_result = Array.new
    tmp_result = decimal_number
    used = true
    hash_letters = { 10 => "A", 11 => "B", 12 => "C", 13 => "D", 14 => "E", 15 => "F" }
    final_result = []
    while true

        while(tmp_result / 16 != tmp_result % 16)
            if(used == true)
                tmp_result = decimal_number / 16
                hexa_result << decimal_number % 16
                used = false
            end
            hexa_result << tmp_result % 16
            tmp_result = tmp_result / 16
        end
        break
    end

    hexa_result.each do |fixnum|
        if(hash_letters.has_key?(fixnum) == true)
            final_result << hash_letters[fixnum]
        else
            final_result << fixnum
        end
    end
    return final_result.reverse.join
end

puts dec2hex(145)