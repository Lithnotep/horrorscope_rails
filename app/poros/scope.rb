class Scope
  attr_reader :description
  def initialize(fate = "bad")
    @date = create_date
    @description = make_scope(fate)
  end

  def make_scope(fate)
    if fate == "bad"
      "You're #{likelyhood} to be #{doom} by #{adj+" "+thing} leading to #{death} death on #{@date}"
    else
      "You've narrowly avoided being #{doom} by #{adj+" "+thing} leading to #{death} death on #{@date}"
    end
  end

  def likelyhood
    likelyhoods = ["extremely likely", "fairly likely", "likely", "undoubtly going", "without a shadow of a doubt going"]
    likelyhoods.sample
  end

  def doom
    dooms = ["devoured", "eaten alive", "eviscerated", "choked", "warped", "corrupted", "exploded", "imploded", "deconstructed", 'disemboweled', "petrified", "made ephemeral", "bullied", "made unreal", "dreamed away", "removed from existance", "shattered", "snuffed out", "diced into bite size pieces"]
    dooms.sample
  end

  def thing
    things = ["Star-Child of Lost Kadath", "swarm of shotgun toting grasshoppers", "deceptively fast sloth", "Bear", "Spawn of Darkness", "Whisperer in the Darkness", "Ineffable Color", "Waking Dream", "heard of duck sized horses", "a measly gnat", "A rainstorm of cockraoches", "a bathtub", "a necktie seeking revenge", "a cloud of razor sharp buttlerflies", "Unspeakable Truth", "Cat", "Demon", "Shoggoth", "Assassin", "Tear in Spacetime", "Fear made Manifest", "a tasteless, odorless liquid " "Terror of the Depths", "Voice who speaks terrible truths"]
    things.sample
  end

  def death
    deaths = ["Miserable", "Agonizing", "Excrutiating", "Esoteric", "Unspeakable", "Confounding", "Abrupt", "Quick", "Slow", "Vile", "Unfathomable", "Remorseless", "Unending", "Inescapeable", "Good", "Timely", "Forgotten", "Perpetual"]
    death_pick = deaths.sample
    if grammer_test(death_pick)
      "an #{death_pick}"
    else
      "a #{death_pick}"
    end
  end

  def create_date
    year = (2020..2030).to_a.sample
    month = sprintf '%02d', (1..12).to_a.sample
    day = sprintf '%02d', (1..28).to_a.sample
    "#{year}-#{month}-#{day}"
  end

  def adj
    adjs = ["Seething", "Propagating", "Polluting", "Terrifying", "Exhausted", "Spiteful", "Angry", "Enraged", "Profound", "Unholy", "Pensive", "Gleeful", "Ravenous", "Insightful", "Demented", "Inconceivable", "Forlorn", "Yearning", "Sneaky", "Slippery"]
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
