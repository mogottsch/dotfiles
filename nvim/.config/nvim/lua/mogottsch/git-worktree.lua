local Worktree = require("git-worktree")

-- local function is_uep(path)
--     -- test if path contains 'platform'
--     print(path:match("platform"))
--     return path:match("platform")
-- end

-- metadata = table of useful values (structure dependent on op)
-- op = Operations.Switch, Operations.Create, Operations.Delete
--      Switch
--          path = path you switched to
--          prev_path = previous worktree path
--      Create
--          path = path where worktree created
--          branch = branch name
--          upstream = upstream remote name
--      Delete
--          path = path where worktree deleted

-- Worktree.on_tree_change(function(op, metadata)
--     if op == Worktree.Operations.Switch then is_uep(metadata.path) end
-- end)
