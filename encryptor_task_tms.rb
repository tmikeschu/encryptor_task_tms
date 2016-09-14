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
        #Create the file handle to the input file
        input = File.open("#{filename}", "r")
        #Read the text of the input file
        input_message = p input.read
        input.rewind
        #Encrypt the text
        encrypted = encrypt(input_message, rotation)
        #Create a name for the output file
        #Create an output file handle
        output = File.new("#{filename}.encrypted", "w")
        #Write out the text
        output.write(encrypted)
        #Close the file
        output.close
    end
end


