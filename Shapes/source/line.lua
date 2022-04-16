local pd <const> = playdate
local gfx <const> = pd.graphics

class("Line").extends(gfx.sprite)

function Line:init(x1, y1, x2, y2)
    Line.super.init(self)
    self:moveTo(math.min(x1, x2), math.min(y1, y2))
    local absX = math.abs(x2 - x1)
    local absY = math.abs(y2 - y1)
    local lineImage = gfx.image.new(absX, absY)
    gfx.pushContext(lineImage)
        gfx.drawLine(0, 0, absX, absY)
    gfx.popContext()
    self:setImage(lineImage)
    self:setCenter(0, 0)
end