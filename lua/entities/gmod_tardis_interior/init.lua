AddCSLuaFile('cl_init.lua')
AddCSLuaFile('shared.lua')
include('shared.lua')

ENT:AddHook("PlayerInitialize", "interior", function(self)
	net.WriteString(self.metadata.ID)
end)

ENT:AddHook("PostPlayerInitialize", "senddata", function(self,ply)
	self:SendData(ply)
end)

function ENT:Initialize()
	if self.spacecheck then
		self.metadata=TARDIS:GetInterior(self.exterior.metadataID)
		if not self.metadata then
			self.metadata=TARDIS:GetInterior("default")
		end
		
		self.Model=self.metadata.Interior.Model
		self.Fallback=self.metadata.Interior.Fallback
		self.Portal=self.metadata.Interior.Portal
		self.CustomPortals=self.metadata.Interior.CustomPortals
		self.ExitDistance=self.metadata.Interior.ExitDistance
	end
	self.BaseClass.Initialize(self)
end

function ENT:OnTakeDamage(dmginfo)
	if self:CallHook("ShouldTakeDamage",dmginfo)==false then return end
	self:CallHook("OnTakeDamage", dmginfo)
end