require 'rubygems'
require 'Selenium-webdriver'

#This is 'Happy Path' scenario is for when there is a 'Winner'

@driver = Selenium::WebDriver.for :chrome
@driver.navigate.to "https://codepen.io/CalendlyQA/full/KKPQLmV"
@driver.manage.window.maximize

#Set size of board
@tablesize = 3

puts "Scenario1 - Happy Path - Winner X Game, has started... "

sleep 2
#Switch to frame to start testing
@driver.switch_to().frame("result");

#Setting dimensions of board
@driver.find_element(:id, 'number').send_keys(@tablesize)
sleep 2
#Game Starts
@driver.find_element(:id, 'start').click
sleep 1
@driver.find_element(:id, '8').click
sleep 1
@driver.find_element(:id, '0').click
sleep 1
@driver.find_element(:id, '5').click
sleep 1
@driver.find_element(:id, '1').click
sleep 1
@driver.find_element(:id, '2').click
sleep 1

#Check To see if 'X' won
#Save string to variable
@message = @driver.find_element(:id, "endgame")

#Verify that message is as we expect (puts message.text)
if (@message.text == "Congratulations player X! You've won. Refresh to play again!")
  puts "Test passed, correct winner declared"
else
 puts "Test failed as wrong winner declared"
end
sleep 2
@driver.quit