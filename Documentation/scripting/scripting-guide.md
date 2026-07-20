---
title: "Scripting Guide"
description: "Language basics of the Unreal AngelScript variant used in Gothic 1 Remake."
sidebar:
  order: 1
---
The syntax of variant of AngelScript used in *Gothic 1 Remake* can probably be best described as a mix between C# and C++. If you've used a C-family language before, it should feel somewhat familiar to you.

## Object Nullchecks

Unreal AngelScript deliberately made the choice to not support this pattern:

```cpp
if (!SomeObject) { ... } // Does not work
if (SomeObject) { ... } // Does not work
```

instead, you'll have to be explicit if you really want a nullcheck

```cpp
if (SomeObject == nullptr) { ... }
if (SomeObject != nullptr) { ... }
```

however, in general, it is cleaner to just use `IsValid` instead:

```cpp
if (!IsValid(SomeObject)) { ... }
if (IsValid(SomeObject)) { ... }
```

:::note
`IsValid` also returns false if the Object has been marked as Garbage. This is important when working with AbilityTasks, as they are marked garbage as soon as they finish.
:::

## StaticClass

All `UObject`-derived types have a `::StaticClass()` static member function that returns the type's `UClass`. To not have hundreds of `::StaticClass()` sprinkled throughout the scripts, the class name itself
has been made to act as a global variable set to the class itself.

So these two are the same:

```cpp
UClass Test1 = UMyObject;                 // New, shorter style
UClass Test1 = UMyObject::StaticClass();  // Old explicit style
```

This was a feature that was added later during development, so you will still find `::StaticClass()` being used in the scripts, but in general, prefer the shorter variant.

## Automatic return type deduction

Template support is limited to data-types, i.e. `TArray<>`, `TSet<>` etc. There is no function template support in the language at all. The odd one out is `Cast<>`, which is not really a function template but a language feature.

On many native bindings, the script engine can be instructed to change the return type of a function to match the type of a `UObject` or  `TSubclassOf`, so that you don't need to do another cast.

For example:

```cpp
// Bad: Useless extra cast, GetTypedOuter already returns the right type
AActor OuterActor = Cast<AActor>(GetTypedOuter(AActor));
AGothicCharacter OuterCharacter = Cast<AGothicCharacter>(GetTypedOuter(AGothicCharacter));
UTextBlock TextBlock = Cast<UTextBlock>(NewObject(this, UTextBlock));

// Good: Return type is inherited from the passed class
AActor OuterActor = GetTypedOuter(AActor);
AGothicCharacter OuterCharacter = GetTypedOuter(AGothicCharacter);
UTextBlock TextBlock = NewObject(this, UTextBlock);
```

:::note
Not all functions do this automatically. Only the hand-written native AngelScript bindings.
:::
