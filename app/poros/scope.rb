class Scope

  def initialize
    @description = "Your likely to be #{doom} by a #{adj+thing} leading to a #{death} death on #{date}"
  end

  def doom
    dooms = ["devoured", "eaten alive", "eviscerated", "choked", "warped", "corrupted", "exploded", "imploded", "deconstructed", 'disemboweled', "petrified", "made ephemeral", "made unreal", "dreamed away", "negated"]
    dooms.sample
  end

  def thing
    things = ["Star-Child of Lost Kadath", "Bear", "Spawn of Darkness", ""]
  end

  def death

  end

  def date
    year = [2020..2100].sample
    month = [1..12].sample
    day = [1..28].sample
    "#{year}-#{month}-#{day}"
  end

  def adj

  end

end
