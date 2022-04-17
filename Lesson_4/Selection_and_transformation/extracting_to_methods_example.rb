produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}


def select_fruit(collection)
  counter = 0
  fruits = Hash.new

  loop do
    current_key = collection.keys[counter]
    current_value = collection[current_key]

    break if collection.keys.size == counter
    if current_value == 'Fruit'
        fruits[current_key] = current_value
    end

    counter += 1

  end

  fruits
end

puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

