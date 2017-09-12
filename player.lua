local T = {}

local physics = require ("physics")

T.view = nil

function T.load()
	T.view = display.newGroup()
	local ship = display.newImageRect(T.view, "assets/images/Faction6-Spaceships-by-MillionthVector/RD1.png", width * .3, width * .3)
	ship.x, ship.y = halfW, height - ship.height
	T.score = 0

	physics.addBody( ship, "dynamic", {isSensor = true})
	ship:addEventListener( "collision", function( event )
		if event.phase == "began" then
			if event.other.type == "bonus" then
				T.score = T.score + 100
			elseif event.other.type == "enemy" then
				T.score = T.score - 100
			end
			-- event.other:removeSelf()
			timer.performWithDelay(2, function() physics.removeBody(event.other) end)
			transition.to(event.other, {time=500, xScale = 0.01, yScale = 0.01, onComplete = function(obj) obj:removeSelf() end})			
		end
	end )

	T.touchJoint = physics.newJoint( "touch", ship, ship.x, ship.y )
	T.ship = ship
	return T.view
end

return T