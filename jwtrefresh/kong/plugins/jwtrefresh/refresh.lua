--
-- Created by IntelliJ IDEA.
-- User: shubham
-- Date: 12/11/20
-- Time: 11.34
-- To change this template use File | Settings | File Templates.
--

local http = require "socket.http"
local kong = kong
local pairs = pairs

local get_headers = ngx.req.get_headers
local get_method = ngx.req.get_method

local _M = {}
_M.__index = _M

function _M.refreshtoken(conf)
    kong.log("refreshing token")
    if conf.refreshurl == nil then
        return
    end
    if get_method() == "OPTIONS" then
        return
    end
    local header = get_headers()

    local body, code, headers, status = http.request { url = conf.refreshurl, headers = header, method = "GET" }
    for k, v in pairs(headers) do kong.log(k, v) end
    kong.log(body, code, headers, status)
    if code > 299 then
        return
    end
    local tokencookie = headers["set-cookie"]
    if tokencookie == nil then
        return
    end
    kong.response.set_header("Set-Cookie", tokencookie)
end

return _M
