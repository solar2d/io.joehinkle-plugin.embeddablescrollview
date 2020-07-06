local Library = require "CoronaLibrary"

-- Create library
local lib = Library:new{ name='embeddablescrollview', publisherId='io.joehinkle' }

-------------------------------------------------------------------------------
-- BEGIN (Insert your implementation starting here)
-------------------------------------------------------------------------------

local ScrollViewControl = {}

local widget = require("widget")

function ScrollViewControl.create(params)
    local displayObjectToGiveTouchFocusFromHorizontalScroll = params.displayObjectToGiveTouchFocusFromHorizontalScroll or nil
    local displayObjectToGiveTouchFocusFromVerticalScroll = params.displayObjectToGiveTouchFocusFromVerticalScroll or nil
    local horizontalScrollDisabled = params.horizontalScrollDisabled or false
    local verticalScrollDisabled = params.verticalScrollDisabled or false
    local displayObjectToGiveTouchFocusFromFunctionCall = params.displayObjectToGiveTouchFocusFromFunctionCall or nil

    local scrollView

    local oldListener = params.listener
    local shouldLockX = false
    local shouldLockY = false
    local shouldLockFunc = false
    local shouldGiveFocusFromFunctionCall = false
    params.listener = function( event )
        if event.phase == "began" then
            shouldLockX = false
            shouldLockY = false
            shouldLockFunc = false
            if not horizontalScrollDisabled then
                scrollView:setIsLocked(false, "horizontal")
            end
            if not verticalScrollDisabled then
                scrollView:setIsLocked(false, "vertical")
            end
        elseif event.phase == "ended" then
            if horizontalScrollDisabled then
                if displayObjectToGiveTouchFocusFromHorizontalScroll then displayObjectToGiveTouchFocusFromHorizontalScroll._momentumScrolling._touch( displayObjectToGiveTouchFocusFromHorizontalScroll._view, event ) end
            else
                scrollView:setIsLocked(false, "horizontal")
            end
            if verticalScrollDisabled then
                if displayObjectToGiveTouchFocusFromVerticalScroll then displayObjectToGiveTouchFocusFromVerticalScroll._momentumScrolling._touch( displayObjectToGiveTouchFocusFromVerticalScroll._view, event ) end
            else
                scrollView:setIsLocked(false, "vertical")
            end
        elseif event.phase == "moved" then
            if shouldGiveFocusFromFunctionCall and displayObjectToGiveTouchFocusFromFunctionCall then -- give control away if function was called
                shouldLockFunc = true
                shouldGiveFocusFromFunctionCall = false
                local view = displayObjectToGiveTouchFocusFromFunctionCall._view
                view._startXPos = event.x
                view._startYPos = event.y
                view._prevXPos = event.x
                view._prevYPos = event.y
                view._prevX = 0
                view._prevY = 0
                view._delta = 0
                view._velocity = 0
                view._prevTime = 0
                view._moveDirection = nil
                view._trackVelocity = true
                view._updateRuntime = false

                view._isFocus = true
            end
            if not (shouldLockX or shouldLockY or shouldLockFunc) then -- if we are not locked
                local dx = math.abs( ( event.x - event.xStart ) )
                local dy = math.abs( ( event.y - event.yStart ) )
                if (dx > 10) then
                    shouldLockX = true
                    if displayObjectToGiveTouchFocusFromHorizontalScroll then
                        local view = displayObjectToGiveTouchFocusFromHorizontalScroll._view
                        view._startXPos = event.x
                        view._startYPos = event.y
                        view._prevXPos = event.x
                        view._prevYPos = event.y
                        view._prevX = 0
                        view._prevY = 0
                        view._delta = 0
                        view._velocity = 0
                        view._prevTime = 0
                        view._moveDirection = nil
                        view._trackVelocity = true
                        view._updateRuntime = false

                        view._isFocus = true
                    end
                elseif (dy > 10) then
                    shouldLockY = true
                    if displayObjectToGiveTouchFocusFromVerticalScroll then
                        local view = displayObjectToGiveTouchFocusFromVerticalScroll._view
                        view._startXPos = event.x
                        view._startYPos = event.y
                        view._prevXPos = event.x
                        view._prevYPos = event.y
                        view._prevX = 0
                        view._prevY = 0
                        view._delta = 0
                        view._velocity = 0
                        view._prevTime = 0
                        view._moveDirection = nil
                        view._trackVelocity = true
                        view._updateRuntime = false

                        view._isFocus = true
                    end
                end
            end
            if shouldLockX and displayObjectToGiveTouchFocusFromHorizontalScroll then -- give control to horizontal if you have it
                displayObjectToGiveTouchFocusFromHorizontalScroll._momentumScrolling._touch( displayObjectToGiveTouchFocusFromHorizontalScroll._view, event )
                scrollView:setIsLocked(true)
            end
            if shouldLockY and displayObjectToGiveTouchFocusFromVerticalScroll then -- give control to vertical if you have it
                displayObjectToGiveTouchFocusFromVerticalScroll._momentumScrolling._touch( displayObjectToGiveTouchFocusFromVerticalScroll._view, event )
                scrollView:setIsLocked(true)
            end
            if shouldLockFunc and displayObjectToGiveTouchFocusFromFunctionCall then
                displayObjectToGiveTouchFocusFromFunctionCall._momentumScrolling._touch( displayObjectToGiveTouchFocusFromFunctionCall._view, event )
                scrollView:setIsLocked(true)
            end
        end
        if oldListener then oldListener(event) end
        return true
    end
    scrollView = widget.newScrollView(params)
    function scrollView:giveFocusAway()
        shouldGiveFocusFromFunctionCall = true
    end
    return scrollView
end


lib.create = ScrollViewControl.create

-------------------------------------------------------------------------------
-- END
-------------------------------------------------------------------------------

-- Return library instance
return lib
