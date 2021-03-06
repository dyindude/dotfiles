# Gerrit widget

This widget adds support for [Gerrit](https://www.gerritcodereview.com/). It shows number of currently assigned reviews to the user and shows a notification when new review is assigned. 

## Customization

It is possible to customize widget by providing a table with all or some of the following config parameters:

| Name | Default | Description |
|---|---|---|
| `host` | Required | Ex https://gerrit.tmnt.com |
| `query` | `is:reviewer AND status:open AND NOT is:wip` | Query to retrieve reviews |

## Prerequisite

 - [curl](https://curl.haxx.se/) - is used to communicate with gerrit's [REST API](https://gerrit-review.googlesource.com/Documentation/rest-api.html)
 - setup [netrc](https://ec.haxx.se/usingcurl-netrc.html) which is used to store username and password in order to call API's endpoints.

## Installation

1. Download json parser for lua from [github.com/rxi/json.lua](https://github.com/rxi/json.lua) and place it under **~/.config/awesome/** (don't forget to star a repo):

    ```bash
    wget -P ~/.config/awesome/ https://raw.githubusercontent.com/rxi/json.lua/master/json.lua
    ```

1. Clone this repo (if not cloned yet) under **~/.config/awesome/**:

    ```bash
    git clone https://github.com/streetturtle/awesome-wm-widgets.git ~/.config/awesome/
    ```

1. Require widget at the top of the **rc.lua**:

    ```lua
    local gerrit_widget = require("awesome-wm-widgets.gerrit-widget.gerrit")
    ```

1. Add widget to the tasklist:

    ```lua
    s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            ...
            --default
            gerrit_widget({host = 'https://gerrit.tmnt.com'}),
            --customized
            gerrit_widget({
                host = 'https://gerrit.tmnt.com',
                query = 'is:reviewer AND is:wip'
            })
            ...
    ```
    