local fs = require 'bee.filesystem'
local registry = require 'bee.registry'
local ydwe = require 'tools.ydwe'
local subprocess = require 'bee.subprocess'
if not ydwe then
    return
end

local function get_debugger()
    local path = fs.path(os.getenv('USERPROFILE')) / '.vscode' / 'extensions'
    for extpath in path:list_directory() do
        if fs.is_directory(extpath) and extpath:filename():string():sub(1, 20) == 'actboy168.lua-debug-' then
            local dbgpath = extpath / 'windows' / 'x86' / 'debugger.dll'
            if fs.exists(dbgpath) then
                return dbgpath
            end
        end
    end
end

local root = fs.path(arg[1])
map_name = "crazy_monster.w3x"
if not fs.exists(root / map_name) then
    print('地图不存在', root / map_name)
    return
end
if get_debugger() then
    --command = command .. ' -debugger 4278'
end
subprocess.spawn {
    ydwe / 'ydwe.exe',
    '-war3',
    '-loadfile', root / map_name,
}
