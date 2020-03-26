require 'rubygems'
require 'Selenium-webdriver'

#This scenario verifies page elements and table size

@driver = Selenium::WebDriver.for :chrome
@driver.navigate.to "https://codepen.io/CalendlyQA/full/KKPQLmV"

#set side of table
@tablesize = 3;
#set the size of the table matrix
@size = (@tablesize.to_i * @tablesize.to_i) - 1

puts "Scenario3 - Verify page elements"

sleep 2
#Switch to result frame to begin test
@driver.switch_to().frame("result")

#Verify Page elements 
if (@driver.find_element(:id, 'number').displayed?)
  puts "Input field is displayed"
else
  puts "Input field is not displayed"
end
if(@driver.find_element(:id, 'start').displayed?)
  puts "Play button is displayed"
else
  puts "Play button is not displayed"
end

#Set size of the board
@driver.find_element(:id, 'number').send_keys(@tablesize)
@driver.find_element(:id, 'start').click
sleep 2

#Verify Elements of board exist
#Use for loop to iterate through size of table
for a in 0..@size do
  if(@driver.find_element(:id, a).displayed?)
    #Convert to string to print out
    puts "Table element " + a.to_s + " is present"
  else
    puts "Element " + a.to_s + " is not present"
  end
end
sleep 2
@driver.quit