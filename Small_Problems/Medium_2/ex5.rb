# method that takes the lengths of 3 sides of a triangle;
# returns a symbol stating the type of triangle

def triangle(s1, s2, s3)
  sides = [s1, s2, s3].sort
  if sides[2] > (sides[0] + sides[1]) ||  sides.any?(0)
    return :invalid
  elsif sides.uniq.size == 1
    return :equilateral
  elsif sides.uniq.size == 2
    return :isosceles
  else
    return :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid