require 'rubygems'
require 'Selenium-webdriver'

#This scenario is for when there is a 'Tie'

@driver = Selenium::WebDriver.for :chrome
@driver.navigate.to "https://codepen.io/CalendlyQA/full/KKPQLmV"

#Set size of board
@tablesize = 3

puts "Scenario2 - Tie Game, has started... "

sleep 2

#Switch to result frame to begin test
@driver.switch_to().frame("result");

#Set size of the board
@driver.find_element(:id, 'number').send_keys(@tablesize)

#Game starts
@driver.find_element(:id, 'start').click
sleep 1

@driver.find_element(:id, '0').click
sleep 1
@driver.find_element(:id, '1').click
sleep 1
@driver.find_element(:id, '2').click
sleep 1
@driver.find_element(:id, '3').click
sleep 1
@driver.find_element(:id, '4').click
sleep 1
@driver.find_element(:id, '8').click
sleep 1
@driver.find_element(:id, '5').click
sleep 1
@driver.find_element(:id, '6').click
sleep 1
@driver.find_element(:id, '7').click
sleep 2

#Does popup display?
if (@driver.find_element(:id, "endgame")).displayed?
  puts "Winner/Tie message displayed. Test Passed"
else
  puts "Winner/Tie message doesn't display. Test Failed."  
end
sleep 2
@driver.quit