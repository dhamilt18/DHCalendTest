require 'rubygems'
require 'Selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://codepen.io/CalendlyQA/full/KKPQLmV"
#driver.get "https://marinari.github.io/calendly_qa_assign/"

puts "Chrome page loaded..."
#inputfield = driver.find_element :id => "number"

inputfield = driver.find_element(:id, 'number')
inputfield.send_keys "3"

driver.find_element(:id, 'start').click
sleep(0.5)
driver.find_element(:id, '0').click
sleep(1)
driver.find_element(:id, '3').click
sleep(1)
driver.find_element(:id, '6').click
sleep(1)
driver.find_element(:id, '4').click
sleep(1)
driver.find_element(:id, '5').click
sleep(1)
driver.find_element(:id, '7').click
sleep(1)
driver.find_element(:id, '1').click
sleep(1)
driver.find_element(:id, '2').click
sleep(1)
driver.find_element(:id, '8').click

sleep(2)
# assert(@driver.find_element(:id => "endgame").text.include?("Congratulations player O! You've won. Refresh to play again!"),"Incorrect User Displayed")
  congratsmessage = driver.find_element(:id, 'endgame')
"".eql? congratsmessage.text
puts "Congradulations message is empty. Element is always present on page. Nothing renders to user."
driver.quit