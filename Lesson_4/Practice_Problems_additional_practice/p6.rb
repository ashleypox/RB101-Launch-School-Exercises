flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

shortened_names = []

flintstones.each do |name| 
  shortened_names << name[0..2]
end

p shortened_names
