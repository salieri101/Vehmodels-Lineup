class 'RemoveTool'

function RemoveTool:__init()
	Network:Subscribe("Remove", self, self.Remove)
end

function RemoveTool:Remove(player)
	local aimobj = player:GetAimTarget()
	if aimobj == nil then return end
	if(aimobj.vehicle  ~= nil) then
		aimobj.vehicle:Remove()
		local cmd = SQL:Command( 
					"delete from cars where id = ?" )
		cmd:Bind( 1,aimobj.vehicle:GetId() )
		cmd:Execute()
	elseif(aimobj.player ~=nil)
	then
		aimobj.player:Kick("Kirugva")
	end
end

removeTool = RemoveTool()