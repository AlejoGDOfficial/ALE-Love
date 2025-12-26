ALEKeyManager = ALEClass.extend()

function ALEKeyManager:new()
    self.pressed = {}
    self.justPressed = {}
    self.justReleased = {}

    return self
end

function ALEKeyManager:justPressedKey(key)
    self.pressed[key] = true

    self.justPressed[key] = true
end

function ALEKeyManager:justReleasedKey(key)
    self.pressed[key] = nil

    self.justReleased[key] = true
end

function ALEKeyManager:update()
    self.justPressed = {}
    self.justReleased = {}
end

return ALEKeyManager
