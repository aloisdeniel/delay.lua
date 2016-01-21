local delay = {
  _VERSION     = 'delay 1.0.0',
  _DESCRIPTION = 'updatable delay for lua',
  _URL         = 'https://github.com/aloisdeniel/delay.lua',
  _LICENSE     = [[
    MIT LICENSE

    Copyright (c) 2016 Alois Deniel

    Permission is hereby granted, free of charge, to any person obtaining a
    copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be included
    in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
    OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  ]]
}

-- Instances

local Delay = {}
local Delay_mt = {__index = Delay}

function Delay:set(clock)
  assert(type(clock) == 'number', "clock must be a positive number or 0")
  self.clock = math.min(self.duration,math.max(0,clock))
  return self.clock == self.duration
end

function Delay:reset()
  return self:set(0)
end

function Delay:update(dt)
  assert(type(dt) == 'number', "dt must be a number")
  return self:set(self.clock + dt)
end

-- Validation

local function validate(duration)
  assert(type(duration) == 'number' and duration > 0, "duration must be a positive number. Was " .. tostring(duration))
end

-- Public interface

function delay.new(duration)
  validate(duration)
  return setmetatable({
    duration = duration,
    clock     = 0
  }, Delay_mt)
end

return delay