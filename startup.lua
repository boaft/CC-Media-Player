--TODO
--setup websocket server to give computer frame data at display time
--fix colors
--add audio



function setup()
	surface = dofile("surface")
	monitor = peripheral.wrap("top")
	speaker = peripheral.find("speaker")
	monitor.setTextScale(0.5)
	term.redirect(monitor)
	width, height = term.getSize()
	screen = surface.create(width, height,colors.white)
end

function getImage(webs)
	webs.send("FrameRequest")
	while true do
		local message, error = webs.receive()
			if message then
				frame=message
				return frame
			else
				return error
			end
	end
end

local ws, err = http.websocket("ws://192.168.50.239:8765")
if ws then
	print("connected")
	while true do
		local image = getImage(ws)
	end
else
	print(err)
end