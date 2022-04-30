local pd <const> = playdate
local gfx <const> = pd.graphics

class("Ball").extends(gfx.sprite)

function Ball:init(x, y)
    Ball.super.init(self)
    local ballImage = gfx.image.new("images/ball")
    self:setImage(ballImage)

    self:moveTo(x, y)
    self:setCollideRect(0, 0, self:getSize())
    --self:setGroups(1)

    self.speed = 0
    self.xOffset = math.random(-100, 100)

    self.sound = pd.sound.sampleplayer.new("sounds/click")
end

function Ball:update()
    Ball.super.update(self)

    local elapsedTime = pd.getElapsedTime()
    local _, _, coll, collLen = self:moveWithCollisions(self.x + self.xOffset * elapsedTime, self.y + self.speed)
    self.speed += 2 * elapsedTime

    if collLen ~= 0 then
        if coll[1].normal.x ~= 0 then self.xOffset = -self.xOffset end
        if currCollResp == "bounce" then self.speed = -self.speed * 0.8 end
    end

    if self.x < -10 or self.x > 410 or self.y > 250 then
        self:remove()
    end
end

function Ball:collisionResponse(other)
    if currCollResp == "bounce" then
        self.sound:setVolume(self.speed * 0.5)
        self.sound:play() 
    end
    return currCollResp
end