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

a_to_z_cap = ("A".."Z").to_a
a_to_z_low = ("a".."z").to_a
zero_to_nine = (1..9).to_a
kitchen_sink = (" ".."z").to_a
a_to_z_cap.rotate(1)
a_to_z_cap.rotate(5)

