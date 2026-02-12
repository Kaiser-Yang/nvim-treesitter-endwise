config({
  extension: "lua",
  command: "ExecuteSpace",
  overrides: <<~INIT_LUA
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
require('nvim-treesitter-endwise').setup({
    space_endwise = true,
})
INIT_LUA
})

test "lua space, if stmt", <<~END
-if true then█
+if true then  end
END

test "lua space, while loop", <<~END
-while true do█
+while true do  end
END

test "lua space, for loop generic clause", <<~END
-for var=exp1,exp2,exp3 do█
+for var=exp1,exp2,exp3 do  end
END

test "lua space, do block", <<~END
-do█
+do  end
END

test "lua space, global function", <<~END
-function foo()█
+function foo()  end
END

test "lua space, local function", <<~END
-local function foo()█
+local function foo()  end
END

test "lua space, var function", <<~END
-local foo = function()█
+local foo = function()  end
END

test "lua space, table value function", <<~END
-function M.foo()█
+function M.foo()  end
END

test "lua space, nested if stmt", <<~END
-function foobarbaz()
-  if foo then█
-end
+function foobarbaz()
+  if foo then  end
+end
END
