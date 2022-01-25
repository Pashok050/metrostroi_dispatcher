local CATEGORY_NAME = "Metrostroi Dispatcher" 

-- ULX функция для ДЦХ
function ulx.disp(calling_ply)
	MDispatcher.Disp(calling_ply)
end
local disp = ulx.command(CATEGORY_NAME,"ulx disp",ulx.disp,"!disp")
disp:defaultAccess(ULib.ACCESS_SUPERADMIN)
disp:help("Занять пост ДЦХ.")

-- ULX функция Блок Пост Депо
function ulx.bpd(calling_ply)
	MDispatcher.Bpd(calling_ply)
end
local bpd = ulx.command(CATEGORY_NAME,"ulx bpd",ulx.bpd,"!bpd")
bpd:defaultAccess(ULib.ACCESS_SUPERADMIN)
bpd:help("Занять пост Блок Пост Депо.")

-- ULX функция ДСЦП(1)
function ulx.dscp1(calling_ply)
	MDispatcher.Dscp1(calling_ply)
end
local dscp1 = ulx.command(CATEGORY_NAME,"ulx dscp1",ulx.dscp1,"!dscp1")
dscp1:defaultAccess(ULib.ACCESS_SUPERADMIN)
dscp1:help("Занять пост ДСЦП(1).")

-- ULX функция ДСЦП(2)
function ulx.dscp2(calling_ply)
	MDispatcher.Dscp2(calling_ply)
end
local dscp2 = ulx.command(CATEGORY_NAME,"ulx dscp2",ulx.dscp2,"!dscp2")
dscp2:defaultAccess(ULib.ACCESS_SUPERADMIN)
dscp2:help("Занять пост ДСЦП(2).")

-- ULX функция ДЦХ
function ulx.setdisp(calling_ply,target_ply)
	MDispatcher.SetDisp(calling_ply,target_ply)
end
local setdisp = ulx.command(CATEGORY_NAME,"ulx setdisp",ulx.setdisp,"!setdisp")
setdisp:addParam{type=ULib.cmds.PlayerArg}
setdisp:defaultAccess(ULib.ACCESS_SUPERADMIN)
setdisp:help("Назначить на пост ДЦХ.")

-- ULX функция Блок Пост Депо
function ulx.setbpd(calling_ply,target_ply)
	MDispatcher.SetBpd(calling_ply,target_ply)
end
local setbpd = ulx.command(CATEGORY_NAME,"ulx setbpd",ulx.setbpd,"!setbpd")
setbpd:addParam{type=ULib.cmds.PlayerArg}
setbpd:defaultAccess(ULib.ACCESS_SUPERADMIN)
setbpd:help("Назначить на пост Блок Пост Депо.")

-- ULX функция ДСЦП(1)
function ulx.setdscp1(calling_ply,target_ply)
	MDispatcher.SetDscp1(calling_ply,target_ply)
end
local setdscp1 = ulx.command(CATEGORY_NAME,"ulx setdscp1",ulx.setdscp1,"!setdscp1")
setdscp1:addParam{type=ULib.cmds.PlayerArg}
setdscp1:defaultAccess(ULib.ACCESS_SUPERADMIN)
setdscp1:help("Назначить на пост ДСЦП(1).")

-- ULX функция ДСЦП(2)
function ulx.setdscp2(calling_ply,target_ply)
	MDispatcher.SetDscp2(calling_ply,target_ply)
end
local setdscp2 = ulx.command(CATEGORY_NAME,"ulx setdscp2",ulx.setdscp2,"!setdscp2")
setdscp2:addParam{type=ULib.cmds.PlayerArg}
setdscp2:defaultAccess(ULib.ACCESS_SUPERADMIN)
setdscp2:help("Назначить на пост ДСЦП(2).")

-- ULX функция для ухода ДЦХ с поста
function ulx.undisp(calling_ply)
	MDispatcher.UnDisp(calling_ply)
end
local undisp = ulx.command(CATEGORY_NAME,"ulx undisp",ulx.undisp,"!undisp")
undisp:defaultAccess(ULib.ACCESS_SUPERADMIN)
undisp:help("Освободить пост ДЦХ.")

-- ULX функция для ухода Блок Пост Депо с поста
function ulx.unbpd(calling_ply)
	MDispatcher.UnBpd(calling_ply)
end
local unbpd = ulx.command(CATEGORY_NAME,"ulx undbpd",ulx.unbpd,"!unbpd")
unbpd:defaultAccess(ULib.ACCESS_SUPERADMIN)
unbpd:help("Освободить пост Блок Пост Депо.")

-- ULX функция для ухода ДСЦП(1)
function ulx.undscp1(calling_ply)
	MDispatcher.UnDscp1(calling_ply)
end
local undscp1 = ulx.command(CATEGORY_NAME,"ulx undscp1",ulx.undscp1,"!undscp1")
undscp1:defaultAccess(ULib.ACCESS_SUPERADMIN)
undscp1:help("Освободить пост ДСЦП(1).")

-- ULX функция для ухода ДСЦП(2)
function ulx.undscp2(calling_ply)
	MDispatcher.UnDscp2(calling_ply)
end
local undscp2 = ulx.command(CATEGORY_NAME,"ulx undscp2",ulx.undscp2,"!undscp2")
undscp2:defaultAccess(ULib.ACCESS_SUPERADMIN)
undscp2:help("Освободить пост ДСЦП(2).")

-- ULX функция для изменения интервала
function ulx.setint(calling_ply,interval)
	MDispatcher.SetInt(calling_ply,interval)
end
local setint = ulx.command(CATEGORY_NAME,"ulx setint",ulx.setint,"!int")
setint:addParam{type=ULib.cmds.StringArg,hint="2.30",ULib.cmds.optional}
setint:defaultAccess(ULib.ACCESS_SUPERADMIN)
setint:help("Установить интервал движения. Формат - мин.сек")
