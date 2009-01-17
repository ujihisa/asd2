$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')
require 'payroll_database'
require 'add_salaried_employee'
require 'add_hourly_employee'

describe 'Payroll' do
  describe 'Add SaraliedEmployee' do
    before do
      @employee_id = 1
      @t = AddSalariedEmployee.new(@employee_id, 'Bob', 'Home', 1000.0)
      @t.execute
      @e = PayrollDatabase.instance.employee(@employee_id)
    end
    it 'should get an instance of Employee' do
      @e.should_not nil
    end
    it 'should be that name is "Bob"' do
      @e.name.should == "Bob"
    end
    it 'should be that salayy is 1000.0' do
      @e.classification.salary.should == 1000.0
    end
    it 'should be that schedule is monthly' do
      @e.schedule.class.should == MonthlySchedule
    end
  end
  
  describe "Add HourlyEmployee" do
    before do
      @employee_id = 1
      @t = AddHourlyEmployee.new(@employee_id, 'Bob', 'Home', 10.0)
      @t.execute
      @e = PayrollDatabase.instance.employee(@employee_id)
    end
    it 'should get an instance of Employee' do
      @e.should_not nil
    end
    it 'should be that name is "Bob"' do
      @e.name.should == "Bob"
    end
    it 'should be that hourly rate is 10.0' do
      @e.classification.hourly_rate.should == 10.0
    end
    it 'should be that schedule is hourly' do
      @e.schedule.class.should == WeeklySchedule
    end
  end
end



