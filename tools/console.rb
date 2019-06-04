require_relative '../config/environment.rb'
require_relative '../app/models/attendee.rb'
require_relative '../app/models/ticket.rb'
require_relative '../app/models/event.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Example of a variable definition that will be available in your Pry session once you've built out the model:

lucy = Attendee.new("Lucy", 20)
matt = Attendee.new("Matt", 71)
jodie = Attendee.new("Jodie", 21)

coachella = Event.new("Coachella", 10000, 50)
weekend = Event.new("Big Weekend", 20000, 70)

matt_ticket = Ticket.new(matt, weekend)
matt_ticket2 = Ticket.new(matt, coachella)
jodie_ticket = Ticket.new(jodie, weekend)
lucy_ticket = Ticket.new(lucy, coachella)




binding.pry
0 #leave this here to ensure binding.pry isn't the last line
