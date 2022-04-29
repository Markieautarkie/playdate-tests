import "player"

local pd <const> = playdate
local gfx <const> = pd.graphics

class("Raccoon").extends(Player)

function Raccoon:init(x, y)
    local raccoonImage = gfx.image.new("images/raccoon")
    self.super.init(self, x, y, raccoonImage)
    self.moveSpeed = 10
    self.projectileSpeed = 5
end

function Raccoon:ability()
    self.projectileSpeed = 20
    self:shoot(self.x, self.y)
    self.projectileSpeed = 5
end