class 'Test'

function Test:__init()
	self.vehicle = {}
	self.player = nil
	self.originalPos = nil
	Events:Subscribe("PlayerChat", self, self.PlayerChat)
end

function Test:SpawnModels()
	for i=1, 91 do
		self.vehicle[i] = Vehicle.Create(i, Vector3(-6900, 210, -3000)+Vector3(i*10, 0, 0), Angle(0, 0, 0))
	end
end

function Test:RemoveModels()
	for i=1, 91 do
		self.vehicle[i]:Remove()
	end
end

function Test:PlayerChat(args)
	local msg = args.text
    local player = args.player
    local words = args.text:split(" ")
	
	if ( msg:sub(1, 1) ~= "/" ) then
        return true
    end
	if(msg == "/models on")
	then
		self:SpawnModels()
		self.originalPos = player:GetPosition()
		self.player = player
		self.player:Teleport(Vector3(-6900, 210, -3010), Angle(math.pi, 0, 0))
	end
	if(msg == "/models off")
	then
		self.player:Teleport(self.originalPos, Angle(0, 0, 0))
		self.player = nil
		self:RemoveModels()
	end
end

test = Test()