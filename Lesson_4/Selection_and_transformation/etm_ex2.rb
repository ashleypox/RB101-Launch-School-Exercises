produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hash)
  selected_fruit = Hash.new

  hash.each do |key, value|
    if value == 'Fruit'
      selected_fruit[key] = value
    end
  end

  selected_fruit
end

puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}