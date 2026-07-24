# Conversion Progress Tracker

## Overview
This file tracks the conversion progress from Unity C# to Haxe/Heaps.

## Phase 1: Foundation

### Core Engine
| File | Unity Source | Status | Notes |
|------|-------------|--------|-------|
| `src/Main.hx` | N/A (new) | ✅ Done | Extends `hxd.App`, integrates scene management |
| `src/scripts/GameTimeController.hx` | `SF3/GameTimeController.cs` | ✅ Done | Time scaling, frame timing, pause/resume |
| `src/scripts/GameVariables.hx` | `SF3/GameVariables.cs` | ✅ Done | Variable system with frame expiration, LocalVariable class |
| `src/scripts/BootLogger.hx` | `BootLogger.cs` | ✅ Done | Boot logging utility |
| `src/scripts/GlobalTimer.hx` | `Nekki/Utils/GlobalTimer.cs` | ✅ Done | Server time sync, timer events |
| `src/scripts/sf3/LoadScreen.hx` | `LoadScreen.cs` | ✅ Done | Loading screen UI |
| `src/scripts/ModuleController.hx` | `BaseModuleController.cs` | ✅ Done | Module management |
| `src/scripts/sf3/SF3Utils.hx` | `SF3/SF3Utils.cs` | ✅ Done | Utility functions |
| `src/scripts/sf3/battleutils/SF3BattleUtils.hx` | `SF3/BattleUtils/SF3BattleUtils.cs` | ✅ Done | FPS and ping utilities |
| `src/scripts/sf3/ESurfaceType.hx` | `SF3/ESurfaceType.cs` | ✅ Done | Surface type enum |
| `src/scripts/sf3/Sandbox.hx` | `SF3/Sandbox.cs` | ✅ Done | Sandbox/console commands |

### Scene Management
| File | Unity Source | Status | Notes |
|------|-------------|--------|-------|
| `src/scenes/EnterPointScene.hx` | `EnterPoint.cs` | ✅ Done | Basic port - initialization sequence |
| `src/scenes/FightScene.hx` | `SF3/SceneManager.cs` + `SceneInitializer.cs` | ✅ Done | Basic port - scene loading |
| `src/scripts/sf3/SceneManager.hx` | `SF3/SceneManager.cs` | ✅ Done | Scene management singleton |
| `src/scripts/sf3/SceneInitializer.hx` | `SF3/SceneInitializer.cs` | ✅ Done | Location scene initialization |
| `src/scripts/sf3/ESceneType.hx` | `SF3/ESceneType.cs` | ✅ Done | Scene type enum |

### Resource Management
| File | Unity Source | Status | Notes |
|------|-------------|--------|-------|
| `src/scripts/Resources.hx` | `UnityEngine.Resources` | ❌ Pending | Asset loading system |

## Phase 2: Core Game Systems

### Model System
| File | Unity Source | Status | Notes |
|------|-------------|--------|-------|
| `src/scripts/sf3/gamemodels/Model.hx` | `SF3/GameModels/Model.cs` | ❌ Pending | 36KB - base model class |
| `src/scripts/sf3/gamemodels/ModelObject.hx` | `SF3/GameModels/ModelObject.cs` | ❌ Pending | 18KB - game object |
| `src/scripts/sf3/gamemodels/SkeletonObject.hx` | `SF3/GameModels/SkeletonObject.cs` | ❌ Pending | 13KB - bone hierarchy |
| `src/scripts/sf3/gamemodels/ModelSkin.hx` | `SF3/GameModels/ModelSkin.cs` | ❌ Pending | 18KB - skinning |
| `src/scripts/sf3/gamemodels/ModelCollision.hx` | `SF3/GameModels/ModelCollision.cs` | ❌ Pending | 10KB - collision |
| `src/scripts/sf3/gamemodels/Bone.hx` | `SF3/GameModels/Bone.cs` | ❌ Pending | 3KB - bone structure |
| `src/scripts/sf3/gamemodels/ModelInfo.hx` | `SF3/GameModels/ModelInfo.cs` | ❌ Pending | 35KB - model metadata |

### Animation System
| File | Unity Source | Status | Notes |
|------|-------------|--------|-------|
| `src/scripts/sf3/moves/ModelAnimation.hx` | `SF3/Moves/ModelAnimation.cs` | ❌ Pending | 23KB - animation playback |
| `src/scripts/sf3/moves/MovesController.hx` | `SF3/Moves/MovesController.cs` | ❌ Pending | 1KB - move controller |
| `src/scripts/sf3/moves/MovesParser.hx` | `SF3/Moves/MovesParser.cs` | ❌ Pending | 17KB - parser |
| `src/scripts/sf3/moves/TriggerEvent.hx` | `SF3/Moves/TriggerEvent.cs` | ❌ Pending | 9KB - events |
| `src/scripts/sf3/moves/TriggerAction.hx` | `SF3/Moves/TriggerAction.cs` | ❌ Pending | 9KB - actions |
| `src/scripts/sf3/moves/Condition.hx` | `SF3/Moves/Condition.cs` | ❌ Pending | 31KB - conditions |
| `src/scripts/sf3/moves/InfoAnimation.hx` | `SF3/Moves/InfoAnimation.cs` | ❌ Pending | 13KB - animation info |

### Battle System
| File | Unity Source | Status | Notes |
|------|-------------|--------|-------|
| `src/scripts/sf3/BattleController.hx` | `SF3/BattleController.cs` | ❌ Pending | 5KB - core battle |
| `src/scripts/sf3/FightController.hx` | `SF3/FightController.cs` | ❌ Pending | 11KB - fight mechanics |
| `src/scripts/sf3/RoundController.hx` | `SF3/RoundController.cs` | ❌ Pending | 9KB - round mgmt |
| `src/scripts/sf3/BattlesManager.hx` | `SF3/BattlesManager.cs` | ❌ Pending | 16KB - orchestration |
| `src/scripts/sf3/BattleEventsControl.hx` | `SF3/BattleEventsControl.cs` | ❌ Pending | 2KB - event dispatch |

## Phase 3: Rendering & Graphics

### Rendering
| File | Unity Source | Status | Notes |
|------|-------------|--------|-------|
| `src/scripts/sf3/BattleCamera.hx` | `SF3/BattleCamera.cs` | ❌ Pending | 22KB - camera system |
| `src/scripts/sf3/ModelsManager.hx` | `SF3/ModelsManager.cs` | ❌ Pending | 12KB - model rendering |

### UI System
| File | Unity Source | Status | Notes |
|------|-------------|--------|-------|
| (Many files) | NGUI-based UI | ❌ Pending | 100+ UI files to port |

## Phase 4: Networking

| File | Unity Source | Status | Notes |
|------|-------------|--------|-------|
| `src/scripts/network/NetworkConnection.hx` | `Network/NetworkConnection.cs` | ❌ Pending | 15KB - connection |
| `src/scripts/network/NetworkInitializer.hx` | `Network/NetworkInitializer.cs` | ❌ Pending | 1KB - init |

## Phase 5: Polish & Deployment

| Task | Status | Notes |
|------|--------|-------|
| GitHub Actions CI/CD | ✅ Done | Workflow configured, builds pass |
| Build testing | ✅ Done | Black screen expected (stubs) |
| GitHub Pages deploy | ✅ Done | Deployed successfully |

## API Replacements Reference

### Unity → Heaps

| Unity API | Heaps Equivalent | Replacement Pattern |
|-----------|-----------------|---------------------|
| `MonoBehaviour` | `hxd.App` | Extend `hxd.App` for main class |
| `GameObject` | `h3d.scene.Object` | Use `h3d.scene` objects |
| `Transform.position` | `h3d.scene.Transform.position` | Same concept, different class |
| `Time.deltaTime` | `dt` in `update(dt)` | Pass delta time as parameter |
| `Time.timeScale` | Custom in `GameTimeController` | Static variable |
| `Coroutine` | `hxd.Res` / custom | Use `hxd.Res` or custom timer |
| `Resources.Load<T>` | `hxd.Res` | `hxd.Res.loadTexture()` etc. |
| `PlayerPrefs` | `hxd.Save` | `hxd.Save.load()` / `hxd.Save.save()` |
| `Debug.Log` | `trace()` | Use Haxe `trace()` |
| `Vector3` | `h3d.Vector` | `h3d.Vector` or `hxd.Math` |
| `Quaternion` | `h3d.Quaternion` | `h3d.Quaternion` |
| `Color` | `hxd.RGBA` | `hxd.RGBA` |
| `List<T>` | `Array<T>` or `hxd.ds.ArrayFlags` | Use `Array<T>` |
| `Dictionary<K,V>` | `haxe.ds.Map<K,V>` | `haxe.ds.Map` or `haxe.ds.StringMap` |
| `Action` | `Void -> Void` | Haxe function type |
| `IEnumerator` | Custom yield system | Use `hxd.Res` or custom |

### Unity-Specific Patterns

| Unity Pattern | Heaps Pattern | Notes |
|--------------|---------------|-------|
| `MonoBehaviour.Update()` | `hxd.App.update(dt)` | Single update loop |
| `StartCoroutine()` | Custom timer/yield | Use `hxd.Res` or custom |
| `Singleton` pattern | Static instance | Same pattern, different syntax |
| `SerializeField` | Public fields | Haxe doesn't have attributes |
| `GetComponent<T>()` | Custom lookup | Need to implement |
| `FindWithTag()` | Custom lookup | Need to implement |
| `Instantiate()` | `h3d.scene.Object.clone()` | Clone objects |
| `Destroy()` | `h3d.scene.Object.remove()` | Remove from scene |
