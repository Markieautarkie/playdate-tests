import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "donkey"
import "blob"
import "raccoon"

local pd <const> = playdate
local gfx <const> = pd.graphics

-- Initialize some player classes to test them out
local function initialize()
	local player1 = Donkey(40, 120)
	player1:add()
	local player2 = Blob(140, 120)
	player2:add()
	local player3 = Raccoon(240, 120)
	player3:add()
end

initialize()

-- Run the main update loop
function pd.update()
	gfx.sprite.update()
	pd.timer.updateTimers()
end