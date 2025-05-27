fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Wolfijzs'
description 'Admin tools: /getjob and /getradio commands Display a players job and radio channel'
version '1.0.0'


shared_scripts {
    '@ox_lib/init.lua',
}


dependency 'mm_radio'


server_scripts {
    'server.lua' 
}


