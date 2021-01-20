require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

vc1 = VentureCapitalist.new("dude", 150)
vc2 = VentureCapitalist.new("dude2", 153420)
vc3 = VentureCapitalist.new("dud3", 153241294912491294420)
startup1 = Startup.new("startup1", "bob", "domain")
fr1 = FundingRound.new(startup1, vc1, "some type", 200000)
fr2 = FundingRound.new(startup1, vc1, "some type 2", 100)
fr3 = FundingRound.new(startup1, vc1, "some type 4", 1000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line