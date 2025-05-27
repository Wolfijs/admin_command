# Admin command
Command to check players radiochannel and to see how many players are per each job and grade 

#Dependencies 
Ox-lib
Qbx-core
mm_radio



## Put this in  mm_radio/client/funcion.lua
lib.callback.register('mm_radio:client:getChannel', function()
    return Radio.RadioChannel
end)
