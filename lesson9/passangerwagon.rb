class PassangerWagon < Wagon
  attr_reader :places, :free_places

  def initialize(places)
    @places = places
    @free_places = places
    super
  end

  def occupy_place
    if @free_places > 0
      @free_places -= 1
    else
      fail "Все места в данном вагоне заняты"
    end
  end

  def occupied_places
    @places - @free_places
  end
end
