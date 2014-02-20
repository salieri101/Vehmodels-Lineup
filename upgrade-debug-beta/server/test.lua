class 'Test'

function Test:__init()
	self.vehicle = {}
	self.player = nil
	self.originalPos = nil
	self.start_world = nil
	Events:Subscribe("PlayerChat", self, self.PlayerChat)
end

function Test:SpawnModels()
    self.world = World.Create()
	print(self.world:GetId())
--	print(self.world)	
	self.vehicle:SetWorld(self.world)			
	for i=1, 91 do
--    self.vehicle:SetWorld(self.Test.world)		
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

	self.start_world = player:GetWorld()				
		self.originalPos = player:GetPosition()

	self:SpawnModels()
		self.player = player
--    self.player:SetWorld(self.Test.world)		
    --self.world = World.Create()
--	print(self.world)	
--	self.vehicle:SetWorld(self.Test.world)			
    --print(self.world:GetId())
    self.player:SetWorld(self.world)			
--    self.player:SetWorld(self.world)			
		self.player:Teleport(Vector3(-6900, 210, -3010), Angle(math.pi, 0, 0))
	end
	if(msg == "/models off")
	then
	self.player:SetWorld(1)	
		self.player:Teleport(self.originalPos, Angle(0, 0, 0))
		self.player = nil
		self:RemoveModels()
	end
end

test = Test()