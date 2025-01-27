---@type LazySpec
return {
  "yetone/avante.nvim",
  opts = {
    provider = "llamacpp",
    vendors = {
      llamacpp = {
        __inherited_from = "openai",
        api_key_name = "",
        -- OpenAI API compatible endpoint
        endpoint = "http://127.0.0.1:8012/v1",
        -- Specify the model. Not necessary for llama-server.
        -- See https://github.com/ggml-org/llama.vim for an example server.
        model = "",
      }
    }
  },
}
