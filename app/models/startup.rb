
class Startup

    @@all = []

    def self.all
        @@all 
    end
    
    def self.find_by_founder(founder) 
        self.all.find {|startup| startup.founder == founder}
    end

    def self.domain 
        self.all.map {|startup| startup.domain}
    end

    attr_accessor :domain, :name 
    attr_reader :founder 

    def initialize(name, founder, domain)
        @name = name 
        @founder = founder 
        @domain = domain 
        @@all << self 
    end

    def pivot(name, domain)
        self.name = name 
        self.domain = domain 
    end

    def sign_contract(venturecapitalist, type, investment)
        FundingRound.new(self, venturecapitalist, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|funding| funding.startup == self }
    end

    def investors 
        funding_rounds.map {|funding| funding.venturecapitalist}.uniq
    end

    def big_investors
        investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}.uniq 
    end

    def num_funding_rounds
        funding_rounds.length
    end

    def funds 
        funding_rounds.map {|funds| funds.investment}

    end

    def total_funds 
        funds.reduce {| sum, x| sum + x}
    end
   



end
