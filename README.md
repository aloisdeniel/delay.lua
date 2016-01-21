# delay.lua

A tiny library for awaiting. It has been elaborated to be used in conjunction with [tween.lua](https://github.com/kikito/tween.lua) and [chain.lua](https://github.com/aloisdeniel/chain.lua) for creating complete animations or game cutscenes.

# Example

```lua
local delay = require 'delay'

local exampleDelay = delay.new(10)

if exampleDelay:update(dt) then
	print("Finished !")
end
```

# Installation

Just copy the `delay.lua` file somewhere in your projects (maybe inside a `/lib/` folder) and require it accordingly.

## Copyright and license

MIT © [Aloïs Deniel](http://aloisdeniel.github.io)