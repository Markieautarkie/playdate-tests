local pd <const> = playdate
local gfx <const> = pd.graphics

class("Rect").extends(gfx.sprite)

function Rect:init(x, y, w, h)
    Rect.super.init(self)
    self:moveTo(x, y)
    local rectImage = gfx.image.new(w, h)
    gfx.pushContext(rectImage)
        gfx.setLineWidth(10)
        gfx.drawRect(0, 0, w, h)
    gfx.popContext()
    self:setImage(rectImage)
end