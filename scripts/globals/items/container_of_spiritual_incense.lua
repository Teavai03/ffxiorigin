-----------------------------------------
-- ID: 5244
-- Item: container_of_spiritual_incense
-- Item Effect: When applied, grants UDMGMAGIC -100% for 20s
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local duration = 20
    local power = 0
    
    local function addShield(target, power, duration)
        target:delStatusEffect(tpz.effect.MAGIC_SHIELD)
        target:addStatusEffect(tpz.effect.MAGIC_SHIELD, power, 0, duration)
    end

    if target:hasStatusEffect(tpz.effect.PHYSICAL_SHIELD) or target:hasStatusEffect(tpz.effect.MAGIC_SHIELD) then
        local effects = target:getStatusEffects()
        for _, effect in ipairs(effects) do
            if effect:getType() == tpz.effect.MAGIC_SHIELD and effect:getPower() > power then
                target:messageBasic(tpz.msg.basic.NO_EFFECT)
            elseif effect:getType() == tpz.effect.PHYSICAL_SHIELD then
                target:delStatusEffect(tpz.effect.PHYSICAL_SHIELD)
                target:addStatusEffect(tpz.effect.MAGIC_SHIELD, power, 0, duration)
            end
        end
    else
        addShield(target, power, duration)
        target:messageBasic(tpz.msg.basic.GAINS_EFFECT_OF_STATUS, tpz.effect.MAGIC_SHIELD)
    end
end
