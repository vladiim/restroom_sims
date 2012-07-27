class Facility
  def initialize
  	@occupier = nil
  	@duration = 0
  end

  def occupy person
  	unless occupied?
  	  @occupier = person
  	  @duration = 1
  	  Person.population.delete person
  	  true
  	else
  	  false
  	end
  end

  def occupied?
  	not @occupier.nil?
  end

  def vacate
  	Person.population << @occupier
  	@occupier = nil
  end

  def tick
  	if occupied? and @duration > @occupier.use_duration
  	  vacate
  	  @duration = 0
  	elsif occupied?
  	  @duration += 1
  	end
  end
end