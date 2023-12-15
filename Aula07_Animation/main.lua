--[[
  AULA 02
  Animação
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

local globeRotation = display.newSprite( sheetGlobe, sequencesGlobe )
globeRotation.x = C.CW
globeRotation.y = C.CH
globeRotation:scale(4,4)
globeRotation:play() -- Sequence default "normal" (a última)
--globeRotation:play("fast")