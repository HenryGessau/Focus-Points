--[[
  Copyright 2016 Joshua Musselwhite, Whizzbang Inc

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--]]

--[[
  A collection of delegate functions to be passed into the DefaultPointRenderer when
  the camera is Fuji 
--]]

local LrStringUtils = import "LrStringUtils"
require "Utils"

FujiDelegates = {}

--[[
-- metaData - the metadata as read by exiftool
--]]
function FujiDelegates.getFujiAfPoints(metaData)
  local focusPoint = ExifUtils.findValue(metaData, "Focus Pixel")
  if focusPoint == nil then return nil end
  local values = splitText(focusPoint, " ")
  local x = LrStringUtils.trimWhitespace(values.key)
  local y = LrStringUtils.trimWhitespace(values.value)
  
  return tonumber(x), tonumber(y)
  
end