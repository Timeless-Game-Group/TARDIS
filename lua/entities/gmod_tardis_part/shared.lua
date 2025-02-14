ENT.Type = "anim"
if WireLib then
	ENT.Base 			= "base_wire_entity"
else
	ENT.Base			= "base_gmodentity"
end 
ENT.PrintName		= "TARDIS Part"
ENT.Author			= "Dr. Matt"
ENT.Spawnable		= false
ENT.AdminSpawnable	= false
ENT.RenderGroup 	= RENDERGROUP_BOTH
ENT.Category		= "Doctor Who"
ENT.TardisPart		= true

function ENT:Initialize() end

function ENT:SetupDataTables()
	self:NetworkVar("Bool",0,"On")
	self:SetOn(false)
end

hook.Add("PhysgunPickup", "tardis-part-freeze", function(ply,ent)
	if ent.TardisPart then return false end
end)

hook.Add("PlayerUnfrozeObject", "tardis-part-freeze", function(ply,ent,phys)
	if ent.TardisPart then phys:EnableMotion(false) end
end)

hook.Add("CanProperty", "tardis-part-freeze", function(ply,prop,ent)
	if ent.TardisPart then return false end
end)

hook.Add("CanDrive", "tardis-part-freeze", function(ply,ent)
	if ent.TardisPart then return false end
end)