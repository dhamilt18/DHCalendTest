require 'rubygems'
require 'Selenium-webdriver'

#This is 'Happy Path' scenario is for when there is an "O" 'Winner' with large table size in a diagonal
@driver = Selenium::WebDriver.for :chrome
@driver.navigate().to  "https://codepen.io/CalendlyQA/full/KKPQLmV"

#Set size of board
@tablesize = 5

puts "Scenario4 - Large board with diagonal 'O' winner, has started... "
sleep 2

#Switch to result frame to begin test
@driver.switch_to().frame("result")

#set the size of the board
@driver.find_element(:id, "number").send_keys(@tablesize)
@driver.find_element(:id, 'start').click
sleep 1

@driver.find_element(:id, '1').click
sleep 1
@driver.find_element(:id, '0').click
sleep 1
@driver.find_element(:id, '2').click
sleep 1
@driver.find_element(:id, '6').click
sleep 1
@driver.find_element(:id, '5').click
sleep 1
@driver.find_element(:id, '12').click
sleep 1
@driver.find_element(:id, '10').click
sleep 1
@driver.find_element(:id, '18').click
sleep 1
@driver.find_element(:id, '7').click
sleep 1
@driver.find_element(:id, '24').click

sleep 4
#Check To see if 'X' won
#Save string to variable
@message = @driver.find_element(:id, "endgame")

#Verify that message is as we expect (puts message.text)
if (@message.text == "Congratulations player O! You've won. Refresh to play again!")
  puts "Test passed, correct winner declared"
else
 puts "Test failed as wrong winner declared"
end
sleep 2
@driver.quit