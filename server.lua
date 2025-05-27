lib.addCommand('getjob', {
    help = 'Show player count for a job and its grades',
    params = {
        {
            name = 'job',
            type = 'string',
            help = 'Job name',
        },
    },
    restricted = 'group.mod'
}, function(source, args, raw)
    local jobName = args.job
    if not jobName then return end

    local players = GetPlayers()
    local totalCount = 0
    local gradeCounts = {}

    for _, playerId in ipairs(players) do
        local ply = exports.qbx_core:GetPlayer(tonumber(playerId))
        if ply and ply.PlayerData and ply.PlayerData.job then
            local pJob = ply.PlayerData.job.name
            if pJob == jobName then
                totalCount = totalCount + 1
                local gradeName = ply.PlayerData.job.grade.name or "unknown"
                gradeCounts[gradeName] = (gradeCounts[gradeName] or 0) + 1
            end
        end
    end

    if totalCount == 0 then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Job Info',
            description = "No players found with job: " .. jobName,
            type = 'inform',
            duration = 4000
        })
        return
    end

    local gradesStr = ""
    for gradeName, count in pairs(gradeCounts) do
        gradesStr = gradesStr .. string.format("%s: %d\n", gradeName, count)
    end

    TriggerClientEvent('ox_lib:notify', source, {
        title = 'Job Player Counts',
        description = string.format(
            "Job: %s\nTotal Players: %d\n\nPlayers per Grade:\n%s",
            jobName,
            totalCount,
            gradesStr
        ),
        type = 'inform',
        duration = 7000
    })
end)

lib.addCommand('getradio', {
    help = 'Display a players radio channel',
    params = {
        {
            name = 'target',
            type = 'playerId',
            help = 'Player ID',
        },
    },
    restricted = 'group.mod'
}, function(source, args, raw)
    local target = args.target
 
    if target then
        local radioChannel = lib.callback.await('mm_radio:client:getChannel', target)
        print(json.encode(radioChannel, { indent = true }))
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Radio Channel',
            description = ('Id %d is on radio channel: %s'):format(target, radioChannel),
            type = 'inform',
            duration = 5000
        })
    end
end)






