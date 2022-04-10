import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"

import "circle"
import "rect"

local pd <const> = playdate
local gfx <const> = pd.graphics

local function initialize()
	local circleSprite = Circle(200, 120, 20)
	circleSprite:add()
	local circleSprite2 = Circle(50, 100, 5)
	circleSprite2:add()
	local rectSprite = Rect(0, 0, 50, 50)
	rectSprite:add()
	local rectSprite2 = Rect(100, 20, 20, 20)
	rectSprite2:add()
end

initialize()

function pd.update()
	gfx.sprite.update()
	pd.drawFPS(385, 0)
end