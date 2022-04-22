munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, description|
  if description["age"] < 18
    description[:age_group] = 'kid'
  elsif description["age"] > 65
    description[:age_group] = 'senior'
  else
    description[:age_group] = 'adult'
  end
end

puts munsters
