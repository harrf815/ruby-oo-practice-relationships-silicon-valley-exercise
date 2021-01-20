
class FundingRound

    @@all = []

    def self.all
        @@all 
    end

    attr_accessor :investment, :type 
    attr_reader :startup, :venturecapitalist 

    def initialize(startup, venturecapitalist, type, investment )
        @startup = startup 
        @venturecapitalist = venturecapitalist
        @type = type
        @investment = investment.clamp(0, Float::INFINITY)
        @@all << self 
    end
    def investment=(investment)
        @investment = investment.clamp(0, Float::INFINITY)
    end

end
