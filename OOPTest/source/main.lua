import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "donkey"
import "blob"
import "raccoon"

local pd <const> = playdate
local gfx <const> = pd.graphics

local function initialize()
	local player = Raccoon(40, 120)
	player:add()
end

initialize()

function pd.update()
	gfx.sprite.update()
	pd.timer.updateTimers()
end