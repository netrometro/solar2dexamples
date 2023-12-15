--[[
  AULA 01
  Grupos, Imagem, Interação e Som
]]--
local C = require('Constants')

local backgroundMusic = audio.loadStream("assets/lazyday.mp3", { channel=1, loops=-1 })
audio.play(backgroundMusic)

local light = audio.loadSound("assets/1_Coins.ogg")



local scene = display.newGroup()

local bg = display.newImage(scene, 'assets/capa.png', C.CW, C.CH)


-- PRISMA

local prismaOff = display.newImage(
  scene,
  'assets/prisma-off.png',
  C.CW,
  C.CH
)

local prismaOn = display.newImage(
  scene,
  'assets/prisma-on.png',
  C.CW,
  C.CH
)

local ray = display.newRect(
  scene,
  115,
  C.CH + 35,
  200,
  7
)
ray.alpha = 0.01

function ray.handle(event)
  print(event.phase)
  if (event.phase == 'began') then
    prismaOn.isVisible = false
    audio.play(light)
  end
  
  if (event.phase == 'ended') then
    prismaOn.isVisible = true
  end
end

ray:addEventListener('touch', ray.handle)

