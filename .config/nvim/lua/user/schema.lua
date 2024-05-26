--[[
This script configures Neovim to use Telescope for selecting JSON schemas
for the YAML language server. It defines functions to list JSON files from
specified directories, combines these lists, and then uses Telescope to
allow the user to select a schema. The selected schema is then configured
in the YAML language server settings.
]]

local M = {
  base_dir = "/Users/a.kloster/git/domus",
}

M.local_repo_path = M.base_dir .. "/CRDs-catalog"
M.additional_repo_path = M.base_dir .. "/kubernetes-json-schema/v1.30.1"

-- Function to list all JSON files in a given directory
M.list_local_files = function(base_path)
  -- Execute the find command to list all JSON files
  local handle = io.popen('find "' .. base_path .. '" -type f -name "*.json"')
  if handle == nil then
    return {}
  end
  local result = handle:read("*a")
  handle:close()

  if result == nil then
    return {}
  end

  -- Collect all files into a table
  local files = {}
  for file in result:gmatch("[^\r\n]+") do
    table.insert(files, file)
  end
  return files
end

-- Initialization function
M.init = function()
  -- List all CRDs from the local repository
  local all_crds = M.list_local_files(M.local_repo_path)
  -- List additional CRDs from another repository
  local additional_crds = M.list_local_files(M.additional_repo_path)

  -- Combine both lists
  for _, file in ipairs(additional_crds) do
    table.insert(all_crds, file)
  end

  -- Convert file paths to relative paths for display
  local relative_crds = {}
  for _, file in ipairs(all_crds) do
    local relative_path = file:gsub(M.base_dir .. "/", "")
    table.insert(relative_crds, relative_path)
  end

  -- Use Telescope to select a schema
  require("telescope.builtin").find_files({
    prompt_title = "Select schema",
    results_title = "Schemas",
    finder = require("telescope.finders").new_table({
      results = relative_crds,
    }),
    sorter = require("telescope.config").values.generic_sorter({}),
    previewer = false, -- Disable preview
    attach_mappings = function(prompt_bufnr)
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry().value

        -- Set the selected schema path
        local schema_path = M.base_dir .. "/" .. selection

        -- Update the YAML language server settings
        local clients = vim.lsp.get_clients() -- Updated method
        for _, client in ipairs(clients) do
          if client.name == "yamlls" then
            client.config.settings.yaml.schemas = {
              ["file://" .. schema_path] = "*.yaml",
            }
            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
          end
        end

        -- Notify the user about the selected schema
        vim.notify("Schema set to: " .. schema_path)
      end)
      return true
    end,
  })
end

return M
