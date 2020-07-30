class Scope
  attr_reader :description
  def initialize
    @description = "You're likely to be #{doom} by #{adj+" "+thing} leading to #{death} death on #{@date}"
    @date = create_date
  end

  def doom
    dooms = ["devoured", "eaten alive", "eviscerated", "choked", "warped", "corrupted", "exploded", "imploded", "deconstructed", 'disemboweled', "petrified", "made ephemeral", "made unreal", "dreamed away", "removed from existance"]
    dooms.sample
  end

  def thing
    things = ["Star-Child of Lost Kadath", "Bear", "Spawn of Darkness", "Whisperer in the Darkness", "Ineffable Color", "Waking Dream", "Unspeakable Truth", "Cat", "Demon", "Shoggoth", "Assassin", "Tear in Spacetime", "Fear made Manifest", "Terror of the Depths", "Voice who speaks terrible truths"]
    things.sample
  end

  def death
    deaths = ["Miserable", "Agonizing", "Esoteric", "Unspeakable", "Confounding", "Abrupt", "Quick", "Slow", "Vile", "Unfathomable", "Remorseless", "Unending", "Inescapeable", "Good", "Timely", "Forgotten", "Perpetual"]
    death_pick = deaths.sample
    if grammer_test(death_pick)
      "an #{death_pick}"
    else
      "a #{death_pick}"
    end
  end

  def create_date
    year = (2020..2100).to_a.sample
    month = (1..12).to_a.sample
    day = (1..28).to_a.sample
    "#{year}-#{month}-#{day}"
  end

  def adj
    adjs = ["Seething", "Propagating", "Polluting", "Terrifying", "Exhausted", "Spiteful", "Angry", "Enraged", "Profound", "Unholy", "Pensive", "Gleeful", "Ravenous", "Insightful", "Demented", "Inconceivable", "Forlorn", "Yearning"]
    adj_pick = adjs.sample
    if grammer_test(adj_pick)
      "an #{adj_pick}"
    else
      "a #{adj_pick}"
    end
  end

  def grammer_test(check)
    aeiou = "aeiou"
    aeiou.include?(check.first.downcase)
  end
end
