def factors(number)
  divisor = number
  factors = []
  begin
    if number > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
    else
      puts "Invalid input."
    end
  end until divisor == 0
  factors
end

# bonus 1: % is modulo; % == 0 it is checking for numbers that divide evenly into the given number
# bonus 2: factors at the end ensures that the method returns the numbers they want, instead of nil
