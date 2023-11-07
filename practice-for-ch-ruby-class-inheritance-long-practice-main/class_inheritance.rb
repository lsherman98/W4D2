class Employee
  attr_reader :salary
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
      bonus = @salary * multiplier
  end
end


class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss)
    super
    @employees = []
  end

  def bonus(multiplier) #ned.bonus
    total_sub_salary * multiplier
  end

  def total_sub_salary
      total = 0
      self.employees.each do |employee| #employee == darren, shawna, david
        total
        if employee.instance_of?(Employee)
          total += employee.salary
        else
          total += employee.salary + employee.total_sub_salary #22,000
        end
      end
      total
  end
end


ned = Manager.new('Ned', 'Founder', 1000000, nil)
darren = Manager.new('Darren', 'TA Manager', 78000, ned)
shawna = Employee.new('Shawna', 'TA', 12000, darren)
david = Employee.new('David', 'TA', 10000, darren)

ned.employees = [darren]
darren.employees = [shawna, david]

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
