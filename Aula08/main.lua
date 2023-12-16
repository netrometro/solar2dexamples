--[[
  AULA 08
  Physics
]]--
local C = require("Constants")

local physics = require("physics")
physics.start()
-- physics.setGravity( 0, 0 ) -- Gravidade zero

display.setStatusBar( display.HiddenStatusBar )

local group = display.newGroup()

local leftWall = display.newRect(
  group,
  0,
  C.CH,
  20,
  C.H
)
leftWall:setFillColor(1,0,0)
physics.addBody(leftWall,"static")

local rightWall = display.newRect(
  group,
  C.W,
  C.CH,
  20,
  C.H
)
rightWall:setFillColor(1,0,0)
physics.addBody(rightWall,"static")

local floor = display.newRect(
  group,
  C.CW,
  C.H,
  C.W,
  20
)
floor:setFillColor(1,0,0)
physics.addBody(floor,"static")


local ball = display.newCircle(
  group,
  C.CW,
  100,
  50
)
ball:setFillColor(0,0,1)
physics.addBody(ball,"dynamic", {radius=50})

local smallBall = display.newCircle(
  group,
  C.CW - 10,
  300,
  20
)
smallBall:setFillColor(0,1,0)
physics.addBody(smallBall,"dynamic",{radius=20})

-- SISTEMA DE PARTÍCULAS DO LIQUIDFUN

local testParticleSystem = physics.newParticleSystem(
  {
      filename = "assets/popcorn.png",
      radius = 20,
      imageRadius = 50
  })

local function onTimer( event )
  testParticleSystem:createParticle(
  {
      x = 10,
      y = -10,
      velocityX = 256,
      velocityY = 480,
      lifetime = 30,
      flags = { "water", "rotational" }
  })
end

timer.performWithDelay( 20, onTimer, 0 )