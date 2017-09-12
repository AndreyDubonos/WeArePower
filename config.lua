--
-- For more information on config.lua see the Project Configuration Guide at:
-- https://docs.coronalabs.com/guide/basics/configSettings
--
local aspectRatio = display.pixelHeight / display.pixelWidth

application =
{
	content =
	{
		width =  aspectRatio > 1.5 and 750 or 768,
		height = aspectRatio > 1.5 and 1334 or 1024, 
		scale = "letterBox",
		fps = 60,
		
		--[[
		imageSuffix =
		{
			    ["@2x"] = 2,
		},
		--]]
	},
}
