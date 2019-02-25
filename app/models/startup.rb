class Startup

  attr_reader :founder
  attr_accessor :name, :domain

  @@all = []

  def initialize(name, founder)
    @name = name
    @founder = founder
    @@all << self
  end

  def pivot(domain, name)
    self.domain = domain
    self.name = name
  end

  def self.all
    @@all
  end

  def self.find_by_founder(name)
    # binding.pry
    self.all.find do |startup|
      startup.founder == name
    end
  end

  def self.domains
    self.all.map do |startup|
      startup.domain
    end
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def num_funding_rounds
    FundingRound.all.select do |round|
      round.startup == self
      # binding.pry
    end.count
  end

  def total_funds
    total_investments = FundingRound.all.map do |round|
      round.investment if round.startup == self
    end
    total_investments.reduce(:+)
  end

  def investors
    all_investors = FundingRound.all.map do |round|
      round.venture_capitalist if round.startup == self
    end
    all_investors.uniq
  end

  def big_investors
    # binding.pry
    tres_club = VentureCapitalist.tres_commas_club
    startup_investors = self.investors
    startup_investors.map do |investor|
      investor if tres_club.include?(investor)
    end.compact
  end



end
