CreateClientConVar("disp_showpanel",1,true,false)

surface.CreateFont("MDispMain",{
font = "Trebuchet Bold",
extended = false,
size = 17,
weight = 600
})

local dis_nick = "отсутствует"
local bbpd_nick = "отсутствует"
local dsc_nick = "отсутствует"
local ddsc_nick = "отсутствует"
local str_int = "Мин. интервал"
local dis_int = "1.45"

local function MDispatcherSetData()
	if not IsValid(MDispatcher.DPanel) then return end
	MDispatcher.DPanel.Disp:SetText("Диспетчер: "..dis_nick)
	MDispatcher.DPanel.Bpd:SetText("Блок пост депо: "..bbpd_nick)
	MDispatcher.DPanel.Dscp1:SetText("ДСЦП(1): "..dsc_nick)
	MDispatcher.DPanel.Dscp2:SetText("ДСЦП(2): "..ddsc_nick)
	MDispatcher.DPanel.Int:SetText(str_int..": "..dis_int)
	
	if dis_nick ~= "отсутствует" then RunConsoleCommand("disp_showpanel",1) end
	if bbpd_nick ~= "отсутствует" then RunConsoleCommand("disp_showpanel",1) end
	if dsc_nick ~= "отсутствует" then RunConsoleCommand("disp_showpanel",1) end
	if ddsc_nick ~= "отсутствует" then RunConsoleCommand("disp_showpanel",1) end
end

local function MDispatcherInit()
	if MDispatcher.DPanel then
		MDispatcher.DPanel:Remove()
		MDispatcher.DPanel = nil
	end
	MDispatcher.DPanel = vgui.Create("MDispatcher.DispPanel")
	MDispatcherSetData()
	hook.Remove("InitPostEntity","MDispatcher.Init")
end
hook.Add("InitPostEntity","MDispatcher.Init",MDispatcherInit)

net.Receive("MDispatcher.ServerData",function()
	dis_nick = net.ReadString()
	bbpd_nick = net.ReadString()
	dsc_nick = net.ReadString()
	ddsc_nick = net.ReadString()
	str_int = net.ReadString()
	dis_int = net.ReadString()
	MDispatcherSetData()
end)

cvars.AddChangeCallback("disp_showpanel",function(cvar,old,new)
	if (old == new) then return end
	if (dis_nick ~= "отсутствует" and not tobool(new)) then
		LocalPlayer():PrintMessage(HUD_PRINTTALK,"Нельзя скрывать панель, когда диспетчер на посту!")
		RunConsoleCommand("disp_showpanel",1)
	end
	if (bbpd_nick ~= "отсутствует" and not tobool(new)) then
		LocalPlayer():PrintMessage(HUD_PRINTTALK,"Нельзя скрывать панель, когда диспетчер на посту!")
		RunConsoleCommand("disp_showpanel",1)
	end
	if (dsc_nick ~= "отсутствует" and not tobool(new)) then
		LocalPlayer():PrintMessage(HUD_PRINTTALK,"Нельзя скрывать панель, когда диспетчер на посту!")
		RunConsoleCommand("disp_showpanel",1)
	end
	if (ddsc_nick ~= "отсутствует" and not tobool(new)) then
		LocalPlayer():PrintMessage(HUD_PRINTTALK,"Нельзя скрывать панель, когда диспетчер на посту!")
		RunConsoleCommand("disp_showpanel",1)
	end
	MDispatcher.DPanel:SetVisible(tobool(new))
end)

local DispPanel = {}

function DispPanel:Init()
	self.Disp = vgui.Create("DLabel",self)
	self.Disp:SetFont("MDispMain")
	self.Bpd = vgui.Create("DLabel",self)
	self.Bpd:SetFont("MDispMain")
	self.Dscp1 = vgui.Create("DLabel",self)
	self.Dscp1:SetFont("MDispMain")
	self.Dscp2 = vgui.Create("DLabel",self)
	self.Dscp2:SetFont("MDispMain")
	self.Int = vgui.Create("DLabel",self)
	self.Int:SetFont("MDispMain")
end

function DispPanel:Paint(w,h)
	draw.RoundedBox(5,0,0,w,h,Color(0,0,0,150))
end

function DispPanel:PerformLayout()
	self:SetSize(250,110)
	self:SetPos(ScrW() - self:GetWide() - 5,ScrH() - (ScrH()/2) - (self:GetTall()/2))
	self.Disp:SetPos(10,5)
	self.Disp:SetTextColor(Color(255,255,255,255))
	self.Disp:SetWide(240) --
	self.Bpd:SetPos(10,25) 
	self.Bpd:SetTextColor(Color(255,255,255,255))
	self.Bpd:SetWide(240)
	self.Dscp1:SetPos(10,45)
	self.Dscp1:SetTextColor(Color(255,255,255,255))
	self.Dscp1:SetWide(240)
	self.Dscp2:SetPos(10,65)
	self.Dscp2:SetTextColor(Color(255,255,255,255))
	self.Dscp2:SetWide(240)
	self.Int:SetWide(240)
	self.Int:SetPos(10,85)
	self.Int:SetTextColor(Color(255,255,255,255))
end
vgui.Register("MDispatcher.DispPanel",DispPanel,"Panel")

timer.Create("MDispatcher.SetVisible",1,0,function()
	if (not IsValid(MDispatcher.DPanel) or not IsValid(LocalPlayer())) then return end
	if ((not GetConVar("disp_showpanel"):GetBool()) or (IsValid(LocalPlayer():GetActiveWeapon()) and LocalPlayer():GetActiveWeapon():GetClass() == "gmod_camera")) then
		MDispatcher.DPanel:SetVisible(false)
	else
		MDispatcher.DPanel:SetVisible(true)
	end
end)
