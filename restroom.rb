class Restroom
  attr_reader :queue
  attr_reader :facilities

  def initialize facilities_per_restroom=3
  	@queue = []
  	@facilities = []
  	facilities_per_restroom.times { @facilities << Facility.new }
  end

  def enter person
  	unoccupied_facility = @facilities.find { |facility| not facility.occupied? }
  	if unoccupied_facility
  	  unoccupied_facility.occupy person
  	else
  	  @queue << person
  	end
  end

  def tick
  	@facilities.each { |f| f.tick }
  end
end