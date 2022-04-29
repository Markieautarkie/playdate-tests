import "projectile"

local pd <const> = playdate
local gfx <const> = pd.graphics

class("Player").extends(gfx.sprite)

function Player:init(x, y, image)
    self:moveTo(x, y)
    self:setImage(image)
    self.moveSpeed = 5
    self.projectileSpeed = 3
end

function Player:shoot(x, y)
    local projectile = Projectile(x + 10, y, self.projectileSpeed)
    projectile:add()
end

function Player:ability()
    local function timerCallback()
        self:shoot(self.x, self.y)
    end
    pd.timer.performAfterDelay(50, timerCallback)
    pd.timer.performAfterDelay(150, timerCallback)
end

function Player:update()
    Player.super.update(self)
    if pd.buttonJustPressed(pd.kButtonA) then
        self:shoot(self.x, self.y)
    end
    if pd.buttonJustPressed(pd.kButtonB) then
        self:ability()
    end
    if pd.buttonIsPressed(pd.kButtonUp) then
        self:moveBy(0, -self.moveSpeed)
    elseif pd.buttonIsPressed(pd.kButtonDown) then
        self:moveBy(0, self.moveSpeed)
    end
end