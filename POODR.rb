require 'pry'

class Lamp
  attr_reader :input_watts, :ballast_system

  def initialize(input_watts, initial_lumens, ballast_factor = 1)
    @input_watts = input_watts
    @ballast_system = BallastSystem.new(initial_lumens, ballast_factor)
  end

  def efficiency
    (ballast_system.lumen_output / input_watts.to_f).round(2)
  end

  BallastSystem = Struct.new(:initial_lumens, :ballast_factor) do
      def lumen_output
        initial_lumens * ballast_factor
      end
    end
end


incandescent= Lamp.new(100, 1190)
incandescent.input_watts
led = Lamp.new(10, 940)
fluorescent = Lamp.new(33, 2_900, 0.95)

p incandescent.efficiency
p led.efficiency
p fluorescent.ballast_system
p fluorescent.efficiency
