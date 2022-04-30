import "player"

local pd <const> = playdate
local gfx <const> = pd.graphics

-- Blob is a subclass of Player
class("Blob").extends(Player)

-- Basically only passes an image on top of standard functionality
function Blob:init(x, y)
    local blobImage = gfx.image.new("images/blob")
    Blob.super.init(self, x, y, blobImage)
end