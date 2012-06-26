module Job
  @queue = :fizzbuzz
  def self.perform(number=100)
    result = []
    1.upto(number) do |n|
      result << fizzbuzz(n)
    end
    warn result
  end

  def self.fizzbuzz(n)
    case
    when (n % 15) == 0
      'FizzBuzz'
    when (n % 5)  == 0
      'Fizz'
    when (n % 3)  == 0
      'Buzz'
    else
      n
    end
  end
end
