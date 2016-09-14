class Encryptor
    def cipher 
    {   'a' => 'n', 'b' => 'o', 'c' => 'p', 
        'd' => 'q', 'e' => 'r', 'f' => 's', 
        'g' => 't', 'h' => 'u', 'i' => 'v', 
        'j' => 'w', 'k' => 'x', 'l' => 'y', 
        'm' => 'z', 'n' => 'a', 'o' => 'b', 
        'p' => 'c', 'q' => 'd', 'r' => 'e', 
        's' => 'f', 't' => 'g', 'u' => 'h',
        'v' => 'i', 'w' => 'j', 'x' => 'k',
        'y' => 'l', 'z' => 'm'}
    end
    def encrypt_letter(letter) 
        cipher[letter.downcase]
    end
    def encrypt(string)
        letters = string.split("")
        post_encryption = letters.collect{ |l| cipher[l.downcase] }
        post_encryption.join
    end
end