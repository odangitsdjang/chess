class Employee
  attr_reader :name, :title, :salary, :boss, :bonus
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @bonus = @salary * multiplier
  end

end



class Manager < Employee
  def initialize(name, title, salary, boss, reportees=[])
    @reportees = reportees
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    # total = @reportees.reduce(0) {|acc, employee| acc + employee.salary}
    salarray = []
    @reportees.each {|reportee| salarray << reportee.salary }
    total = salarray.reduce(:+)

    total * multiplier
  end

end




if __FILE__ == $PROGRAM_NAME

  employee1 = Employee.new("Bill", "minion", 2, "failure")
  employee2 = Employee.new("James", "minion2", 3, "dropout")
  manager = Manager.new("Ryan", "boss", 10, "what", [employee1, employee2])
  puts manager.bonus(1)

end
