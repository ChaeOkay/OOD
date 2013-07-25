#Chapter 3

class Lamp
  attr_reader :input_watts, :system_lumen_output

  def initialize(args)
    @input_watts = args[:input_watts]
    @system_lumen_output = args[:lumen_output]
  end

  def efficiency
    (system_lumen_output / input_watts.to_f).round(2)
  end
end

class BallastSystem
  def initialize(initial_lumens, ballast_factor = 1)
    @initial_lumens = initial_lumens
    @ballast_factor = ballast_factor
  end

  def lumen_output
    @initial_lumens * @ballast_factor
  end
end

incandescent = Lamp.new(
                  input_watts: 100,
                  lumen_output: BallastSystem.new(1190).lumen_output)

led = Lamp.new(
                  input_watts: 10,
                  lumen_output: BallastSystem.new(940).lumen_output)

fluorescent = Lamp.new(
                  input_watts: 33,
                  lumen_output: BallastSystem.new(2_900, 0.95).lumen_output)

p incandescent.efficiency
p led.efficiency
p fluorescent.efficiency


#############################################

module LampFramework
  class Lamp
    attr_reader :input_watts, :system_lumen_output
    def initialize(input_watts, system_lumen_output)
      @input_watts = input_watts
      @system_lumen_output = system_lumen_output
    end

    def efficiency
      (system_lumen_output / input_watts.to_f).round(2)
    end
  end
end

module LampWrapper
    def  self.lamp(args)
      LampFramework::Lamp.new(args[:input_watts],
                                                args[:system_lumen_output])
    end
end

class BallastSystem
  def initialize(initial_lumens, ballast_factor = 1)
    @initial_lumens = initial_lumens
    @ballast_factor = ballast_factor
  end

  def lumen_output
    @initial_lumens * @ballast_factor
  end
end

fluorescent2 = LampWrapper.lamp(
                  input_watts: 100,
                  lumen_output: BallastSystem.new(1190).lumen_output)
p fluorescent.efficiency


###########################################

class Lamp
  attr_reader :input_watts, :system_lumen_output

  def initialize(args)
    @input_watts = args[:input_watts]
    @system_lumen_output = args[:lumen_output]
  end

  def efficiency
    (system_lumen_output / input_watts.to_f).round(2)
  end
end

class BallastSystem
  def initialize(initial_lumens, ballast_factor = 1, input_watts)
    @initial_lumens = initial_lumens
    @ballast_factor = ballast_factor
    @input_watts = input_watts
  end

  def lumen_output
    @initial_lumens * @ballast_factor
  end

  def efficiency
    (lumen_output / @input_watts.to_f).round(2)
  end
end

universal_28T5 = BallastSystem.new(2_900, 0.95, 33)
p universal_28T5.efficiency
