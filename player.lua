local T = {}

local physics = require ("physics")

T.view = nil

function T.load()
	T.view = display.newGroup()
	local ship = display.newImageRect(T.view, "assets/images/Faction6-Spaceships-by-MillionthVector/RD1.png", width * .3, width * .3)
	ship.x, ship.y = halfW, height - ship.height

	physics.addBody( ship, "dynamic", {isSensor = true})
	ship:addEventListener( "collision", function( event )
		print("collision")		
	end )

	T.touchJoint = physics.newJoint( "touch", ship, ship.x, ship.y )
	T.ship = ship
	return T.view
end

return T