-- Health and Sprint Script

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Function to adjust health
local function adjustHealth(amount)
	humanoid.Health = math.clamp(humanoid.Health + amount, 0, humanoid.MaxHealth)
end

-- Function to handle sprinting
local function onSprint(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.LeftShift then
		humanoid.WalkSpeed = 32 -- Increase speed for sprinting
	end
end

-- Function to handle stopping sprint
local function onStopSprint(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.LeftShift then
		humanoid.WalkSpeed = 16 -- Default walking speed
	end
end

-- Connect functions to input events
game:GetService("UserInputService").InputBegan:Connect(onSprint)
game:GetService("UserInputService").InputEnded:Connect(onStopSprint)

-- Example usage: Adjust health by 20
adjustHealth(20)

