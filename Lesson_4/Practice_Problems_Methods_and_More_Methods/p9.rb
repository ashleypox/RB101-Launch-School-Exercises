{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# the value of map is [nil, 'bear'] because the first pair is not bigger than 3. 