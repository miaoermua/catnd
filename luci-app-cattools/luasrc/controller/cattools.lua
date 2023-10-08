module('luci.controller.cattools', package.seeall)

-- 定义配置模块
mp = Map("example", "Example Plugin")

-- 添加配置选项  
s = mp:section(TypedSection, "example", "Example Config")
s.addremove = false
s.anonymous = true

o = s:option(Flag, "enabled", "Enable plugin")
o.default = 0

-- 定义处理函数
function example_handler()
  -- 执行相关逻辑
end

-- 注册菜单项
entry({"admin", "diagnostics", "example"}, firstchild(), "Example", 40).dependent = false  
entry({"admin", "diagnostics", "example", "run"}, call("example_handler")).leaf = true

return mp