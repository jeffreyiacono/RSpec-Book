class Order
  def initialize(discount)
    @discount = discount.gsub(/%/, '').to_f
  end

  def order(price)
    @price = price.gsub(/\$/, '').to_f
  end

  def statement
    "Statement total is: $#{"%.2f" % (@price * (1 - (@discount / 100)))}"
  end
end

Given /^a discount of (\d+)%$/ do |discount|
  @order = Order.new(discount)
end

When /^I order the following book:$/ do |books_table|
  books_table.hashes.each { |hash| @order.order(hash['price']) }
end

Then /^the statement should read: "([^"]*)"$/ do |statement_details|
  @order.statement.should == statement_details
end
