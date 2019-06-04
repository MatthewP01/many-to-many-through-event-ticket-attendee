class Attendee

    attr_reader :name, :age
    
    @@all = []

    def initialize(name, age)
        @name = name
        @age = age

        @@all << self
    end

    def self.all
        @@all
    end

    def attendees_from_ticket
        Ticket.all.select do |attendee_|
            attendee_.attendee == self
        end
    end
    
    def events
        Ticket.all.select do |attendee_|
            attendee_.attendee == self
        end.map do |event_|
            event_.event
        end
    end

    def money_spent
        ticket_arr = self.events.map do |price|
            price.ticket_price
        end

        sum = 0
        ticket_arr.each do |price|
            sum += price
        end
        sum
    end

end

# Attendee.all
  # Returns an array of all Attendees
# Attendee#events
  # Returns an array of all Events that the Attendee is attending.
# Attendee#money_spent
  # Returns the dollar amount this Attendee has spent on Tickets for Events