class Lamp
  attr_reader :initial_lumens, :input_watts

  def initialize(initial_lumens, input_watts)
    @initial_lumens = initial_lumens
    @input_watts = input_watts
  end

  def efficiency
    initial_lumens / input_watts.to_f
  end
end


incandescent= Lamp.new(1190, 100)
led = Lamp.new(940, 10)

p incandescent.efficiency
p led.efficiency
