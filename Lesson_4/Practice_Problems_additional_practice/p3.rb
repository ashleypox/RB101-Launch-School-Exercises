ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }


ages.each do |key, value|
  ages.delete(key) if value > 100
end
        