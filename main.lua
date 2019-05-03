-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created by: Mr. Coxall
-- Created on: Jan 2018
-- 
-- This file animates a charact using a spritesheet
-----------------------------------------------------------------------------------------
local map = display.newImageRect( "Sky.jpg", 2100,2100 )
map.x = 900
map.y = display.contentHeight - 1050
map.id = "map"

local theGround1 = display.newImageRect( "land.png", 10000,1000 )
theGround1.x = 1000
theGround1.y = 1800
theGround1.id = "the ground"



display.setStatusBar(display.HiddenStatusBar)
 
centerX = display.contentWidth * .5
centerY = display.contentHeight * .5

local sheetOptionsIdle =
{
    width = 587,
    height = 707,
    numFrames = 10
}
local sheetIdleKnight = graphics.newImageSheet( "knightIdle.png", sheetOptionsIdle )
theGround1.x = 1000
theGround1.y = 1800
theGround1.id = "the ground"

local sheetOptionsWalk =
{
    width = 587,
    height = 707,
    numFrames = 10
}
local sheetWalkingKnight = graphics.newImageSheet( "knightWalking.png", sheetOptionsWalk )


-- sequences table
local sequence_data = {
    -- consecutive frames sequence
    {
        name = "idle",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetIdleKnight
    },
    {
        name = "walk",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetWalkingKnight
    }
}

local knight = display.newSprite( sheetIdleKnight, sequence_data )
knight.x = centerX
knight.y = centerY

knight:play()

-- After a short time, swap the sequence to 'seq2' which uses the second image sheet
local function swapSheet()
    knight:setSequence( "walk" )
    knight:play()
    print("walk")
end

timer.performWithDelay( 2000, swapSheet )



-- After a short time, swap the sequence to 'seq2' which uses the second image sheet




display.setStatusBar(display.HiddenStatusBar)
 
centerX = display.contentWidth * .5
centerY = display.contentHeight * .5

local sheetOptionsIdleNinja =
{
    width = 232,
    height = 439,
    numFrames = 10
}
local sheetIdleNinja = graphics.newImageSheet( "ninjaBoyIdle.png", sheetOptionsIdleNinja )
theGround1.x = 1000
theGround1.y = 1800
theGround1.id = "the ground"

local sheetOptionsDead =
{
    width = 482,
    height = 498,
    numFrames = 10
}
local sheetNinjaDead = graphics.newImageSheet( "ninjaBoyDead.png", sheetOptionsDead )


-- sequences table
local sequence_data = {
    -- consecutive frames sequence
    {
        name = "idle",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetIdleNinja
    },
    {
        name = "Dead",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetNinjaDead
    }
}

local Ninja = display.newSprite( sheetIdleNinja, sequence_data )
Ninja.x = centerX
Ninja.y = centerY

Ninja:play()

-- After a short time, swap the sequence to 'seq2' which uses the second image sheet
local function swapSheetNinja() 
    Ninja:setSequence( "Dead" )
    Ninja:play()
    print("Dead")
end

timer.performWithDelay( 2000, swapSheetNinja )



-- After a short time, swap the sequence to 'seq2' which uses the second image sheet




local dPad = display.newImage( "d-pad.png" )
dPad.x = 150
dPad.y = display.contentHeight - 80
dPad.alpha = 0.50
dPad.id = "d-pad"

local upArrow = display.newImage( "upArrow.png" )
upArrow.x = 150
upArrow.y = display.contentHeight - 190
upArrow.id = "up arrow"

local downArrow = display.newImage( "downArrow.png" )
downArrow.x = 150
downArrow.y = display.contentHeight + 28
downArrow.id = "down arrow"

local leftArrow = display.newImage( "leftArrow.png" )
leftArrow.x = 40
leftArrow.y = display.contentHeight - 80
leftArrow.id = "left arrow"

local rightArrow = display.newImage( "rightArrow.png" )
rightArrow.x = 260
rightArrow.y = display.contentHeight - 80
rightArrow.id = "right arrow"

local BUTTON = display.newImage( "JUMP.png" )
BUTTON.x = display.contentWidth - 1400
BUTTON.y = display.contentHeight - 80
BUTTON.id = "BUTTON"
BUTTON.alpha = 0.5




function upArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( knight, { 
            x = 0, -- move 0 in the x direction 
            y = -50, -- move up 50 pixels
            time = 100 -- move in a 1/10 of a second
            } )
    end

    return true
end

function downArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( knight, { 
            x = 0, -- move 0 in the x direction 
            y = 50, -- move up 50 pixels
            time = 100 -- move in a 1/10 of a second
            } )
    end

    return true
end

function leftArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( knight, { 
            x = -50, -- move 0 in the x direction 
            y = 0, -- move up 50 pixels
            time = 100 -- move in a 1/10 of a second
            } )
    end

    return true
end

function rightArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( knight, { 
            x = 50, -- move 0 in the x direction 
            y = 0, -- move up 50 pixels
            time = 100 -- move in a 1/10 of a second
            } )
    end

    return true
end

function BUTTON:touch( event )
    if ( event.phase == "ended" ) then
        -- make the character jump
        knight:setLinearVelocity( 0, -750 )
    end

    return true
end

upArrow:addEventListener( "touch", upArrow )
downArrow:addEventListener( "touch", downArrow )
leftArrow:addEventListener( "touch", leftArrow )
rightArrow:addEventListener( "touch", rightArrow )

BUTTON:addEventListener( "touch", BUTTON )

