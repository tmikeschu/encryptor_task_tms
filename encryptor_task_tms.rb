class Encryptor
    def cipher(rotation)
        characters = (' '..'z').to_a
        rotated_characters = characters.rotate(rotation)
        Hash[characters.zip(rotated_characters)]
    end
    def encrypt_letter(letter, rotation = 13) 
        cipher_for_rotation = cipher(rotation)
        cipher_for_rotation[letter]
    end
    def encrypt(string, rotation = 13)
        letters = string.split("")
        post_encryption = letters.collect{ |l| encrypt_letter(l, rotation) }
        post_encryption.join.capitalize
    end
    def decrypt(string, rotation)
        letters = string.split("")
        post_decryption = letters.collect{ |l| encrypt_letter(l, -(rotation) ) }
        post_decryption.join.capitalize
    end
    def encrypt_file(filename, rotation)
        input = File.open("#{filename}", "r")
        input_message = input.read; input.rewind
        encrypted = encrypt(input_message, rotation)
        output = File.new("#{filename}.encrypted", "w")
        output.write(encrypted)
        output.close
    end
    def decrypt_file(filename, rotation)
        input = File.open("#{filename}", "r")
        input_message = input.read; input.rewind
        decrypted = decrypt(input_message, rotation)
        output = File.new("#{filename.gsub("encrypted", "decrypted")}", "w")
        output.write(decrypted)
        output.close
    end

    def supported_characters
        (" ".."z").to_a
    end

    def crack(message)
        supported_characters.count.times.collect do |attempt|
            decrypt(message, attempt)
        end
    end
end

e = Encryptor.new
puts e.crack("f w)0/6X0// -6C6` ''46j$( ")



