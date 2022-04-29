import "player"

local pd <const> = playdate
local gfx <const> = pd.graphics

class("Donkey").extends(Player)

function Donkey:init(x, y)
    local donkeyImage = gfx.image.new("images/donkey")
    Donkey.super.init(self, x, y, donkeyImage)
    self.moveSpeed = 1
    self. projectileSpeed = 1
end

function Donkey:ability()
    self:shoot(self.x, self.y - 10)
    self:shoot(self.x, self.y)
    self:shoot(self.x, self.y + 10)
end