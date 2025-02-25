LOVELY_INTEGRITY = 'a0a6222d417538f9ac51e6de9e5324e3e68a85bbdc35ead9c5c98bc11cb475e4'

require "love.system" 

if (love.system.getOS() == 'OS X' ) and (jit.arch == 'arm64' or jit.arch == 'arm') then jit.off() end

require "love.timer"
require "love.thread"
require 'love.filesystem'
require "engine/object"
require "engine/string_packer"

--vars needed for sound manager thread
CHANNEL = love.thread.getChannel("save_request")
function tal_compress_and_save(_file, _data, talisman)
  local save_string = type(_data) == 'table' and STR_PACK(_data) or _data
  local fallback_save = STR_PACK({GAME = {won = true}}) --just bare minimum to not crash, maybe eventually display some info?
  if talisman == 'bignumber' then
    fallback_save = "if not BigMeta then " .. fallback_save
  elseif talisman == 'omeganum' then
    fallback_save = "if not OmegaMeta then " .. fallback_save
  else
    fallback_save = "if BigMeta or OmegaMeta then " .. fallback_save
  end
  fallback_save = fallback_save .. " end"
  save_string = fallback_save .. " " .. save_string
  save_string = love.data.compress('string', 'deflate', save_string, 1)
  love.filesystem.write(_file,save_string)
end

 while true do
    --Monitor the channel for any new requests
    local request = CHANNEL:demand() -- Value from channel
    if request then
    if request.type == 'kill' then return end
        --Saves progress for settings, unlocks, alerts and discoveries
        if request.type == 'save_progress' then
            local prefix_profile = (request.save_progress.SETTINGS.profile or 1)..''
            if not love.filesystem.getInfo(prefix_profile) then love.filesystem.createDirectory( prefix_profile ) end
            prefix_profile = prefix_profile..'/'

            if not love.filesystem.getInfo(prefix_profile..'meta.jkr') then
                love.filesystem.append( prefix_profile..'meta.jkr', 'return {}' )
            end

            local meta = STR_UNPACK(get_compressed(prefix_profile..'meta.jkr') or 'return {}')
            meta.unlocked = meta.unlocked or {}
            meta.discovered = meta.discovered or {}
            meta.alerted = meta.alerted or {}

            local _append = false

            for k, v in pairs(request.save_progress.UDA) do
                if string.find(v, 'u') and not meta.unlocked[k] then 
                    meta.unlocked[k] = true
                    _append = true
                end
                if string.find(v, 'd') and not meta.discovered[k] then 
                    meta.discovered[k] = true
                    _append = true
                end
                if string.find(v, 'a') and not meta.alerted[k] then 
                    meta.alerted[k] = true
                    _append = true
                end
            end
            if _append then compress_and_save( prefix_profile..'meta.jkr', STR_PACK(meta)) end

            compress_and_save('settings.jkr', request.save_progress.SETTINGS)
            compress_and_save(prefix_profile..'profile.jkr', request.save_progress.PROFILE)

            CHANNEL:push('done')
        --Saves the settings file
        elseif request.type == 'save_settings' then 
            compress_and_save('settings.jkr', request.save_settings)
            compress_and_save(request.profile_num..'/profile.jkr', request.save_profile)
            --Saves the metrics file
        elseif request.type == 'save_metrics' then 
            compress_and_save('metrics.jkr', request.save_metrics)
        --Saves any notifications
        elseif request.type == 'save_notify' then 
            local prefix_profile = (request.profile_num or 1)..''
            if not love.filesystem.getInfo(prefix_profile) then love.filesystem.createDirectory( prefix_profile ) end
            prefix_profile = prefix_profile..'/'

            if not love.filesystem.getInfo(prefix_profile..'unlock_notify.jkr') then love.filesystem.append( prefix_profile..'unlock_notify.jkr', '') end
            local unlock_notify = get_compressed(prefix_profile..'unlock_notify.jkr') or ''

            if request.save_notify and not string.find(unlock_notify, request.save_notify) then 
                compress_and_save( prefix_profile..'unlock_notify.jkr', unlock_notify..request.save_notify..'\n')
            end

        --Saves the run
        elseif request.type == 'save_run' then 
            local prefix_profile = (request.profile_num or 1)..''
            if not love.filesystem.getInfo(prefix_profile) then love.filesystem.createDirectory( prefix_profile ) end
            prefix_profile = prefix_profile..'/'

            tal_compress_and_save(prefix_profile..'save.jkr', request.save_table, request.talisman)
        end
    end
end
