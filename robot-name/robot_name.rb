require "set"

class Robot
  @@known_names = Set::new
  @robot_name = ""

  def self.forget()
    @@known_names.clear()
  end

  def initialize()
    reset()
  end

  def name
    @robot_name
  end

  def reset()
    @robot_name = generate_random_name()
  end

  private

  def self.rand_digit()
    rand(0..9)
  end

  def self.rand_char()
    rand("A".bytes.first.."Z".bytes.first).chr
  end

  def self.generate_new_name()
    [
      rand_char(),
      rand_char(),
      rand_digit(),
      rand_digit(),
      rand_digit(),
    ].join
  end

  def generate_random_name()
    potential_name = Robot.generate_new_name()
    while @@known_names.add?(potential_name).nil?
      potential_name = Robot.generate_new_name()
    end
    potential_name
  end
end
