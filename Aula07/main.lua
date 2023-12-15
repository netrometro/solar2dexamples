--[[
  AULA 02
  Animação e transições
]]--
local C = require('Constants')

local sheetOptions =
{
  width = 64,
  height = 64,
  numFrames = 256
}

local sheetGlobe = graphics.newImageSheet( "assets/earth.png", sheetOptions )

local sequencesGlobe = {
  {
    name = "fast",
    start = 1,
    count = 256,
    time = 10000,
    loopCount = 0,
    loopDirection = "forward"
  },
  {
    name = "normal",
    start = 1,
    count = 256,
    time = 100,
    loopCount = 0,
    loopDirection = "forward"
  }
}

local globe = display.newSprite( sheetGlobe, sequencesGlobe )
globe.x = C.CW
globe.y = C.CH
globe:scale(4,4)
globe:play() -- Sequence default "normal" (a última)
--globeRotation:play("fast")

function globe.back()
  transition.to( globe, { time=1500, alpha=1, x=C.CW, y=0, onComplete=globe.go } )
end

function globe.go()
  transition.to( globe, { time=1500, alpha=0, x=C.CW, y=C.H, onComplete=globe.back } )
end

globe.go()