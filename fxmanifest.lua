-- Script Description
fx_version 'cerulean'
games { 'gta5' }

author 'lowheartrate'
description 'Street Label by lowheartrate'
version '1.1.3'

-- Client Scripts
client_scripts {
	'configuration.lua',
	'client.lua'
}

ui_page('html/index.html')

files({
	'html/index.html',
	'html/styles.css',
  'html/font-face.css',
	'html/listener.js',
})