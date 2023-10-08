--[[
Author: 喵二
Date: 2023-10-08 18:01:06
LastEditors: 喵二
LastEditTime: 2023-10-08 18:01:30
FilePath: \catnd\luci-app-cattools\root\catnd.lua
--]]
function run_catnd()
    local output = luci.sys.exec(config.run)
    luci.template.render("diag/output", {output=output})
  end
  
  entry({"admin", "diag", "catnd"}, call("run_catnd")).leaf=true