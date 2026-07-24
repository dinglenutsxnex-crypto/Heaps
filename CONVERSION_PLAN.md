# SF3 Unity to Haxe Heaps Conversion Plan

## Project Overview
- **Unity Project**: `unity sf3/RTX Sf3 Project` - Shadow Fight 3 fighting game
- **Target**: Haxe/Heaps framework, web deployment via GitHub Pages
- **GitHub Actions**: Already configured in `.github/workflows/deploy-web.yml`

## Architecture

### Unity → Heaps API Mapping

| Unity | Heaps |
|-------|-------|
| `MonoBehaviour` | `hxd.App` / custom component system |
| `GameObject` | `h3d.scene.Object` |
| `Transform` | `h3d.scene.Transform` |
| `Coroutine` | `hxd.Res` / custom timer system |
| `Shader` | `hxsl.Shader` |
| `MonoBehaviour.Update()` | `hxd.App.update(dt)` |
| `Time.deltaTime` | `dt` parameter in update |
| `Time.timeScale` | Custom `GameTimeController` |
| `SceneManager.LoadScene` | Custom scene management |
| `Resources.Load` | `hxd.Res` / custom loader |
| `PlayerPrefs` | `hxd.Save` |
| `WWWForm` / `UnityWebRequest` | `haxe.Http` / `WebSocket` |

## Conversion Phases

### Phase 1: Foundation (Week 1-2)

#### 1.1 Core Engine
- **Main.hx** - Entry point extending `hxd.App`
  - Initialize game, set up scene management
  - Handle update loop
- **GameTimeController.hx** - Frame-based timing system
  - `timeScale` property (Unity's `Time.timeScale`)
  - Frame counting, delta time calculation
- **GameVariables.hx** - Variable system with frame expiration
  - Static dictionaries for variables and subscriptions
  - `AddVariable`, `GetVariable`, `RemoveVariable`, `Subscribe`, `Unsubscribe`
  - `Update()` to decrement frame counters

#### 1.2 Scene Management
- **EnterPointScene.hx** - Game initialization
  - Port from `EnterPoint.cs`
  - Sequential initialization of game systems
- **FightScene.hx** - Battle/fight scene
  - Port from `SceneManager.cs` + `SceneInitializer.cs`
  - Location loading, singleton initialization

#### 1.3 Resource Management
- **Resources.hx** - Asset loading system
  - Texture loading from `src/assets/`
  - Config file loading (JSON)
  - Asset caching

### Phase 2: Core Game Systems (Week 3-4)

#### 2.1 Model System (`sf3/gamemodels/`)
- **Model.hx** - Base model class (36KB C# → complex)
- **ModelObject.hx** - Game object representation
- **ModelSkin.hx** - Skeletal skinning
- **SkeletonObject.hx** - Bone hierarchy
- **ModelCollision.hx** - Collision detection
- **Bone.hx** - Bone structure
- **ModelInfo.hx** - Model metadata

#### 2.2 Animation System (`sf3/moves/`)
- **ModelAnimation.hx** - Animation playback
- **MovesController.hx** - Move/condition system
- **MovesParser.hx** - Parse move definitions
- **TriggerEvent.hx** / **TriggerAction.hx** - Event system
- **Condition.hx** - Battle condition logic
- **InfoAnimation.hx** - Animation metadata

#### 2.3 Battle System (`sf3/`)
- **BattleController.hx** - Core battle loop (5KB C#)
- **FightController.hx** - Fight mechanics (11KB C#)
- **RoundController.hx** - Round management (9KB C#)
- **BattlesManager.hx** - Battle orchestration (16KB C#)
- **BattleEventsControl.hx** - Event dispatching

### Phase 3: Rendering & Graphics (Week 4-5)

#### 3.1 Rendering Pipeline
- **BattleCamera.hx** - Camera system (22KB C#)
- **ModelsManager.hx** - Model rendering
- **BattleInterface.hx** - UI rendering
- Shader system (`sf3/effects/`, `sf3/gamedebug/`)

#### 3.2 UI System
- Port NGUI-based UI to Heaps UI
- Dialog system, HUD elements, tutorial UI
- Many files in `scripts/` folder

### Phase 4: Networking (Week 5-6)

#### 4.1 Network System
- **NetworkConnection.hx** - Connection management
- **NetworkInitializer.hx** - Init sequence
- **NetworkState.hx** - State machine
- SmartFox2X → WebSocket replacement
- DTOs in `scripts/sf3dto/`

### Phase 5: Polish & Deployment (Week 6-7)

#### 5.1 GitHub Actions
- Workflow already configured
- May need asset pipeline adjustments

#### 5.2 Testing & Optimization
- Web performance optimization
- Asset compression
- Bug fixes

## File Structure

```
Heaps/
├── .github/
│   └── workflows/
│       └── deploy-web.yml  (GitHub Actions CI/CD)
├── src/
│   ├── Main.hx  (Entry point)
│   ├── scenes/
│   │   ├── EnterPointScene.hx
│   │   └── FightScene.hx
│   ├── scripts/
│   │   ├── sf3/  (SF3 game logic)
│   │   ├── common/  (Common utilities)
│   │   ├── network/  (Networking)
│   │   ├── sf3dto/  (Data transfer objects)
│   │   ├── sf3_attributes/  (Attributes system)
│   │   ├── mkglowsystem/  (Glow effects)
│   │   └── clientdto/  (Client DTOs)
│   └── assets/
│       ├── textures/
│       ├── animations/
│       ├── audio/
│       ├── configs/
│       ├── effects/
│       ├── fonts/
│       ├── locations/
│       ├── shaders/
│       ├── skins/
│       ├── tactics/
│       └── weapons/
├── web/
│   └── index.html
├── build-web.hxml
└── README.md
```

## Priority Order

### Critical Path (must have for basic gameplay)
1. GameTimeController, GameVariables
2. Model, ModelObject, SkeletonObject
3. ModelAnimation, MovesController
4. BattleController, FightController
5. BattleCamera
6. Basic rendering

### Important (enhances gameplay)
1. Trigger system (events/actions)
2. Collision system
3. UI system
4. Effects

### Nice to have (polish)
1. Networking
2. Advanced shaders
3. Audio system
4. Full tutorial system

## Build Configuration

### build-web.hxml
```
-cp src
-lib heaps
-main Main
-js bin/web/game.js
-dce full
```

### GitHub Actions Workflow
- Triggers on push to main
- Installs Haxe 4.3.3
- Installs heaps and hlsdl
- Builds web target
- Copies assets to site/
- Deploys to GitHub Pages

## Asset Pipeline

### Textures
- PNG files can be used directly
- Load via `hxd.Res` or custom loader

### Models
- GLB files need conversion to HMD format
- Use `hxd.Res.convert` or external tools

### Animations
- Custom format → Heaps animation system
- May need to parse Unity animation data

### Shaders
- HLSL → HxSL conversion
- Heaps shader syntax is different from Unity's
