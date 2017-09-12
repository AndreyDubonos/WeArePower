display.setStatusBar( display.HiddenStatusBar )

width, height, halfW, halfH = display.contentWidth, display.contentHeight, display.contentWidth * 0.5, display.contentHeight * 0.5

local composer = require "composer"
composer.gotoScene( "gameScene" )
