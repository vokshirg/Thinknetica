class Flyer
  attr_reader :name, :email, :miles_flown

  def initialize(name, email, miles_flown)
    @name = name
    @email = email
    @miles_flown = miles_flown
  end

  def to_s
    puts "#{name} (#{email}): #{miles_flown}"
  end
end

flyers = []
5.times do |i|
  i += 1
  flyers << Flyer.new("Flyer #{i}", "flyer#{i}@example.com", i * 1000)
end
flyers.each(&:to_s)
