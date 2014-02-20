class 'Test'

t = Transform3()

function Test:__init()
	self.active = false
	Events:Subscribe("LocalPlayerChat", self, self.LocalPlayerChat)
	Events:Subscribe("Render", self, self.Render)
end

function Test:Render()
	if not self.active then return end
	for i=1, 91 do
		t:SetIdentity()
		t:Translate(Vector3(-6900 + 10*i, 210, -3005))
		t:Rotate(Angle(math.pi, math.pi, 0))
		t:Scale(0.05)
		Render:SetTransform(t)
		Render:DrawText(Vector3(0, 0, 0), tostring(i), Color(255, 0, 0))
	end
end

function Test:LocalPlayerChat(args)
	local msg = args.text
    local player = args.player
    local words = args.text:split(" ")
	
	if ( msg:sub(1, 1) ~= "/" ) then
        return true
    end
	if(msg == "/models on")
	then
		self.active = true
	end
	if(msg == "/models off")
	then
		self.active = false
	end
end

test = Test()