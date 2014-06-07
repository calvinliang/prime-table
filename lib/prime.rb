class Prime
  def initialize(n = 10)
    if n == nil
      # Defaults to 10
      @n = 10
    elsif !(Integer(n) rescue false) or n.to_i <= 0
      # Sets strings, negative numbers,  and everything that's not an Integer to nil
      @n = nil
    else
      @n = n.to_i 
    end
    @list = []
    @table = ""
  end

  def start
    if @n == nil
      return
    end
    @list = sieve(@n)
    print()
  end

  def sieve(n)
    return [] if !(Integer(n) rescue false)
    index = 0
    list = []
    i = 2 # 1 isn't a prime!
    while index < n
      while !is_prime(i, list)
        i += 1
      end
      list.push(i)
      index += 1
    end
    list
  end

  # Generic Sieve of Eratosthenes
  def is_prime(i, list)
    if i == 1
      return false
    end

    for k in list
      if i % k == 0
        return false
      end
    end

    return true
  end

  # If the biggest product is longer than 10 digits, add another tab
  # and so forth so the table is presented neatly
  def check_tab
    num = @list.last * @list.last
    tabs = ((num.to_s.size) / 10) + 1
    return "\t"*tabs
  end

  # Since we want to only print _one_ table, I understood that as calling
  # `puts` only once, so I concatenated the values into a single string.
  def print
    row = 0
    tab = check_tab

    @table << tab + @list.join(tab) + "\n"

    while row < @n
      @table << "#{@list[row]}" + tab
      for k in @list
        @table << "#{@list[row] * k}" + tab
      end
      @table << "\n"
      row += 1
    end
    puts @table
  end
end
