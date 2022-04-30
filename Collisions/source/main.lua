import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "ball"

local pd <const> = playdate
local gfx <const> = pd.graphics

local collResp = {"freeze", "slide", "bounce", "overlap"}
local collRespIndex = 3
currCollResp = collResp[collRespIndex]

local labelImage = nil
local labelSprite = nil

local function updateLabelImage()
	gfx.pushContext(labelImage)
		gfx.drawText("Collision type: " .. currCollResp, 0, 0)
	gfx.popContext()
end

local function initialize()
	pd.display.setRefreshRate(50)
	math.randomseed(pd.getSecondsSinceEpoch())

	local wallImage = gfx.image.new("images/wall")
	local wallSprite = gfx.sprite.new(wallImage)
	wallSprite:setCollideRect(0, 0, wallSprite:getSize())
	wallSprite:moveTo(200, 190)
	wallSprite:add()

	labelImage = gfx.image.new(200, 20)
	updateLabelImage(labelImage)
	labelSprite = gfx.sprite.new(labelImage)
	labelSprite:setCenter(0, 0)
	labelSprite:moveTo(10, 10)
	labelSprite:add()
end

initialize()

local function handleInput()
	if pd.buttonJustPressed(pd.kButtonA) then
		local ball = Ball(200, 20)
		ball:add()
	end
	if pd.buttonJustPressed(pd.kButtonB) then
		if collRespIndex == 4 then collRespIndex = 1 else collRespIndex += 1 end
		currCollResp = collResp[collRespIndex]
		labelImage:clear(gfx.kColorWhite)
		updateLabelImage()
	end
end

function pd.update()
	handleInput()
	gfx.sprite.update()
	pd.drawFPS(380, 10)

	pd.resetElapsedTime()
end