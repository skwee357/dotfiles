return {
    filetypes = {
        "html", "html.handlebars", "css", "erb", "eruby", "astro"
    },
    settings = {
        tailwindCSS = {
            classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
            includeLanguages = {
                eruby = "erb",
                ["html.handlebars"] = "html",
                handlebars = "html",
                htmlhandlebars = "html"
            },
            lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidConfigPath = "error",
                invalidScreen = "error",
                invalidTailwindDirective = "error",
                invalidVariant = "error",
                recommendedVariantOrder = "warning"
            },
            validate = true
        }
    }
}
