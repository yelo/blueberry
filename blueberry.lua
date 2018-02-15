-- The MIT License (MIT)
--
-- Copyright (c) 2018 Jimmy Kumpulainen
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--
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