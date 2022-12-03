return {
  on_setup = function(server)
    server:setup({
      capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      flags = {
        debounce_text_changes = 150,
      },
      on_attach = function(client, bufnr)
        -- 禁用格式化功能，交给专门插件插件处理 null-ls 已经加载了格式化的服务 所以等于false
        -- 如果没有null-ls这个  下面两行可以不用写了
        --[[ client.resolved_capabilities.document_formatting = false
                client.resolved_capabilities.document_range_formatting = false ]]

        local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        -- 绑定快捷键
        require('keybindings').mapLSP(buf_set_keymap)

        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
      end,
    })
  end,
}
