class Encryptor
    @password = "zyx321"
    puts "Enter password: "
    user_password = gets.chomp
    if user_password == @password
        puts "Proceed."
    else
        private
    end
    def cipher(rotation)
        characters = (' '..'z').to_a
        rotated_characters = characters.rotate(rotation)
        Hash[characters.zip(rotated_characters)]
    end
    def encrypt_letter(letter, rotation) 
        cipher_for_rotation = cipher(rotation)
        cipher_for_rotation[letter]
    end
    def encrypt(string, rotation = 13)
        letters = string.split("")
        post_encryption = letters.collect{ |l| encrypt_letter(l, rotation) }
        post_encryption.join
    end
    def decrypt(string, rotation = 13)
        letters = string.split("")
        post_decryption = letters.collect{ |l| encrypt_letter(l, -(rotation) ) }
        post_decryption.join
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
    def encrypt_real_time
        puts "Enter your message: "
        message_orig = gets.chomp
        print "Enter your preferred encryption number > "
        user_rot = gets.chomp.to_i
        puts encrypt(message_orig, user_rot)
    end
    def decrypt_real_time
        puts "Enter encrypted message: "
        message_encryp = gets.chomp
        print "What is the decryption key? > "
        user_key = gets.chomp.to_i
        puts decrypt(message_encryp, user_key)
    end
    def rotation_triple
        rot_arr = [3, 13, 23]
        return rot_arr.first
        rot_arr.rotate!
    end
    rotate_proc = Proc.new do |n|
        
    end
    def encrypt_advanced(string)
        rotation = [3, 13, 23]
        letters = string.split("")
        post_encryption = []
        letters.collect do |l|
            post_encryption << encrypt_letter(l, rotation[0])
            rotation.rotate!
        end
        post_encryption.join
    end
    def decrypt_advanced(string)
        rotation = [3, 13, 23]
        letters = string.split("")
        post_encryption = []
        letters.collect do |l|
            post_encryption << encrypt_letter(l, -(rotation[0]))
            rotation.rotate!
        end
        post_encryption.join
    end
end






