
-- ~/.config/nvim/lua/custom_funcs.lua

-- Pasting empty Rmd chunk
function PasteRCode()
    vim.api.nvim_feedkeys("i```{r,eval=TRUE,include=TRUE,echo=TRUE,message=TRUE,warning=TRUE}\n# Empty  code chunk\n```\nk", "n", true)
end

-- Pasting empty Rmd chunk for figures
function PasteRFigureChunk()
    vim.api.nvim_feedkeys("i```{r PlotName ,eval=TRUE,include=TRUE,echo=FALSE,message=FALSE,out.width='auto', out.height='auto',fig.cap=\"\"}\n# Empty figure chunk\n```\nk", "n", true)
end

-- Pasting empty Rmd chunk for tables
function PasteRKableTableChunk()
    vim.api.nvim_feedkeys("i```{r,eval=TRUE,include=TRUE,echo=FALSE,message=FALSE}\n# %>% kbl(caption=\"\") %>%kable_classic(\"striped\",full_width=F)\n```\nk", "n", true)
end

-- Lorem Ipsum text
function LoremIpsum()
    vim.api.nvim_feedkeys("iLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n", "n", true)
end

-- Insert Bootstrap link
function BootstrapLink()
    vim.api.nvim_feedkeys("i<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN\" crossorigin=\"anonymous\">\n", "n", true)
end

---------------
-- Pasting empty Rmd chunk
function PasteRCode()
    vim.api.nvim_feedkeys("i```{r,eval=TRUE,include=TRUE,echo=TRUE,message=TRUE,warning=TRUE}\n# Empty  code chunk\n```\nk", "n", true)
end

-- Pasting empty Rmd chunk for figures
function PasteRFigureChunk()
    vim.api.nvim_feedkeys("i```{r PlotName ,eval=TRUE,include=TRUE,echo=FALSE,message=FALSE,out.width='auto', out.height='auto',fig.cap=\"\"}\n# Empty figure chunk\n```\nk", "n", true)
end

-- Pasting empty Rmd chunk for tables
function PasteRKableTableChunk()
    vim.api.nvim_feedkeys("i```{r,eval=TRUE,include=TRUE,echo=FALSE,message=FALSE}\n# %>% kbl(caption=\"\") %>%kable_classic(\"striped\",full_width=F)\n```\nk", "n", true)
end

-- CUSTOM HTML/CSS FUNCTIONS

-- Lorem Ipsum text
function LoremIpsum()
    vim.api.nvim_feedkeys("iLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n", "n", true)
end

-- Insert Bootstrap link
function BootstrapLink()
    vim.api.nvim_feedkeys("i<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN\" crossorigin=\"anonymous\">\n", "n", true)
end


function OpenLuaConfig(letter)
    local config_dir = vim.fn.expand('~/.config/nvim')
    local lua_folder = config_dir .. '/lua'
    local filename

    -- Use a conditional statement to determine the filename based on the letter
    if letter == 'p' then
        filename = 'plugins.lua'
    elseif letter == 'k' then
        filename = 'keymappings.lua'
    elseif letter == 'c' then
        filename = 'custom_funcs.lua'
    elseif letter == 'i' then
        filename = 'init.lua'
    else
        -- Handle an unknown letter or provide a default filename
        filename = 'default.lua'
    end

    local full_path = lua_folder .. '/' .. filename
    vim.cmd('edit ' .. full_path)
end


function HTML5template()
    local html_template = [[
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
</head>
<body>
  <header>
    <h1>Title</h1>
  </header>
  <main>
    <p>Content goes here</p>
  </main>
  <footer>
    <p>Footer</p>
  </footer>
</body>
</html>
    ]]

    local saved_register = vim.fn.getreg('"')
    vim.fn.setreg('"', html_template, 'c')
    vim.cmd('normal! "+p')
    vim.fn.setreg('"', saved_register, 'c')
end




return {
    HTML5template = HTML5template,
    PasteRCode = PasteRCode,
    PasteRFigureChunk = PasteRFigureChunk,
    PasteRKableTableChunk = PasteRKableTableChunk,
    LoremIpsum = LoremIpsum,
    BootstrapLink = BootstrapLink,
    OpenLuaConfig = OpenLuaConfig,
}


