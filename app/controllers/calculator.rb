class Calculator
  def add(number_one, number_two)
    number_one + number_two
  end

  def subtract(number_one, number_two)
    number_one - number_two
  end

  def multiply(number_one, number_two)
    number_one * number_two
  end

  def divide(dividend, divisor)
    dividend / divisor
  end

  def sqaure(number)
    square * square
  end

  def power(number, exponent)
    number**exponent
  end
end

RSpec.describe Calculator do 
  describe '#add' do
    it 'should return the sum of two numbers' do
      calculator = Calculator.new
      expect(calculator.add(1, 1)).to eq(2)
    end
  end
end