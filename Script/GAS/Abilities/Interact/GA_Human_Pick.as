class UGA_Human_Pick : UGameplayAbilityPick
{
    UPROPERTY()
    TSoftObjectPtr<UNiagaraSystem> Dust = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/CharacterFX/Item_Picking/P_Pick_Dust.P_Pick_Dust'";
    UPROPERTY()
    TSoftObjectPtr<UNiagaraSystem> Herb = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/CharacterFX/Item_Picking/P_Pick_Herb.P_Pick_Herb'";
    UPROPERTY()
    TSoftObjectPtr<UNiagaraSystem> Water = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/CharacterFX/Item_Picking/P_Pick_Water.P_Pick_Water'";
    UPROPERTY()
    TMap<FGameplayTag, TSoftObjectPtr<UNiagaraSystem>> ParticleSystems;
       
    default ParticleSystems.Add(GameplayTag::FX_Pick_Herb, Herb);
    default ParticleSystems.Add(GameplayTag::FX_Pick_Dust, Dust);
    default ParticleSystems.Add(GameplayTag::FX_Pick_Water, Water);

    default m_AnimationPlayRate = 1.0f;

    UPROPERTY() TSoftObjectPtr<UAnimMontage> UrizielMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Man_TakeUriziel_Montage.Man_TakeUriziel_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> FocusMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Deactivate_Barrier/Man_DeactivateFocusBarrier_02_Montage.Man_DeactivateFocusBarrier_02_Montage'";

    UFUNCTION(BlueprintOverride)
    UAnimMontage GetPickSpecialMontage(TSubclassOf<UItemDefinition>& itemDefinition)
    {
        if(itemDefinition == UItMw_2H_Sword_Uriziel_01::StaticClass())
        {
            return UrizielMontage.Get();
        }
        else if(itemDefinition == UItMs_Focus_01::StaticClass() || 
            itemDefinition == UItMs_Focus_02::StaticClass() || 
            itemDefinition == UItMs_Focus_03::StaticClass() || 
            itemDefinition == UItMs_Focus_04::StaticClass())
        {
            return FocusMontage.Get();
        }
        return nullptr;
    }

    UFUNCTION(BlueprintOverride)
    UNiagaraSystem GetPickNiagara(bool isUnderwater, const FGameplayTag gameplayTag) const
    {
         FGameplayTag tagToUse = gameplayTag;
        if(isUnderwater)
        {
            tagToUse = GameplayTag::FX_Pick_Water;
        }
        return ParticleSystems[tagToUse].Get();
    }
}

