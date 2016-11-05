class Employee
	attr_reader :name, :email
	def initialize(name,email)
		@name = name
		@email = email
	end

	def calculate_taxed_salary
		calculate_weekly_salary * 1.18
	end

end

class HourlyEmployee < Employee
	
	def initialize(name,email,hourly_rate,hours_worked)
		super(name,email)
		@hourly_rate = hourly_rate
		@hours_worked = hours_worked
	end

	def calculate_weekly_salary
		@hourly_rate * @hours_worked
	end

end

class SalariedEmployee < Employee
	def initialize(name,email,yearly_salary)
		super(name,email)
		@yearly_salary = yearly_salary
	end

	def calculate_weekly_salary
		@yearly_salary / 52
	end

end

class MultiPaymentEmployee < Employee
	def initialize(name, email, yearly_salary, hourly_rate, hours_worked)
		super(name,email)
		@yearly_salary = yearly_salary
		@hourly_rate = hourly_rate
		@hours_worked = hours_worked
	end

	def extra_hourly_week_salary
		(@hours_worked - 40) * @hourly_rate
	end

	def calculate_weekly_salary
		@yearly_salary / 52 + extra_hourly_week_salary
	end
end

class Payroll
	def initialize(employees)
		@employees = employees
	end

	def pay_employees
		@employees.each do |person|
			puts "La persona #{person.name} cobra #{person.calculate_taxed_salary}"
			notify_employee(person)
		end

	end

	def notify_employee(person)
		puts "Hola #{person.name} acabamos de pagarte tu nomina"
	end

end

josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)
jose = HourlyEmployee.new("Jose","joselito@lito.es",15,70)
emilio = HourlyEmployee.new("Emilio","uko@uko.es",15,60)

my_employees = [josh,nizar,ted,jose,emilio]

payroll1 = Payroll.new(my_employees)
payroll1.pay_employees
