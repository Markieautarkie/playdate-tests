import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"

import "circle"
import "rect"
import "line"
import "triangle"

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
	local lineSprite1 = Line(400, 240, 200, 120)
	lineSprite1:add()
	local lineSprite2 = Line(30, 45, 356, 200)
	lineSprite2:add()
	local triangleSprite1 = Triangle(0, 0, 200, 50, 100, 240)
	triangleSprite1:add()
	local triangleSprite2 = Triangle(50, 40, 400, 165, 360, 200)
	triangleSprite2:add()
end

initialize()

function pd.update()
	gfx.sprite.update()
	pd.drawFPS(385, 0)
end