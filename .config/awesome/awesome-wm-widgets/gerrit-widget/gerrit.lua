-------------------------------------------------
-- Gerrit Widget for Awesome Window Manager
-- Shows the number of currently assigned reviews
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/gerrit-widget

-- @author Pavel Makhov
-- @copyright 2019 Pavel Makhov
-------------------------------------------------

local awful = require("awful")
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local json = require("json")
local spawn = require("awful.spawn")
local naughty = require("naughty")
local gears = require("gears")
local beautiful = require("beautiful")

local HOME_DIR = os.getenv("HOME")

local GET_CHANGES_CMD = [[bash -c "curl -s -X GET -n https://%s/a/changes/\\?q\\=%s | tail -n +2"]]
local GET_USER_CMD = [[bash -c "curl -s -X GET -n https://%s/accounts/%s/ | tail -n +2"]]
local DOWNLOAD_AVATAR_CMD = [[bash -c "curl --create-dirs -o  %s/.cache/awmw/gerrit-widget/avatars/%s %s"]]

local gerrit_widget = {}

local function worker(args)

    local args = args or {}

    local host = args.host or naughty.notify{preset = naughty.config.presets.critical, text = 'Gerrit host is unknown'}
    local query = args.query or 'is:reviewer AND status:open AND NOT is:wip'

    local current_number_of_reviews
    local previous_number_of_reviews = 0
    local name_dict = {}

    local rows = {
        { widget = wibox.widget.textbox },
        layout = wibox.layout.fixed.vertical,
    }

    local popup = awful.popup{
        visible = true,
        ontop = true,
        visible = false,
        shape = gears.shape.rounded_rect,
        border_width = 1,
        border_color = beautiful.bg_focus,
        maximum_width = 400,
        preferred_positions = top,
        offset = { y = 5 },
        widget = {}
    }

    gerrit_widget = wibox.widget {
        {
            {
                image = HOME_DIR .. '/.config/awesome/awesome-wm-widgets/gerrit-widget/gerrit_icon.svg',
                widget = wibox.widget.imagebox
            },
            margins = 4,
            layout = wibox.container.margin
        },
        {
            id = "txt",
            widget = wibox.widget.textbox
        },
        {
            id = "new_rev",
            widget = wibox.widget.textbox
        },
        layout = wibox.layout.fixed.horizontal,
        set_text = function(self, new_value)
            self.txt.text = new_value
        end,
        set_unseen_review = function(self, is_new_review)
            self.new_rev.text = is_new_review and '*' or ''
        end
    }

    local function get_name_by_id(id)
        if name_dict[id] == null then
            name_dict[id] = {}
        end

        if name_dict[id].username == nil then
            name_dict[id].username = ''
            spawn.easy_async(string.format(GET_USER_CMD, host, id), function(stdout, stderr, reason, exit_code)
                local user = json.decode(stdout)
                name_dict[tonumber(id)].username = user.name
                spawn.easy_async(string.format(DOWNLOAD_AVATAR_CMD, HOME_DIR, id, user.avatars[1].url), function(stdout1, ...)

                end)
            end)
            return name_dict[id].username
        end

        return name_dict[id].username
    end

    local update_widget = function(widget, stdout, _, _, _)
        local reviews = json.decode(stdout)

        current_number_of_reviews = rawlen(reviews)

        if current_number_of_reviews > previous_number_of_reviews then
            widget:set_unseen_review(true)
            naughty.notify{
                icon = HOME_DIR ..'/.config/awesome/awesome-wm-widgets/gerrit-widget/gerrit_icon.svg',
                title = 'New Incoming Review',
                text = reviews[1].project .. '\n' .. get_name_by_id(reviews[1].owner._account_id) .. reviews[1].subject .. '\n',
                run = function() spawn.with_shell("google-chrome https://" .. host .. '/' .. reviews[1]._number) end
            }
        end

        previous_number_of_reviews = current_number_of_reviews
        widget:set_text(current_number_of_reviews)

        for i = 0, #rows do rows[i]=nil end
        for _, review in ipairs(reviews) do
            local row = wibox.widget {
                {
                    {
                        {
                            {
                                resize = true,
                                image = os.getenv("HOME") ..'/.cache/awmw/gerrit-widget/avatars/' .. review.owner._account_id,
                                forced_width = 40,
                                forced_height = 40,
                                widget = wibox.widget.imagebox
                            },
                            margins = 8,
                            layout = wibox.container.margin
                        },
                        {
                            {
                                markup = '<b>' .. review.project .. '</b>',
                                align = 'center',
                                widget = wibox.widget.textbox
                            },
                            {
                                text = '  ' .. get_name_by_id(review.owner._account_id),
                                widget = wibox.widget.textbox
                            },
                            {
                                text = '  ' .. review.subject,
                                widget = wibox.widget.textbox
                            },
                            layout = wibox.layout.align.vertical
                        },
                        spacing = 8,
                        layout = wibox.layout.fixed.horizontal
                    },
                    margins = 8,
                    layout = wibox.container.margin
                },
                widget = wibox.container.background
            }

            row:connect_signal("button::release", function(_, _, _, button)
                spawn.with_shell("google-chrome https://" .. host .. '/' .. review._number)
            end)

            row:connect_signal("mouse::enter", function(c) c:set_bg(beautiful.bg_focus) end)
            row:connect_signal("mouse::leave", function(c) c:set_bg(beautiful.bg_normal) end)

            row:buttons(
                awful.util.table.join(
                    awful.button({}, 1, function()
                        spawn.with_shell("google-chrome https://" .. host .. '/' .. review._number)
                        popup.visible = false
                    end),
                    awful.button({}, 3, function()
                        spawn.with_shell("echo 'git-review -d " .. review._number .."' | xclip -selection clipboard")
                        popup.visible = false
                    end)
                )
            )

            table.insert(rows, row)
        end

        popup:setup(rows)
    end

    gerrit_widget:buttons(
        awful.util.table.join(
            awful.button({}, 1, function()
                gerrit_widget:set_unseen_review(false)
                if popup.visible then
                    popup.visible = not popup.visible
                else
                    popup:move_next_to(mouse.current_widget_geometry)
                end
            end)
        )
    )

    watch(string.format(GET_CHANGES_CMD, host, query:gsub(" ", "+")), 10, update_widget, gerrit_widget)
    return gerrit_widget
end

return setmetatable(gerrit_widget, { __call = function(_, ...) return worker(...) end })
