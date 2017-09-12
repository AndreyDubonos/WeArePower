local T = {}

T.view = nil

function T.load()
	T.view = display.newGroup()
	local ship = display.newImageRect(T.view, "assets/images/Faction6-Spaceships-by-MillionthVector/RD1.png", width * .3, width * .3)
	ship.x, ship.y = halfW, height - ship.height

	return T.view
end

return T