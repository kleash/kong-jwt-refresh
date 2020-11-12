package = "jwtrefresh"
version = "0.0-2"

local pluginName = "jwtrefresh"

source = {
  url = "https://github.com/kleash/kong-jwt-refresh.git"
}
description = {
  summary = "A Kong plugin, that extract roles from a JWT token and make a request for a Policy Decision Point (PDP)",
  license = "GPL"
}
dependencies = {
  "lua ~> 5.1",
  "json4lua ~> 0.9.30-1"
}
build = {
  type = "builtin",
  modules = {
  
    ["kong.plugins."..pluginName..".migrations"] = "kong/plugins/"..pluginName.."/migrations/init.lua",
    ["kong.plugins."..pluginName..".migrations.000_base_jwt"] = "kong/plugins/"..pluginName.."/migrations/000_base_jwt.lua",
    ["kong.plugins."..pluginName..".migrations.002_130_to_140"] = "kong/plugins/"..pluginName.."/migrations/002_130_to_140.lua",
    ["kong.plugins."..pluginName..".migrations.003_200_to_210"] = "kong/plugins/"..pluginName.."/migrations/003_200_to_210.lua",
    
    ["kong.plugins."..pluginName..".asn_sequence"] = "kong/plugins/"..pluginName.."/asn_sequence.lua",
    ["kong.plugins."..pluginName..".handler"] = "kong/plugins/"..pluginName.."/handler.lua",
    ["kong.plugins."..pluginName..".schema"] = "kong/plugins/"..pluginName.."/schema.lua",
    ["kong.plugins."..pluginName..".daos"] = "kong/plugins/"..pluginName.."/daos.lua",
    ["kong.plugins."..pluginName..".jwt_parser"] = "kong/plugins/"..pluginName.."/jwt_parser.lua",
    ["kong.plugins."..pluginName..".refresh"] = "kong/plugins/"..pluginName.."/refresh.lua"
  }
}
