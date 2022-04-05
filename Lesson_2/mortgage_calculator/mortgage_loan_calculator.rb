require 'yaml'
MESSAGES = YAML.load_file('mortgage_loan_messages.yml')

# methods
def prompt(message)
  puts "=> #{message}"
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def valid_number?(num)
  (num.to_i > 0) && (integer?(num) || float?(num))
end

def remove_spec_char(str)
  str.gsub!(/[$,]/, '')
end

def money_format(num)
  "$#{num.round(2)}"
end

def get_input(msg, )
  loop do
    prompt(MESSAGES[msg])
    input = gets.chomp

    remove_spec_char(input)

    if valid_number?(input)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end
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

    # removes $ and , from loan input
    money_unformat(loan_amount)

    if valid_number?(loan_amount)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  # determine APR
  apr = ''
  loop do
    prompt(MESSAGES['apr_input'])
    apr = gets.chomp
    if valid_number?(apr)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  # determine loan duration in months
  loan_duration = ''
  loop do
    prompt(MESSAGES['loan_dur_input'])
    loan_duration = gets.chomp
    if valid_number?(loan_duration)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  # calculate:
  annual_interest = apr.to_f / 100
  monthly_interest = annual_interest / 12

  monthly_payment = loan_amount.to_f *
                    (monthly_interest / 
                    (1 - (1 + monthly_interest)**(-loan_duration.to_f)))

  # display result
  prompt(MESSAGES['monthly_payment_result'] + money_format(monthly_payment))

  # loop again?
  prompt(MESSAGES['calculate_again'])
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt(MESSAGES['goodbye'])
