local Library = require "CoronaLibrary"

-- Create library
local lib = Library:new{ name='embeddablescrollview', publisherId='io.joehinkle' }

local scrollViewControl = require "plugin.embeddablescrollview.scrollviewcontrol"

-------------------------------------------------------------------------------
-- BEGIN (Insert your implementation starting here)
-------------------------------------------------------------------------------

lib.create = scrollViewControl.create

-------------------------------------------------------------------------------
-- END
-------------------------------------------------------------------------------

-- Return library instance
return lib
