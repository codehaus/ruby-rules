

#this is for test purposes - pretend this is the real class
class Driver

  attr_accessor :age, :name
  def location
    puts "this is a test"
  end

end

#and this is the class that is "duck type" equivalent
class AnotherDriver
  attr_accessor :age, :name, :location
  attr_reader :irrelevant

end

class NotADriver
  attr_accessor :name, :age
end


class FactTest < Test::Unit::TestCase

  def test_match
    fields = ["age", "name", "location"]

    obj = Driver.new

    not_a = true
    fields.each{ |field| if not obj.respond_to? field then not_a = false end }
    assert not_a == false

  end

end