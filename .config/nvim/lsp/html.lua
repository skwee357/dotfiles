return {
    filetypes = { "html", "gohtmltmpl", "htmldjango", "jinja", "html.handlebars", "mjml.handlebars", "eruby" },
    init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
            css = true,
            javascript = true
        },
        provideFormatter = false,
        single_file_support = true
    }
}
