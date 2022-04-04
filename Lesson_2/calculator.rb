# calculator

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  Float(num) != nil rescue false
end

def operation_to_message(op)
  case op
  when '1'
    messages('op_one')
  when '2'
    messages('op_two')
  when '3'
    messages('op_three')
  when '4'
    messages ('op_four')
  end
end

prompt(messages('welcome'))

username = ''
loop do
  username = gets.chomp
  if username.empty?()
    prompt(messages('invalid_name'))
  else
    break
  end
end

prompt(messages('hello') + "#{username}.")

# begin main loop
loop do
  # collect first input
  number1 = ''
  loop do
    prompt(messages('input_1'))
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt(messages('invalid_num'))
    end
  end

  # collect second input
  number2 = ''
  loop do
    prompt(messages('input_2'))
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt(messages('invalid_num'))
    end
  end

  # ask the user for operation to perform

  prompt(messages('op_prompt'))

  # determine if one of the available options was selected
  operation = ''
  loop do
    operation = gets.chomp

    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt(messages('invalid_option'))
    end
  end

  prompt(operation_to_message(operation))

  # perform the operation on the two numbers
  result = case operation
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
            if number2 == '0'
             prompt(messages('divide_by_zero'))
             messages('undefined') 
            else
              number1.to_f / number2.to_f
            end
           end

  # output the result
  prompt (messages('result_msg') + "#{result}.")
  prompt (messages('begin_again'))
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt(messages('goodbye'))
