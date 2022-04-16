local pd <const> = playdate
local gfx <const> = pd.graphics

class("Triangle").extends(gfx.sprite)

function Triangle:init(x1, y1, x2, y2, x3, y3)
    Triangle.super.init(self)
    local minX = math.min(x1, x2, x3)
    local minY = math.min(y1, y2, y3)
    local maxX = math.max(x1, x2, x3)
    local maxY = math.max(y1, y2, y3)
    self:moveTo(minX, minY)
    local triangleImage = gfx.image.new(
        math.abs(maxX - minX), math.abs(maxY - minY))
    gfx.pushContext(triangleImage)
        gfx.drawTriangle(x1 - minX, y1 - minY,
            x2 - minX, y2 - minY, x3 - minX, y3 - minY)
    gfx.popContext()
    self:setImage(triangleImage)
    self:setCenter(0, 0)
end