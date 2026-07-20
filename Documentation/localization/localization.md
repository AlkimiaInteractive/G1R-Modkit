---
title: "Localization"
description: "Texts, audio and new language translations."
sidebar:
  order: 1
---
Each mod package can bring its own localization files to override and extend the base game. The game reads localization from YAML files put here:

```
.../MyModPackage/Story/Conversation/text
```

Audio files can be put in `.ogg` or `.wav` format here:

```
.../MyModPackage/Story/Conversation/audio
```

:::note
All of these folders are searched recursively, put subfolders as you wish.
:::

On startup, new YAML files are ingested and a binary localization cache is written. If any of the source files change, the cache is updated automatically on startup.

## YAML TextDB File format

The file format for localized texts is quite simple: All files ending in `.textdb.yaml` in the `text/` subfolder are collected and combined into a single large map of `[Text-ID -> Languages]`.

You can split files how you want it, by language, by use-case, by character, it does not matter. It is all loaded and put into the same map in the end.

These Text-DB files should be saved in UTF-8 encoding with this structure:

```yaml
Text_Hello:
    Language1: "Hello in language 1"
    Language2: "Hello in language 2"
    Language3: "Hello in language 3"

Text_World:
    Language1: "World in language 1"
    Language2: "World in language 2"
    Language3: "World in language 3"
```

for example, the "Continue" button's text in the main menu is defined as follows: 

```yaml
Text_Resume:
  english: "Resume"
  german: "Fortsetzen"
  french: "Reprendre"
  spanish: "Reanudar"
  schinese: "返回"
  italian: "Riprendi"
  japanese: "再開"
  polish: "Wznów"
  brazilian: "Retomar"
  russian: "Продолжить"
```

Place as many of these into a single file as you like.

:::note
While developing *Gothic 1 Remake*, we found splitting Text-DB files by language to work well with version control. We would have

* `OC_STT_Diego.english.textdb.yaml`
* `OC_STT_Diego.german.textdb.yaml`
* `OC_STT_Diego.spanish.textdb.yaml`

where each file contained each Text-ID but only one language each. Since they're all merged on startup, this acts the same as if it was all in one file.
:::

### Metadata

Each Text-ID has an optional field for Metadata:

```yaml
Text_Hello:
  english: "Hello"
  german: "Hallo"
  meta:
    - name: Expression
      value: happy
    - name: AudioEffectOverride
      value: Orc
```

## Localized Audio

For spoken sentences, the game looks for audio files `.ogg` or `.wav` format here (including subfolders):

```
.../MyModPackage/Story/Conversation/audio
```

The files must have the same name as the Text-ID, they are automatically loaded and matched on startup.

For example, a text named `Text_Hello` would look for `Text_Hello.ogg` or `Text_Hello.wav`.

## Getting your localization into the game

To actually have the game load the Text-DBs from your mod package, you need to add a couple lines to the `Game.ini` file.

If you don't have one yet, create a `Config` folder in your mod package and create a new `Game.ini` file with these contents:

```ini
[/Script/AlkimiaStoryFileImport.AlkimiaLocalizationSubsystem]
+MountPoints=(MountPoint="/MyModPackage", Module="MyModPackage", MountPath="/Story/Conversation")
```

Replace `MyModPackage` with the internal name of your mod (same as your mod's folder name).

:::note[Important]
Not correctly specifying the module will cause the paths to be incorrect when the mod is installed via SteamWorkshop
:::


### Mounting zip files (Advanced)

Internally, files in the `Story/` folders are added to a Virtual File System, allowing for stable paths and easy overrides. This is not only for Text-DBs, but also audio, images and story source files. The system supports mounting regular folders, but it can also mount .zip files. If you have a large project with many small files, you should consider packing them into a .zip, as having to deal with lots of small individual files can be annoying for players.

:::note
If your mod doesn't have a huge number of files, you can skip this step and just leave the files as normal.
:::

Mounting .zip files works in a similar way as regular directories: Given some zip files with an internal folder structure like this:

```
english_newer.zip:
    english_newer/*.ogg

german_new.zip:
    german_new/*.ogg

polish.zip:
    polish/*.ogg

russian.zip:
    russian/*.ogg

foreign.zip:
    foreign/*.ogg
```

you can mount them like so:

```ini
[/Script/AlkimiaStoryFileImport.AlkimiaLocalizationSubsystem]
+MountPoints=(MountPoint="/MyModPackage/audio",  Module="MyModPackage", MountPath="/Story/VoiceOver/english_newer.zip")
+MountPoints=(MountPoint="/MyModPackage/audio",  Module="MyModPackage", MountPath="/Story/VoiceOver/german_new.zip")
+MountPoints=(MountPoint="/MyModPackage/audio",  Module="MyModPackage", MountPath="/Story/VoiceOver/polish.zip")
+MountPoints=(MountPoint="/MyModPackage/audio",  Module="MyModPackage", MountPath="/Story/VoiceOver/russian.zip")
+MountPoints=(MountPoint="/MyModPackage/audio",  Module="MyModPackage", MountPath="/Story/VoiceOver/foreign.zip")
```

Each of these .zip files that come with *Gothic 1 Remake* contain a single subfolder with the name of the language they belong to. That `english_newer.zip` would mount itself as `/MyModPackage/audio/english_newer/...`. You don't have to do it that way though, you can also mount it to some specific sub-folder:

```
SomeAudioFiles.zip:
    *.ogg
```

```ini
[/Script/AlkimiaStoryFileImport.AlkimiaLocalizationSubsystem]
+MountPoints=(MountPoint="/MyModPackage/audio/english_newer",  Module="MyModPackage", MountPath="/Story/VoiceOver/SomeAudioFiles.zip")
```

or just have a .zip file that contains all languages:

```
AudioInLanguageSubfolders.zip:
    english_newer/*.ogg
    german_new/*.ogg
    russian/*.ogg
    polish/*.ogg
    foreign/*.ogg
```

mounted as

```ini
[/Script/AlkimiaStoryFileImport.AlkimiaLocalizationSubsystem]
+MountPoints=(MountPoint="/MyModPackage/audio",  Module="MyModPackage", MountPath="/Story/VoiceOver/AudioInLanguageSubfolders.zip")
```

:::note
You can override base game content by placing these mount locations so that they point to the same virtual folder, e.g. `/G1R/audio`. 

The priority is: *Last mount point is checked first.*
:::

## Adding a new language translation

You can add a new language by creating new `.textdb.yaml` files that add the string for your new language to each existing Text-ID. No need to touch the base game's files for this.

For example to add the language *Gibberish*, create a `.textdb.yaml` file that contains this, along with all other Texts you want to translate:

```yaml
Text_Continue:
  gibberish: "Resume (but in gibberish)"
```

To actually add this to the game, you will need to create a new *Language Set*: These combine multiple of the languages defined in YAML and allow you to define 
the priority of which language to use in case a Text was not translated in one of them.

Go into your mods `Game.ini`, and extend it like so:


```ini
[/Script/AlkimiaStoryFileImport.AlkimiaLocalizationSubsystem]
+MountPoints=(MountPoint="/GibberishTranslation", Module="GibberishTranslation", MountPath="/Story/Conversation")
+LanguageSets=(SetName=Gibberish, DisplayText="Gibberish", bHasVoiceOver=False, LanguagePriority=("english", "english_new", "english_newer", "gibberish"))
```

This will add your language to the ingame settings menu, and define that "Gibberish" should be the highest priority language. If something is missing from your translation,
the game will fall back to `english_newer`. If the text doesn't exist there, it falls back to `english_new`, etc.

Since in this example only the `Text_Continue` was translated, only that should change, the rest would stay in english.
