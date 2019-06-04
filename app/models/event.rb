class Event

    attr_reader :name, :total_price, :ticket_price
    
    @@all = []
    
    def initialize(name, total_price, ticket_price)
        @name = name
        @total_price = total_price
        @ticket_price = ticket_price

        @@all << self
    end

    def self.all
        @@all
    end

    def attendees
        Ticket.all.select do |eve|
            eve.event == self
        end.map do |attend|
            attend.attendee
        end
    end

    def events_from_ticket
        Ticket.all.select do |eve|
            eve.event == self
        end
    end

    def sales_to_break_even
        concert_cost = self.events_from_ticket[0].event.total_price
        ticket_cost = self.events_from_ticket[0].event.ticket_price

        sum = 0
        self.events_from_ticket.each do |cost|
            sum += cost.event.ticket_price
        end
        sum

        if sum >= concert_cost
            return 0
        else
            (concert_cost - sum)/ticket_cost
        end

    end

    def average_age
        age_sum = 0
        self.attendees.each do |num|
            age_sum += num.age
        end
        (age_sum / self.attendees.count).to_f
    end

end

# Event.all
  # Returns an array of all Events
# Event#sales_to_break_even
  # Returns the number of Tickets that still need to be "purchased" for this Event before the Event reaches the break-even point.
  # If the Event has sold enough Tickets to break-even, return the number 0. 
# Event#attendees
  # Returns an array of Attendee that have Tickets for the Event
# Event#average_age
  # Returns the average age of all the Attendees that will be at the Event
