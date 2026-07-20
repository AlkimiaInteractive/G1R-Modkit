class UGothicFXDefinition_Weapon_Impact_Hit : UGothicFXDefinition
{
    TMap<FGameplayTag,float> AttackWeaponTypeValues;
    default CooldownTime = 0.1f;

    default AttackWeaponTypeValues.Add(GameplayTag::Item_Weapon_Fist, 1);
    default AttackWeaponTypeValues.Add(GameplayTag::Item_Weapon, 2);
    default AttackWeaponTypeValues.Add(GameplayTag::Item_Weapon_Sword_OneHand, 3);
    default AttackWeaponTypeValues.Add(GameplayTag::Item_Weapon_Axe_OneHand, 4);
    default AttackWeaponTypeValues.Add(GameplayTag::Item_Weapon_Mace_OneHand, 5);
    default AttackWeaponTypeValues.Add(GameplayTag::Item_Weapon_Sword_TwoHand, 6);
    default AttackWeaponTypeValues.Add(GameplayTag::Item_Weapon_Axe_TwoHand, 7);
    default AttackWeaponTypeValues.Add(GameplayTag::Item_Weapon_Orc_TwoHand, 7);
    default AttackWeaponTypeValues.Add(GameplayTag::Item_Weapon_Staff, 9);
    default DefenseWeaponTypeValues.Add(GameplayTag::Item_Weapon_Torch_OneHand, 9);

    TMap<FGameplayTag,float> DefenseWeaponTypeValues;

    default DefenseWeaponTypeValues.Add(GameplayTag::Item_Weapon_Fist, 1);
    default DefenseWeaponTypeValues.Add(GameplayTag::Item_Weapon, 2);
    default DefenseWeaponTypeValues.Add(GameplayTag::Item_Weapon_Sword_OneHand, 3);
    default DefenseWeaponTypeValues.Add(GameplayTag::Item_Weapon_Axe_OneHand, 9);
    default DefenseWeaponTypeValues.Add(GameplayTag::Item_Weapon_Mace_OneHand, 5);
    default DefenseWeaponTypeValues.Add(GameplayTag::Item_Weapon_Sword_TwoHand, 6);
    default DefenseWeaponTypeValues.Add(GameplayTag::Item_Weapon_Axe_TwoHand, 9);
    default DefenseWeaponTypeValues.Add(GameplayTag::Item_Weapon_Orc_TwoHand, 7);
    default DefenseWeaponTypeValues.Add(GameplayTag::Item_Weapon_Staff, 9);
    default DefenseWeaponTypeValues.Add(GameplayTag::Item_Weapon_Torch_OneHand, 9);


    TMap<FGameplayTag,float> ArmorTypeValues;
    default ArmorTypeValues.Add(GameplayTag::ArmorMaterial_Flesh, 1);
    default ArmorTypeValues.Add(GameplayTag::ArmorMaterial_Fabric, 2);
    default ArmorTypeValues.Add(GameplayTag::ArmorMaterial_Leather, 3);
    default ArmorTypeValues.Add(GameplayTag::ArmorMaterial_Metal, 4);
    default ArmorTypeValues.Add(GameplayTag::ArmorMaterial_Ore, 5);
    default ArmorTypeValues.Add(GameplayTag::ArmorMaterial_MineCrawler, 6);
}

class UGothicFXDefinition_Impact_Hit_Character_Fire : UGothicFXDefinition_Weapon_Impact_Hit
{
    default EffectTag = GameplayTag::FX_Attack_Hit_Character_Fire;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Fire/SFX_OBJ_Fire_IgniteL_01.SFX_OBJ_Fire_IgniteL_01'";
    default FModEvent.bAttachToInstigator = true;
}

class UGothicFXDefinition_Impact_Hit_Character : UGothicFXDefinition_Weapon_Impact_Hit
{
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Physics/Impacts/Melee/SFX_PHYSICS_Impacts_Melee.SFX_PHYSICS_Impacts_Melee'";
    default EffectTag = GameplayTag::FX_Attack_Hit_Character;

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        if (!IsValid(HitResult.Component))
            return;

        AGothicCharacter InstigatorCharacter = Cast<AGothicCharacter>(Instigator);
        AGothicCharacter TargetCharacter = Cast<AGothicCharacter>(HitResult.Component.Owner);
        FGameplayTagContainer TargetCharacterTags;
        FGameplayTagContainer MaterialTagFilter;
        MaterialTagFilter.AddTag(GameplayTag::ArmorMaterial);

        UInventoryComponent TargetInventory = TargetCharacter.GetInventory();
        TargetCharacter.GetAbilitySystemComponent().GetOwnedGameplayTags(TargetCharacterTags);
        FGameplayTagContainer MaterialTags = TargetCharacterTags.Filter(MaterialTagFilter);
        
        if(!MaterialTags.IsEmpty())
        {
            float ArmorValue = 1.0f;
            for(auto ArmorType : ArmorTypeValues)
            {
                if (MaterialTags.HasTag(ArmorType.Key))
                {
                    ArmorValue = ArmorType.Value;
                    break;
                }
            }
            FModEvent.EventParameters.Add(n"IMP_targetArmor", float32(ArmorValue));
        }
        else if(TargetCharacter.HasGameplayTag(GameplayTag::Species_Creature_Minecrawler))
        {
            FModEvent.EventParameters.Add(n"IMP_targetArmor", 6);
        }
        else if(TargetCharacter.HasGameplayTag(GameplayTag::Species_Creature))
        {
            FModEvent.EventParameters.Add(n"IMP_targetArmor", 1);
        }
        else if (IsValid(TargetInventory))
        {
            auto TargetArmorType = TargetInventory.EquippedArmor;

            if (IsValid(TargetArmorType))
            {
                float ArmorValue = 0.0f;
                for(auto ArmorType : ArmorTypeValues)
                {
                    if (TargetArmorType.HasItemSpec(ArmorType.Key))
                    {
                        ArmorValue = ArmorType.Value;
                        break;
                    }
                }

                FModEvent.EventParameters.Add(n"IMP_targetArmor", float32(ArmorValue));
            }
            else
            {
                FModEvent.EventParameters.Add(n"IMP_targetArmor", 2);
            }
        }

        FGameplayTag AttackWeaponType = GameplayTag::Item_Weapon_Fist;
        float32 AttackWeaponValue = 1.0f;

        if (IsValid(InstigatorCharacter.CarryComponent.EquippedItemDefinition))
        {
            AttackWeaponType = InstigatorCharacter.CarryComponent.EquippedItemDefinition.ItemType;
            if (AttackWeaponTypeValues.Contains(AttackWeaponType))
            {
                AttackWeaponValue = float32(AttackWeaponTypeValues[AttackWeaponType]);
            }
        }


        if (FModEvent.EventParameters.Contains(n"IMP_targetArmor") && FModEvent.EventParameters[n"IMP_targetArmor"] <= 3)
        {
            if(AttackWeaponValue == 3.0f || AttackWeaponValue == 4.0f || AttackWeaponValue == 6.0f || AttackWeaponValue == 7.0f)
            {
                FModEvent.EventParameters.Add(n"IMP_sourceWeapon", 5);
                AttackWeaponValue = 5;
            }
        }
        else if(InstigatorCharacter.HasGameplayTag(GameplayTag::Species_Creature))
        {
            FModEvent.EventParameters.Add(n"IMP_sourceWeapon", 2);
            AttackWeaponValue = 2;
        }
        else
        {
            FModEvent.EventParameters.Add(n"IMP_sourceWeapon", AttackWeaponValue);
        }

        if (FModEvent.EventParameters.Contains(n"IMP_targetArmor") && FModEvent.EventParameters[n"IMP_targetArmor"] <= 3)
        {
            if(AttackWeaponValue == 1)
            {
                FModEvent.EventParameters.FindOrAdd(n"IMP_targetArmor", 1) = 1;
            }
        }
        if(HitResult.PhysMaterial.SurfaceType != EPhysicalSurface::Default)
        {
            InstigatorCharacter.FXComponent.SetMaterialOverride(GameplayTag::FX_Attack_Hit_Impact, HitResult.PhysMaterial);
        }
    }
}

class UGothicFXDefinition_Impact_Hit_Weapon : UGothicFXDefinition_Weapon_Impact_Hit
{
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Physics/Impacts/Melee/SFX_PHYSICS_Impacts_Melee.SFX_PHYSICS_Impacts_Melee'";
    default EffectTag = GameplayTag::FX_Attack_Hit_Character_Parried;

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        if(!IsValid(HitResult.Component))
            return;

        AGothicCharacter InstigatorCharacter = Cast<AGothicCharacter>(Instigator);
        AGothicCharacter TargetCharacter = Cast<AGothicCharacter>(HitResult.Component.Owner);
        FGameplayTag AttackWeaponType = InstigatorCharacter.CarryComponent.EquippedItemDefinition.ItemType;

        if(InstigatorCharacter.HasGameplayTag(GameplayTag::Species_Creature))
        {
            FModEvent.EventParameters.Add(n"IMP_sourceWeapon", 2);

            FGameplayTagContainer AbilityTags;
            InstigatorCharacter.AbilitySystemComponent.GetOwnedGameplayTags(AbilityTags);

            if (AbilityTags.HasTag(GameplayTag::State_Firing))
                return;
        }
        else
        {
            float AttackWeaponValue = 0.0f;
            if (AttackWeaponTypeValues.Find(AttackWeaponType, AttackWeaponValue))
            {
                FModEvent.EventParameters.Add(n"IMP_sourceWeapon", float32(AttackWeaponValue));
            }
        }

        if(TargetCharacter.HasGameplayTag(GameplayTag::Species_Creature))
        {
            FModEvent.EventParameters.Add(n"IMP_targetWeapon", 2);
        }
        else
        {

            auto DefendWeaponType = TargetCharacter.CarryComponent.EquippedItemDefinition.ItemType;
            float DefenWeaponValue = 0.0f;
            if (DefenseWeaponTypeValues.Find(DefendWeaponType, DefenWeaponValue))
            {
                FModEvent.EventParameters.Add(n"IMP_targetWeapon", float32(DefenWeaponValue));
            }
        }

        if(HitResult.PhysMaterial.SurfaceType != EPhysicalSurface::Default)
        {
            InstigatorCharacter.FXComponent.SetMaterialOverride(GameplayTag::FX_Attack_Hit_Impact, HitResult.PhysMaterial);
        }

        if(!IsValid(InstigatorCharacter.CarryComponent.ItemVisual) ||
            !IsValid(TargetCharacter.CarryComponent.ItemVisual))
        {
            ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Block_Fists.P_Block_Fists'";
        }
        else if(InstigatorCharacter.CarryComponent.ItemVisual.WeaponMaterialTag.MatchesTag(GameplayTag::WeaponMaterial_Wood) ||
            TargetCharacter.CarryComponent.ItemVisual.WeaponMaterialTag.MatchesTag(GameplayTag::WeaponMaterial_Wood))
        {
            ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Block_Wood.P_Block_Wood'";
        }
        else
        {
            ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Deflect_Metal.P_Deflect_Metal'";
        }

    }
}

class UGothicFXDefinition_Impact_Hit_Environment : UGothicFXDefinition_Weapon_Impact_Hit
{
    default EffectTag = GameplayTag::FX_Attack_Hit_Environment;

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = nullptr;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Blood) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Deflect_Blood.P_Deflect_Blood'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Corpse) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Deflect_Corpse.P_Deflect_Corpse'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Foliage) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Deflect_Foliage.P_Deflect_Foliage'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Ice) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Deflect_Ice.P_Deflect_Ice'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Mud) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Deflect_Mud.P_Deflect_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Grass) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Deflect_Mud.P_Deflect_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Puddle) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Deflect_Mud.P_Deflect_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Soil) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Deflect_Mud.P_Deflect_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::RockInterior) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Deflect_Rock.P_Deflect_Rock'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::SurfaceType5) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Deflect_Rock.P_Deflect_Rock'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Sand) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Deflect_Sand.P_Deflect_Sand'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Snow) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Deflect_Snow.P_Deflect_Snow'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Water) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Deflect_Water.P_Deflect_Water'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodBridge) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Deflect_Wood.P_Deflect_Wood'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodFloor) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Deflect_Wood.P_Deflect_Wood'";

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        const auto TargetMaterial = HitResult.GetPhysMaterial();
        auto InstigatorCharacter = Cast<AGothicCharacter>(Instigator);

        if(TargetMaterial.SurfaceType != EPhysicalSurface::Default)
        {
            InstigatorCharacter.FXComponent.SetMaterialOverride(GameplayTag::FX_Attack_Hit_Impact, HitResult.PhysMaterial);
        }

        AItemVisual ItemVisual = InstigatorCharacter.CarryComponent.ItemVisual;

        if (ItemVisual == nullptr)
            return;

        if(TargetMaterial.SurfaceType == EPhysicalSurface::Default || HitResult.PhysMaterial.SurfaceType == EPhysicalSurface::Metal)
        {
            if(ItemVisual.WeaponMaterialTag.MatchesTag(GameplayTag::WeaponMaterial_Metal))
            {
                ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Deflect_Metal.P_Deflect_Metal'";
                ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Metal) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Deflect_Metal.P_Deflect_Metal'";
            }
            else if(ItemVisual.WeaponMaterialTag.MatchesTag(GameplayTag::WeaponMaterial_Wood))
            {
                ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Deflect_Wood.P_Deflect_Wood'";
                ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Metal) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/NiagaraSystems/Parry/P_Deflect_Wood.P_Deflect_Wood'";
            }
        }
    }
}

class UGothicFXDefinition_Impact_Hit_Environment_Deflected : UGothicFXDefinition_Impact_Hit_Environment
{
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Physics/Impacts/Melee/SFX_PHYSICS_Impacts_Melee.SFX_PHYSICS_Impacts_Melee'";
    default EffectTag = GameplayTag::FX_Attack_Hit_Environment_Deflected;
    default PreferenceLayer = 2;

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        Super::PrepareFX(Instigator, HitResult);

        const auto TargetMaterial = HitResult.GetPhysMaterial();    
        if(TargetMaterial != nullptr)
        {
            FModEvent.EventParameters.Add(n"IMP_targetMaterial", int(TargetMaterial.SurfaceType));
        }
        else
        {
            FModEvent.EventParameters.Add(n"IMP_targetMaterial", 0);
        }

        auto InstigatorCharacter = Cast<AGothicCharacter>(Instigator);

        if(InstigatorCharacter.HasGameplayTag(GameplayTag::Species_Creature))
        {
            FModEvent.EventParameters.Add(n"IMP_sourceWeapon", 2);
        }
        else
        {

            auto AttackWeaponType = InstigatorCharacter.CarryComponent.EquippedItemDefinition.ItemType;
            float AttackWeaponValue = 0.0f;
            if (AttackWeaponTypeValues.Find(AttackWeaponType, AttackWeaponValue))
            {
                FModEvent.EventParameters.Add(n"IMP_sourceWeapon", float32(AttackWeaponValue));
            }
        }

    }
}
