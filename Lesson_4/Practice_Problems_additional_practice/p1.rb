flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
index = -1

new_hash = flintstones.to_h {|name| [name, index += 1]}

p new_hash
