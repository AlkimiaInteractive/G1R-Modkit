# G1R ModKit

> For a rendered web version of the documentation and API reference documentation for native types, see  
> https://alkimiainteractive.github.io/G1R-Modkit
>
> Find it on GitHub at  
> https://github.com/AlkimiaInteractive/G1R-Modkit

Official ModKit for *Gothic 1 Remake*:

* General documentation and guides
* Full G1R AngelScript sources (as shipped with the game)
* AngelScript reference documentation for native types
* Example mods

G1R is built on a customized **UnrealEngine 5.4.3**, using [Hazelight's AngelScript Integration](https://angelscript.hazelight.se) fork and many of our own modifications.

Unreal AngelScript is a text based scripting language, which *Gothic 1 Remake* specifically uses to allow for better modding capabilities than games made with UnrealEngine usually offer:

* Where feasible, gameplay logic is either completely *Script based* or implemented in C++ with configurable AngelScript classes that allow for *Data driven* development.
* Blueprints were mostly only used to configure visuals.

Before starting to work on the game's script files, we recommend giving the full [overview](https://angelscript.hazelight.se/getting-started/introduction/) and *Script Features* section a quick read.

> [!NOTE]
> The variant of AngelScript used here heavily differs from the original AngelScript language, so it is **NOT** recommended to use the [original documentation](https://www.angelcode.com/angelscript/) as a reference.
