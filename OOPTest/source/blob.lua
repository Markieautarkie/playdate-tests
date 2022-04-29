import "player"

local pd <const> = playdate
local gfx <const> = pd.graphics

class("Blob").extends(Player)

function Blob:init(x, y)
    local blobImage = gfx.image.new("images/blob")
    self.super.init(self, x, y, blobImage)
end