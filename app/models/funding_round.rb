class FundingRound

  attr_accessor :venture_capitalist, :type, :investment
  attr_reader :startup, :domain
  @@all = []

  def initialize(startup, venture_capitalist, type, investment)
    if investment < 0
      puts "cannot add investment"
    else
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    @investment = investment.to_f
    @@all << self
  end
  end

  # def startup
  #   Startup.all.find {|startup| startup == self}
  #   binding.pry
  # end

  def self.all
    @@all
  end

  def domain
    Startup.all.self.domain
  end

  # def investment=(investment)
  #   if investment > 0.0
  #   else
  #     puts "Investment is less than 0"
  #   end
  # end

end
