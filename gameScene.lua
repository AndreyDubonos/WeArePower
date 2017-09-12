local composer = require( "composer" )
local player = require("player")
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
local function touchListener(event)
    local self = event.target
    if ( event.phase == "began" ) then
        display.getCurrentStage():setFocus( self )
        self.isFocus = true

        player.touchJoint:setTarget( event.x, event.y )
    elseif ( self.isFocus ) then
        player.touchJoint:setTarget( event.x, event.y )
        if ( event.phase == "moved" ) then
            --print( "Moved phase of touch event detected." )         
        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
            display.getCurrentStage():setFocus( nil )
            self.isFocus = nil
        end      
    end
    return true
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    -- turn on physics
    physics.start()
    physics.setGravity( 0, 0 )
    
    -- create background
    local background = display.newImageRect(sceneGroup, "assets/images/back.png", width, height)
    background.x, background.y = halfW, halfH

    -- load and display player
    local playerView = player.load()
    sceneGroup:insert(playerView)
    background:addEventListener("touch", touchListener)
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene