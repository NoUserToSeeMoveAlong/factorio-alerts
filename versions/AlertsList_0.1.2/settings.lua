data:extend({
    {
        type = "string-setting",
        name = "alerts-list-display-mode",
        setting_type = "runtime-per-user",
        default_value = "alerts-list-display-mode-icon-only",
        allowed_values = {
            "alerts-list-display-mode-icon-only",                   -- show only icon
            "alerts-list-display-mode-icon-and-text",               -- show both icon and notification text
            -- TODO: nice idea to implement LATER ON
            -- "alerts-list-display-mode-condition-and-text"            -- show both text and circuit condition that triggered it with both values
        },
        order = "aa"
    },
    {
        type = "bool-setting",
        name = "alerts-list-show-percentage",
        setting_type = "runtime-per-user",
        default_value = false,
        order = "ad"
    }
})