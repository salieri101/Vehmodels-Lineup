class 'RemoveTool'

function RemoveTool:__init()
	self.active = false
	Events:Subscribe("LocalPlayerChat", self, self.LocalPlayerChat)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
end

function RemoveTool:LocalPlayerInput(args)
	if not self.active then return end
	if args.input == Action.FireRight
	then
		Network:Send("Remove", LocalPlayer)
	end
end

function RemoveTool:LocalPlayerChat(args)
	local msg = args.text
    local player = args.player
	local gray = Color(200, 200, 200)
	
	if msg == "/rem on"
	then
		self.active = true
		Chat:Print("Remove tool is on", gray)
	end
	if msg == "/rem off"
	then
		self.active = false
		Chat:Print("Remove tool is off", gray)
	end
end

removeTool = RemoveTool()