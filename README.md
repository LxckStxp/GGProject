
# GGProject

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/LxckStxp/GGProject/main/Core/Init.lua"))()
```

A robust Roblox script framework for entity tracking, ESP, and aimbot functionality.

## Features
- Robust entity tracking without relying on `GetPlayers`
- Modular ESP system
- Configurable aimbot
- Censura UI integration

## Usage
1. Copy the `loadstring` above and execute it in your Lua executor
2. Press RightAlt to toggle the UI
3. Configure settings through the interface

## Structure
- `Core/` - Core initialization and configuration
- `Modules/` - Feature-specific modules
- `UI/` - UI-related scripts
- `Lib/` - Utility functions, including `ScriptLoader`

## Notes
- All modules are loaded via `loadstring` from GitHub
- `ScriptLoader` simplifies script loading with a single function
