-- blueberry.lua
-- play a silly song when you go entropic
local state = { ["Entropic Embrace"] = false }

local bf = CreateFrame("FRAME", "BlueberryFrame")
bf:RegisterUnitEvent("UNIT_AURA", "player")
bf:SetScript("OnEvent", function(self, event, ...)
  for buff, active in pairs(state) do
    if UnitBuff("player", buff) then
      if not active then
        PlaySoundFile("Interface\\AddOns\\Blueberry\\blue.ogg", "Master")
        state[buff] = true
      end
    elseif active then
      state[buff] = false
    end
  end
end)