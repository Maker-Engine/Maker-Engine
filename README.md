# Maker Engine

**Maker Engine** is a cross-platform game engine built with Haxe designed to make game development simple, flexible, and moddable.

The goal of Maker Engine is to allow developers to easily create games with scripting support, modular systems, and support for multiple platforms such as desktop, mobile, and web.

---

## ✨ Features

- 🎮 2D Game Engine
- ⚡ Built with Haxe
- 🧠 Lua scripting support
- 🧩 Mod support
- 📦 Asset management
- 🎨 Sprite and animation system
- 🎵 Audio system
- ⌨️ Input system (keyboard, mouse, touch)
- 📱 Desktop and Mobile support
- 🌐 HTML5 export support

---

## 🛠 Technologies

Maker Engine is built using the following technologies:

- Haxe
- OpenFL
- Lua / LuaJIT (for scripting)
- Lime

---

## 📂 Project Structure

```
maker-engine/
│
├ source/
│  ├ maker/
│  │  ├ core/
│  │  │  ├ Engine.hx
│  │  │  ├ Scene.hx
│  │  │  └ GameObject.hx
│  │  │
│  │  ├ graphics/
│  │  │  ├ Sprite.hx
│  │  │  └ Camera.hx
│  │  │
│  │  ├ lua/
│  │  │  ├ LuaScript.hx
│  │  │  └ MainLua.hx
│  │  │
│  │  ├ input/
│  │  │  └ Input.hx
│  │  │
│  │  └ audio/
│  │     └ Sound.hx
│  │
│  └ Main.hx
│
├ assets/
├ mods/
├ scripts/
└ project.xml
```

---

## 🚀 Getting Started

### Requirements

Install the following:

- Haxe
- Haxelib
- Git

### Install libraries

```bash
haxelib install lime
haxelib install openfl
```

### Run the engine

```bash
lime test windows
```

---

## 🧠 Lua Scripting Example

Maker Engine supports Lua scripts for gameplay logic.

Example script:

```lua
function onCreate()
    print("Hello from Maker Engine!")
end

function onUpdate(elapsed)
    -- game logic here
end
```

---

## 🎮 Goals

Maker Engine aims to:

- make game creation easier
- support modding
- provide a flexible scripting system
- run on multiple platforms

---

## 📜 License

Maker Engine is open-source and available under the MIT License.

---

## 👨‍💻 Author

Created by **Brenninho**

---

## ⭐ Contributing

Contributions, issues, and feature requests are welcome.

Feel free to fork the project and submit pull requests.