if CLIENT then return end
util.AddNetworkString("MDispatcher.ServerData")
local cur_dis = "отсутствует"
local cur_bbpd = "отсутствует"
local cur_ddscp1 = "отсутствует"
local cur_ddscp2 = "отсутствует"
local str_int = "Мин. интервал"
local cur_int = "1.45"

-- проверенные интервалы по картам
local map = game.GetMap()
if map:find("gm_smr_first_line") then cur_int = "3.00" end
if map:find("gm_mus_loopline") then cur_int = "3.00" end

local function SendToClients()
	net.Start("MDispatcher.ServerData")
		net.WriteString(cur_dis)
		net.WriteString(cur_bbpd)
		net.WriteString(cur_ddscp1)
		net.WriteString(cur_ddscp2)
		net.WriteString(str_int)
		net.WriteString(cur_int)
	net.Broadcast()
end

-- функции ДЦХ
function MDispatcher.Disp(ply)
	cur_dis = ply:Nick();
	local msg = "игрок "..cur_dis.." заступил на пост Диспетчера.";
	ULib.tsayColor(nil,false,Color(255, 0, 0), "Внимание, машинисты: ",Color(0, 148, 255),msg);
	SendToClients();
	hook.Run("DispInfoTookPost",cur_dis);
end;

function MDispatcher.SetDisp(ply,target)
	cur_dis = target:Nick();
	local msg = "игрок "..cur_dis.." заступил на пост Диспетчера.";
	ULib.tsayColor(nil,false,Color(255, 0, 0), "Внимание, машинисты: ",Color(0, 148, 255),msg);
	SendToClients();
	hook.Run("DispInfoTookPost",cur_dis);
end;

function MDispatcher.UnDisp(ply)
	if cur_dis != "отсутствует" then
		if cur_dis == ply:Nick() then
			hook.Run("DispInfoFreedPost",cur_dis);
			local msg = "игрок "..cur_dis.." покинул пост Диспетчера.";
			cur_dis = "отсутствует";
			str_int = "Мин. интервал";
			cur_int = "1.45";
			ULib.tsayColor(nil,false,Color(255, 0, 0), "Внимание, машинисты: ",Color(0, 148, 255),msg);
		else
			if (ply:IsAdmin()) then
				hook.Run("DispInfoFreedPost",cur_dis);
				local msg = ply:Nick().." снял игрока "..cur_dis.." с поста Диспетчера.";
				cur_dis = "отсутствует";
				str_int = "Мин. интервал";
				cur_int = "1.45";
				ULib.tsayColor(nil,false,Color(255, 0, 0), "Внимание, машинисты: ",Color(0, 148, 255),msg);
			else
				ply:PrintMessage(HUD_PRINTTALK,"Вы не можете покинуть пост, поскольку вы не на посту! Сейчас диспетчер "..cur_dis..".");
			end;
		end;
		SendToClients();
	else
		ply:PrintMessage(HUD_PRINTTALK,"Диспетчер на посту отсутствует!");
	end;
end;

-- фунции Блок Пост Депо
function MDispatcher.Bpd(ply)
	cur_bbpd = ply:Nick();
	local msg = "игрок "..cur_bbpd.." заступил на пост Блок Пост Депо.";
	ULib.tsayColor(nil,false,Color(255, 0, 0), "Внимание, машинисты: ",Color(0, 148, 255),msg);
	SendToClients();
	hook.Run("DispInfoTookPost",cur_bbpd);
end

function MDispatcher.SetBpd(ply,target)
	cur_bbpd = target:Nick();
	local msg = "игрок "..cur_bbpd.." заступил на пост Блок Пост Депо.";
	ULib.tsayColor(nil,false,Color(255, 0, 0), "Внимание, машинисты: ",Color(0, 148, 255),msg);
	SendToClients();
	hook.Run("DispInfoTookPost",cur_bbpd);
end

function MDispatcher.UnBpd(ply)
	if cur_bbpd != "отсутствует" then
		if cur_bbpd == ply:Nick() then
			hook.Run("DispInfoFreedPost",cur_bbpd);
			local msg = "игрок "..cur_bbpd.." покинул пост Блок Пост Депо.";
			cur_bbpd = "отсутствует";
			ULib.tsayColor(nil,false,Color(255, 0, 0), "Внимание, машинисты: ",Color(0, 148, 255),msg);
		else
			if (ply:IsAdmin()) then
				hook.Run("DispInfoFreedPost",cur_bbpd);
				local msg = ply:Nick().." снял игрока "..cur_bbpd.." с поста Блок Пост Депо.";
				cur_bbpd = "отсутствует";
				ULib.tsayColor(nil,false,Color(255, 0, 0), "Внимание, машинисты: ",Color(0, 148, 255),msg);
			else
				ply:PrintMessage(HUD_PRINTTALK,"Вы не можете покинуть пост, поскольку вы не на посту! Сейчас Блок пост Депо "..cur_bbpd..".");
			end;
		end;
		SendToClients();
	else
		ply:PrintMessage(HUD_PRINTTALK,"Блок Пост Депо на посту отсутствует!");
	end;
end;

-- фунции ДСЦП(1)
function MDispatcher.Dscp1(ply)
	cur_ddscp1 = ply:Nick()
	local msg = "игрок "..cur_ddscp1.." заступил на пост ДСЦП(1)."
	ULib.tsayColor(nil,false,Color(255, 0, 0), "Внимание, машинисты: ",Color(0, 148, 255),msg)
	SendToClients()
	hook.Run("DispInfoTookPost",cur_ddscp1)
end

function MDispatcher.SetDscp1(ply,target)
	cur_ddscp1 = target:Nick()
	local msg = "игрок "..cur_ddscp1.." заступил на пост ДСЦП(1)."
	ULib.tsayColor(nil,false,Color(255, 0, 0), "Внимание, машинисты: ",Color(0, 148, 255),msg)
	SendToClients()
	hook.Run("DispInfoTookPost",cur_ddscp1)
end

function MDispatcher.UnDscp1(ply)
	if cur_ddscp1 != "отсутствует" then
		if cur_ddscp1 == ply:Nick() then
			hook.Run("DispInfoFreedPost",cur_ddscp1)
			local msg = "игрок "..cur_ddscp1.." покинул пост ДСЦП(1)."
			cur_ddscp1 = "отсутствует"
			ULib.tsayColor(nil,false,Color(255, 0, 0), "Внимание, машинисты: ",Color(0, 148, 255),msg)
		else
			if (ply:IsAdmin()) then
				hook.Run("DispInfoFreedPost",cur_ddscp1)
				local msg = ply:Nick().." снял игрока "..cur_ddscp1.." с поста ДСЦП(1)."
				cur_ddscp1 = "отсутствует"
				ULib.tsayColor(nil,false,Color(255, 0, 0), "Внимание, машинисты: ",Color(0, 148, 255),msg)
			else
				ply:PrintMessage(HUD_PRINTTALK,"Вы не можете покинуть пост, поскольку вы не на посту! Сейчас ДСЦП(1) "..cur_ddscp1..".")
			end
		end
		SendToClients()
	else
		ply:PrintMessage(HUD_PRINTTALK,"ДСЦП(1) на посту отсутствует!")
	end
end

-- фунции ДСЦП(2)
function MDispatcher.Dscp2(ply)
	cur_ddscp2 = ply:Nick()
	local msg = "игрок "..cur_ddscp2.." заступил на пост ДСЦП(2)."
	ULib.tsayColor(nil,false,Color(255, 0, 0), "Внимание, машинисты: ",Color(0, 148, 255),msg)
	SendToClients()
	hook.Run("DispInfoTookPost",cur_ddscp2)
end

function MDispatcher.SetDscp2(ply,target)
	cur_ddscp2 = target:Nick()
	local msg = "игрок "..cur_ddscp2.." заступил на пост ДСЦП(2)."
	ULib.tsayColor(nil,false,Color(255, 0, 0), "Внимание, машинисты: ",Color(0, 148, 255),msg)
	SendToClients()
	hook.Run("DispInfoTookPost",cur_ddscp2)
end

function MDispatcher.UnDscp2(ply)
	if cur_ddscp2 != "отсутствует" then
		if cur_ddscp2 == ply:Nick() then
			hook.Run("DispInfoFreedPost",cur_ddscp2)
			local msg = "игрок "..cur_ddscp2.." покинул пост ДСЦП(2)."
			cur_ddscp2 = "отсутствует"
			ULib.tsayColor(nil,false,Color(255, 0, 0), "Внимание, машинисты: ",Color(0, 148, 255),msg)
		else
			if (ply:IsAdmin()) then
				hook.Run("DispInfoFreedPost",cur_ddscp2)
				local msg = ply:Nick().." снял игрока "..cur_ddscp2.." с поста ДСЦП(2)."
				cur_ddscp2 = "отсутствует"
				ULib.tsayColor(nil,false,Color(255, 0, 0), "Внимание, машинисты: ",Color(0, 148, 255),msg)
			else
				ply:PrintMessage(HUD_PRINTTALK,"Вы не можете покинуть пост, поскольку вы не на посту! Сейчас ДСЦП(2) "..cur_ddscp2..".")
			end
		end
		SendToClients()
	else
		ply:PrintMessage(HUD_PRINTTALK,"ДСЦП(2) на посту отсутствует!")
	end
end

-- Настройка интервала
function MDispatcher.SetInt(ply,mins)
	if cur_dis == ply:Nick() then
		cur_int = string.Replace(mins,":",".")
		str_int = "Интервал движения"
		local msg = "Диспетчер "..cur_dis.." установил интервал движения "..cur_int
		ULib.tsayColor(nil,false,Color(255, 0, 0), "Внимание, машинисты: ",Color(0, 148, 255),msg)
		SendToClients()
		hook.Run("DispInfoSetInt",cur_dis,cur_int)
	else
		ply:PrintMessage(HUD_PRINTTALK,"Вы не можете изменить интервал, поскольку вы не на посту! Сейчас диспетчер "..cur_dis..".")
	end
end

hook.Add("PlayerDisconnected","PlyDisconnect",function(ply) -- снимаем с поста при отключении
	if cur_dis == ply:Nick() then
		hook.Run("DispInfoFreedPost",cur_dis)
		cur_dis = "отсутствует"
		str_int = "Мин. интервал"
		cur_int = "1.45"
		SendToClients()
		local msg = "игрок "..ply:Nick().." покинул пост Диспетчера (отключился с сервера)."
		ULib.tsayColor(nil,false,Color(255, 0, 0), "Внимание, машинисты: ",Color(0, 148, 255),msg)
	end
end)
