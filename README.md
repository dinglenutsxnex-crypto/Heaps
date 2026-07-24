# SF3 Haxe/Heaps port

## Structure

- `src/scripts/` — shell `.hx` files mirroring `Assets/Scripts/Assembly-CSharp` from the original Unity project. Empty classes, one per original `.cs` file, same package structure. This is where ported logic goes.
- `src/scenes/` — one shell class per original `.unity` scene (`EnterPointScene`, `FightScene`).
- `src/assets/` — put ported/exported art, fonts, models here.
- `src/Main.hx` — Heaps entry point (`hxd.App`).
- `build-web.hxml` — JS/web build config.
- `web/index.html` — host page for the web build.
- `.github/workflows/deploy-web.yml` — builds the web target and deploys to GitHub Pages on every push to `main`.

## Before this builds

1. Enable GitHub Pages for this repo: Settings → Pages → Source → "GitHub Actions".
2. Run `haxelib install heaps` and `haxelib install hlsdl` locally if you want to build outside CI.
3. `Main.hx` is currently empty — it will compile but show a blank canvas until scene/game logic is wired in.

## Not included yet (by design, per current scope)

- APK build (HashLink/NDK) — to be added later.
- Windows exe build (HashLink native) — to be added later.
- No ported logic yet — all `src/scripts/*.hx` files are empty class stubs, all `src/scenes/*.hx` are empty class stubs.
