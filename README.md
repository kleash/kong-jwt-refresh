# KONG JWT Plugin (Official Extended)

This repo contains extended version of official JWT plugin with extra functionality of adding JWT plugin.

## Installation
 - Go to plugins directory jwtrefresh and do `luarocks make`
 - Enable plugin in kong by adding `plugins = bundled, jwtrefresh` in kong.conf
 
## Configuration

Two extra parameters required to enable auto refresh:
 - refreshurl : Refresh URL of server, should be GET request
 - refresh_timeremaining_second : JWT expiry remaining to auto refresh JWT Token
 
I have also included sample declarative config in kong.yml
