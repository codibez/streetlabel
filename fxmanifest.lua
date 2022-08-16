-- Script Description
fx_version 'cerulean'
games { 'gta5' }

author 'lowheartrate'
description 'Street Label by lowheartrate'
version '1.2.0'

-- Client Scripts
client_scripts {
	'configuration.lua',
	'client.lua'
}

ui_page('html/index.html')

files({
	'html/index.html',
	'html/css/styles.css',
	'html/css/font-face.css',
	'html/fonts/*',
	'html/listener.js',
})