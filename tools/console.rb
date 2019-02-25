require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

suzy_project = Startup.new("Suzy Project", "suzy")
bob_project = Startup.new("Bob Project", "bob")
david = VentureCapitalist.new("david")
series_a = FundingRound.new(suzy_project, david, "series_a", 1000000000.0)
series_b = FundingRound.new(suzy_project, david, "series_b", 2000.0)
khaled = VentureCapitalist.new("khaled")
series_c = FundingRound.new(suzy_project, khaled, "series_c", 3000.0)
series_d = FundingRound.new(bob_project, david, "series_d", 3500.0)
series_d_k = FundingRound.new(bob_project, khaled, "series_d", 3500000.0)
energy_sector = suzy_project.pivot("energy", "Suzy Project")
bob_domain = bob_project.pivot("tech", "Bob Project")

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
