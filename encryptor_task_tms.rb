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
end


