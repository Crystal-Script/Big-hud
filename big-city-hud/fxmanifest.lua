shared_script '@es_extended/imports.lua'

fx_version 'adamant'
game 'gta5'

lua54 'yes'

client_script {
    'client/client.lua',
    'client/veicle.lua',
    'config.lua',
}

server_script {
    'server/server.lua'
}

dependencies {
    'es_extended',
    'esx_status'
}

ui_page 'NUI/index.html'

files {
    'NUI/sound/buckle.ogg',
    'NUI/sound/unbuckle.ogg',
    'NUI/index.js',
    'NUI/index.html',
    'NUI/index.css',
    'NUI/images/1.png',
    'NUI/images/2.png',
    'NUI/images/3.png',
    'NUI/images/4.png',
    'NUI/images/5.png',
    'NUI/images/logo.png'
}