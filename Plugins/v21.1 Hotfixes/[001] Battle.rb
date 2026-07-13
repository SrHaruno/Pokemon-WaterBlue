################################################################################
# 
# Battle class changes.
# 
################################################################################


class Battle
  attr_accessor :rage_hit_count  # Used to track the number of hits that have been taken for Rage Fist.

  #-----------------------------------------------------------------------------
  # Initializes new battle properties.
  #-----------------------------------------------------------------------------
  alias paldean_initialize initialize
  def initialize(scene, p1, p2, player, opponent)
    paldean_initialize(scene, p1, p2, player, opponent)
    @abils_triggered = [Array.new(@party1.length, false), Array.new(@party2.length, false)]
    @rage_hit_count  = [Array.new(@party1.length, 0), Array.new(@party2.length, 0)]
    @fainted_count   = [0, 0]
    @sideStatUps     = [{}, {}]
  end
  
  #-----------------------------------------------------------------------------
  # Various utilities.
  #-----------------------------------------------------------------------------
  
  def pbAddRageHit(battler, value = 1)
    @rage_hit_count[battler.index & 1][battler.pokemonIndex] += value
  end
  
  def pbRageHitCount(battler)
    return @rage_hit_count[battler.index & 1][battler.pokemonIndex]
  end
end

  