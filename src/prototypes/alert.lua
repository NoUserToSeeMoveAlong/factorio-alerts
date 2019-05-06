-- create alert object

-- add item, recipe and entity
data:extend(
{
    {
        type = "item",
        name = "alert-siren",
        icon = "__base__/graphics/icons/programmable-speaker.png",
        icon_size = 32,
        subgroup = "circuit-network",
        order = "d[other]-b[alert-siren]",
        place_result = "alert-siren",
        stack_size = 50
    },
    {
        type = "recipe",
        name = "alert-siren",
        enabled = false,
        energy_required = 2,
        ingredients = 
        {
            {"programmable-speaker", 1},
            {"electronic-circuit", 1}
        },
        result = "alert-siren"
    },
    {
        type = "programmable-speaker",
        name = "alert-siren",
        icon = "__base__/graphics/icons/programmable-speaker.png",
        icon_size = 32,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 0.1, result = "alert-siren"},
        max_health = 150,
        corpse = "small-remnants",
        collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        drawing_box = {{-0.5, -2.5}, {0.5, 0.3}},
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        energy_source =
        {
          type = "electric",
          usage_priority = "secondary-input"
        },
        energy_usage_per_tick = "2KW",
        maximum_polyphony=0,
    
        sprite =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/programmable-speaker/programmable-speaker.png",
              priority = "extra-high",
              width = 30,
              height = 89,
              shift = util.by_pixel(-2, -39.5),
              hr_version =
              {
                filename = "__base__/graphics/entity/programmable-speaker/hr-programmable-speaker.png",
                priority = "extra-high",
                width = 59,
                height = 178,
                shift = util.by_pixel(-2.25, -39.5),
                scale = 0.5
              }
            },
            {
              filename = "__base__/graphics/entity/programmable-speaker/programmable-speaker-shadow.png",
              priority = "extra-high",
              width = 119,
              height = 25,
              shift = util.by_pixel(52.5, -2.5),
              draw_as_shadow = true,
              hr_version =
              {
                filename = "__base__/graphics/entity/programmable-speaker/hr-programmable-speaker-shadow.png",
                priority = "extra-high",
                width = 237,
                height = 50,
                shift = util.by_pixel(52.75, -3),
                draw_as_shadow = true,
                scale = 0.5
              }
            }
          }
        },

        instruments =
        {
            {
                name = "alarms",
                notes = 
                {
                    { name="siren",  sound = { filename = "__base__/sound/programmable-speaker/siren.ogg", preload = false }}
                }
            }
        },
        circuit_wire_connection_point = circuit_connector_definitions["programmable-speaker"].points,
        circuit_connector_sprites = circuit_connector_definitions["programmable-speaker"].sprites,
        circuit_wire_max_distance = default_circuit_wire_max_distance
    }
}
)

-- attach recipe to circuit-network technology
table.insert(data.raw["technology"]["circuit-network"].effects, {type = "unlock-recipe", recipe="alert-siren"})