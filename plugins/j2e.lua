
local _M = {}

function _M.convert()
    cjson = require("cjson")

    local jwt = ngx.var.cookie_jwt;
    ngx.log(ngx.NOTICE, "JWT: ", jwt);

    local res = ngx.location.capture(
        "/authx-profiles/me/ehid",
        {
            method = ngx.HTTP_GET
        }
    );

    if not res then
        ngx.log(ngx.ERR, "request failed: ", res.err);
        return;
    end
    local obj = cjson.decode(res.body);
    return obj['data']
end

return _M
