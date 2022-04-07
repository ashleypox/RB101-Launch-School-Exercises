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
  str.gsub!(/[$,%]/, '')
end

def money_format(num)
  "$#{num.round(2)}"
end

def get_input(msg)
  input = ''
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
  input
end

# Welcome
prompt(MESSAGES['welcome'])
prompt(MESSAGES['prepare'])
puts "---------------------------------"

# main loop
loop do
  # determine loan amount
  loan_amount = get_input('loan_amt_input')

  # determine APR
  apr = get_input('apr_input')

  # determine loan duration in years
  loan_duration_yr = get_input('loan_dur_input')
  loan_duration_mth = loan_duration_yr.to_f * 12

  # calculate:
  annual_interest = apr.to_f / 100
  monthly_interest = annual_interest / 12

  monthly_payment = loan_amount.to_f * (monthly_interest / (1 -
                    (1 + monthly_interest)**(-loan_duration_mth.to_f)))

  # display result
  prompt(MESSAGES['monthly_payment_result'] + money_format(monthly_payment))

  # loop again?
  prompt(MESSAGES['calculate_again'])
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt(MESSAGES['goodbye'])
