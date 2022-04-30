import "player"

local pd <const> = playdate
local gfx <const> = pd.graphics

-- Sub class of player
class("Raccoon").extends(Player)

function Raccoon:init(x, y)
    local raccoonImage = gfx.image.new("images/raccoon")
    Raccoon.super.init(self, x, y, raccoonImage)
    self.moveSpeed = 10
    self.projectileSpeed = 5
end

-- Quick and dirty way to make some custom ability
function Raccoon:ability()
    self.projectileSpeed = 20
    self:shoot(self.x, self.y)
    self.projectileSpeed = 5
end