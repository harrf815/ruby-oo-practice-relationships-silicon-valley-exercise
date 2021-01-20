

class VentureCapitalist

    @@all = []

    def self.all
        @@all
    end

    def self.tres_commas_club 
        self.all.select { |person| person.total_worth > 1000000000}
    end

    attr_accessor :total_worth
    attr_reader :name 

    def initialize(name, total_worth)
        @name = name 
        @total_worth = total_worth
        @@all << self 
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds 
        FundingRound.all.select {|fundinground| fundinground.venturecapitalist == self }
    end

    def portfolio
        funding_rounds.map {|fundingrounds| fundingrounds.startup }.uniq 
    end

    def biggest_investment 
        funding_rounds.reduce { |max, funds| max.investment > funds.investment ? max : funds }
    end

    def invested(domain)
        startup = Startup.all.find { |startup| startup.domain == domain }
        startup.total_funds
    end
end
