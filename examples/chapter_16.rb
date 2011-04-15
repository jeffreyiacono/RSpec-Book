# chapter 16 code examples
# uncomment sections to run

## == pg 234 ==
#
#describe "something", :a => "A" do
#  it "does something", :b => "B" do
#    p example.metadata
#  end
#end

## == pg 236 ==
#
#RSpec.configure do |c|
#  c.filter = { :focus => true }
#end
#
#describe "group", :focus => true do
#  it "example 1" do
#  end
#
#  it "example 2" do
#  end
#end
#
#describe "group 2" do
#  it "example 3" do
#  end
#
#  it "example 4" do
#  end
#end

## == pg 237 ==
#
#RSpec.configure do |c|
#  c.exclusion_filter = { :slow => true }
#end
#
#describe "group" do
#  it "example 1", :slow => true do
#  end
#
#  it "example 2" do
#  end
#end

## == pg 238 ==
#
#require 'ping'
#
#RSpec.configure do |c|
#  c.exclusion_filter = {
#    :if => lambda { |what|
#      case what
#      when :network_available
#        !Ping.pingecho "example.com", 10, 80
#      end
#    }
#  }
#end
#
#describe "network group" do
#  it "example 1", :if => :network_available do
#  end
#
#  it "example 2" do
#  end
#end

## == pg 241 ==
#RSpec::Matchers.define :report_to do |boss|
#  match do |employee|
#    employee.reports_to?(boss)
#  end
#
#  failure_message_for_should do |employee|
#    "expected the team run by #{boss} to include #{employee}"
#  end
#
#  failure_message_for_should_not do |employee|
#    "expected the team run by #{boss} to exclude #{employee}"
#  end
#
#  description do
#    "expected a member of the team run by #{boss}"
#  end
#end
#
#class Employee
#  def to_s
#    "<Employee: #{@name}>"
#  end
#
#  def initialize(name, boss = nil)
#    @name, @boss = name, boss
#  end
#
#  def reports_to?(boss)
#    boss == @boss
#  end
#end
#
#describe "employee with a boss" do
#  it "should report to the boss" do
#    boss     = Employee.new("Beatrice")
#    employee = Employee.new("Joe", boss)
#    employee.should report_to(boss)
#  end
#end
