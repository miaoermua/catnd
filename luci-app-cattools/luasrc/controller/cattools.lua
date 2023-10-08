
module('luci.controller.cattools', package.seeall)

function run_catnd()
    local output = luci.sys.exec(config.run)
    luci.template.render("diag/output", {output=output})
  end

function run_catnd()
    entry({"admin", "diag", "catnd"}, call("run_catnd")).leaf=true
  end

function reboot()
    entry({"admin", "system", "reboot"}, template("admin_system/reboot"), _("Reboot"), 90)
    entry({"admin", "system", "reboot", "call"}, post("action_reboot"))
  end

function action_reboot()
luci.sys.reboot()
end