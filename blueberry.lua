-- blueberry.lua
-- play a silly song when you go entropic
local bluebuff = "Entropic Embrace"
local buffIsActive = false;
local frame = CreateFrame("FRAME", "BlueberryFrame")

frame:RegisterUnitEvent("UNIT_AURA")
frame:SetScript("OnEvent", function(self, event, ...)
  if UnitBuff("player", bluebuff) and not buffIsActive then
    buffIsActive = true;
    PlaySoundFile("Interface\\AddOns\\Blueberry\\blue.ogg", "Master");
  else
    buffIsAtive = false;
  end
end)