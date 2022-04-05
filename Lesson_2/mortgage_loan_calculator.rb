require 'yaml'
MESSAGES = YAML.load_file('mortgage_loan_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  Float(num) != nil rescue false
end

def number_to_money(number)
  number.round(2)
end

# Welcome
prompt(MESSAGES['welcome'])
puts "---------------------------------"

# main loop
loop do
  # determine loan amount
  loan_amount = ''
  loop do
    prompt(MESSAGES['loan_amt_input'])
    loan_amount = gets.chomp

    if valid_number?(loan_amount) == false
      prompt(MESSAGES['invalid_number'])
    else
      break
    end
  end

  # determine APR
  apr = ''
  loop do
    prompt(MESSAGES['apr_input'])
    apr = gets.chomp
    if valid_number?(apr) == false
      prompt(MESSAGES['invalid_number'])
    else
      break
    end
  end

  # determine loan duration in months
  loan_duration = ''
  loop do
    prompt(MESSAGES['loan_dur_input'])
    loan_duration = gets.chomp
    if valid_number?(loan_duration) == false
      prompt(MESSAGES['invalid_number'])
    else
      break
    end
  end

  # calculate:
  annual_interest = apr.to_f / 100
  monthly_interest = annual_interest / 12

  monthly_payment = loan_amount.to_f * 
                    (monthly_interest / 
                    (1 - (1 + monthly_interest)**(-loan_duration.to_f)))
  
  # display result
  prompt(MESSAGES['monthly_payment_result'] + "$#{number_to_money(monthly_payment)}.")

  # loop again?
  prompt(MESSAGES['calculate_again'])
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt(MESSAGES['goodbye'])