class Employee
  attr_reader :name, :title, :salary
  attr_accessor :boss

  def initialize(name, title, salary, boss = nil)
    @name, @title, @salary = name, title, salary
    self.boss = boss
  end

  def boss=(boss)
    @boss = boss
    boss.add_employee(self) unless boss.nil?

    boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
    employees
  end

  def bonus(multiplier)
    total_employees_salaries * multiplier
  end

  def total_employees_salaries
    total = 0
    @employees.each do |employee|

      if employee.is_a?(Manager)
        total += employee.total_employees_salaries + employee.salary
      else
        total += employee.salary
      end
    end
    total
  end

end
