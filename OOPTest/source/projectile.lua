local pd <const> = playdate
local gfx <const> = pd.graphics

-- Projectile class
class("Projectile").extends(gfx.sprite)

function Projectile:init(x, y, speed)
    self:moveTo(x, y)
    local projectileImage = gfx.image.new("images/projectile")
    self:setImage(projectileImage)
    self.speed = speed
end

function Projectile:update()
    Projectile.super.update(self)
    self:moveBy(self.speed, 0)
end