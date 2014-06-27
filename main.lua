-- MAIN.LUA
_W = display.contentWidth;
_H = display.contentHeight;
 local bg = display.newRect(_W,_H,_W,_H)
 bg.x = _W*0.5;
 bg.y  = _H*0.5;
 bg:setFillColor(1,1,1,0)

local widget = require "widget"
local color = { math.random(1,255)/255,math.random(1,255)/255,math.random(1,255)/255,1 } 
local drawingGroup = require("drawing"):new({
		Color = color,
                width = display.contentWidth, -- width of the drawing canvas
                height = display.contentHeight, -- height of th drawing canvas
	}); 
drawingGroup.x = _W*0.5;
drawingGroup.y = _H*0.5;
drawingGroup.width = width;
drawingGroup.height = height
-----------------------------------
-- UNDO & Change Color FUNCTIONS (not required)
-----------------------------------

local erase = function()
	drawingGroup.cleanDraw();
end
local changeColor = function()
        color = { math.random(1,255)/255,math.random(1,255)/255,math.random(1,255)/255,1 } 
        drawingGroup.changeColor(color);
end
local saveButton = function()

        drawingGroup.saveAsImage("saveBtn.png");
end
 
-----------------------------------
-- UNDO & ERASE BUTTONS (not required)
-----------------------------------

local eraseButton = widget.newButton{
        left = display.contentWidth-125,
        top = display.contentHeight - 50,
        label = "Erase",
        width = 100, height = 28,
        cornerRadius = 8,
        onRelease = erase
        }
local colorButton = widget.newButton{
        left = display.contentWidth-325,
        top = display.contentHeight - 50,
        label = "Change Color",
        width = 100, height = 28,
        cornerRadius = 8,
        onRelease = changeColor
        }
local saveButton = widget.newButton{
        left = display.contentWidth-210,
        top = display.contentHeight - 50,
        label = "Save Image",
        width = 100, height = 28,
        cornerRadius = 8,
        onRelease = saveButton
}
 
 
        




 