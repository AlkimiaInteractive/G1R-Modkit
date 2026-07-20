---
title: "Script Hooking"
description: "Replace and extend base game script classes with Inheritance Injection."
sidebar:
  order: 3
---
A common thing to do in a mod is to replace, modify or extend behavior of the base game. Often, this is done through a mechanism called "hooking", where you can replace individual code-functions with your own implementation.

In *Gothic 1 Remake* we offer a similar mechanism to easily modify base game script classes, called `Inheritance Injection`. This feature allows you to inherit from a base game class, change default parameters, override functions, etc, and then have your version of the class take the place of the original class.

## Syntax

Add the `ReplaceParentClass` meta-tag to your class like so:

```cpp
UCLASS(meta=(ReplaceParentClass))
class UClassToReplace_WithSomeChanges : UClassToReplace
{
    default SomeValue = 42;

    void SomeFunction() override
    {
        // ... custom code

        Super::SomeFunction();
    }
}
```

The name of your class does not actually matter. It should be a bit descriptive for readability but other than that it can be anything. The *parent-class* you put here is important, as that is the class that will be replaced.

On load, your class will be renamed to the same name as the parent class. The original parent class will be renamed to something else.

:::note
These are "stackable": Multiple mods can inject into the same classes. The order depends on mod-loading order.
:::

## Example: Modify startup inventory

Let's say you want to change something in the base game's `UG1RPlayer` class, which is defined like this in the base game:

```cpp
// Base game script file (Player\PlayerCharacter.as)

class UG1RPlayer : UCommonPlayerDefinition
{
    // ...
    default AddToInventory(UItWr_Scroll_Letter_01);
    // ...
}
```

It happens to contain the default player inventory, and in this example, we would like to modify that.

Create a normal script class like this in your mod-package:

```cpp
// File in your own mod-package

UCLASS(meta=(ReplaceParentClass))
class UG1RPlayer_MyMod : UG1RPlayer
{
    default AddToInventory(UItFo_Apple, 99);
}
```

The important difference here is the `meta=(ReplaceParentClass)` tag. When that is present, during the script preprocessing phase, the script code will be automatically modified to put *your* class where the original class you inherited from was.

When the scripts are loaded, the game will *actually* see this code:

```c
// Actual code the game will load after preprocessing (internal, not visible)

class UG1RPlayer__REPLACEDBY__UG1RPlayer_MyMod : UCommonPlayerDefinition
{
    default AddToInventory(UItWr_Scroll_Letter_01);
}

class UG1RPlayer : UG1RPlayer__REPLACEDBY__UG1RPlayer_MyMod
{
    default AddToInventory(UItFo_Apple, 99);
}
```

Notice how your new custom class took the name of the base class you wanted to override. The old base game class still exists, but got renamed out-of-the-way. 

When you start the game now, your Hero will have 99 Apples in his inventory.

## Example: Modify weapon stats

This example modifies the damage a torch will do:

```cpp
UCLASS(meta=(ReplaceParentClass))
class UItMw_1H_Torch_MyMod_DamageIncrease : UItMw_1H_Torch
{
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 100.0f);
    default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 150.0f);
}
```

## Example: Function override

Inheritance injection can also be used in a somewhat similar way to regular function-hooking, although limited to script classes.

Whenever you stomp a Meatbug, the `UGA_Human_SmashMeatBug` GAS-Ability activates. You can add an explosion by overriding the `DoShake` function like so:

```cpp
UCLASS(meta=(ReplaceParentClass))
class UGA_Human_SmashMeatBug_WithExplosion : UGA_Human_SmashMeatBug
{
    /** Explosion asset will automatically be loaded by GAS. */
    UPROPERTY()
    TSoftObjectPtr<UNiagaraSystem> ExplosionEffect = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Magic/P_Fireball_Hit.P_Fireball_Hit'";

    void DoShake() override
    {
        Niagara::SpawnSystemAtLocation(ExplosionEffect.Get(), AvatarActorFromActorInfo.ActorLocation, AvatarActorFromActorInfo.ActorRotation);

        Super::DoShake();
    }
}
```
