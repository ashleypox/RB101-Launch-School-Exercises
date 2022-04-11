flintstones = { "Fred" => 0, "Wilma" => 1, 
              "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# given solution
new_array = flintstones.assoc("Barney")

# another soultion
my_array = flintstones.select{|k,v| k == 'Barney'}

p new_array
p my_array