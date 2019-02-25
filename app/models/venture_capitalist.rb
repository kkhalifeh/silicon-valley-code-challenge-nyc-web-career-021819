class VentureCapitalist

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def total_worth
    investor_rounds = FundingRound.all.select do |round|
      round.venture_capitalist == self
    end
    investor_rounds.map do |round|
      # binding.pry
      round.investment
    end.reduce(:+)
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select {|vc| vc.total_worth > 1000000000.00}
  end

  def offer_contract(startup, type, investment)
    new_investment = FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.map do |round|
      round if round.venture_capitalist == self
    end.compact
  end

  def portfolio
    FundingRound.all.map do |round|
      round.startup if round.venture_capitalist == self
    end.compact.uniq
  end

  def biggest_investment
    # binding.pry
    investments = self.funding_rounds
    investments.max {|a,b| a.investment <=> b.investment}
  end

  def invested(domain)
    # binding.pry
    sum = 0
    FundingRound.all.each do |round|
      # binding.pry
      if round.startup.domain == domain && round.venture_capitalist == self
        sum += round.investment
      end
    end
    return sum
  end

end
