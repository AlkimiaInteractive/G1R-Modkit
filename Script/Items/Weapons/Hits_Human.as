UCLASS()
class UHitData_Human : UHitData 
{
    default m_NeedsDeath = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Exhausted/A_Man_Exahusted_Pose02_In_Montage.A_Man_Exahusted_Pose02_In_Montage'";

    // LIGHT BLOCKING
    UFUNCTION()
    void AddLightBlockingHit(FGameplayTag Direction, FName MontageReference)
    {
        FGameplayTagContainer Metadata_light_block;
        Metadata_light_block.AddTag(GameplayTag::Combat_HitType_Light);
        Metadata_light_block.AddTag(GameplayTag::Combat_BlockState_Block);

        Metadata_light_block.AddTag(Direction);
        AddHit(Metadata_light_block, MontageReference);
    }

    // LIGHT NO BLOCKING
    UFUNCTION()
    void AddLightNonblockingHit(FGameplayTag Direction, FName MontageReference)
    {
        FGameplayTagContainer Metadata_light_Nonblock;
        Metadata_light_Nonblock.AddTag(GameplayTag::Combat_HitType_Light);
        Metadata_light_Nonblock.AddTag(GameplayTag::Combat_BlockState_Idle);

        Metadata_light_Nonblock.AddTag(Direction);
        AddHit(Metadata_light_Nonblock, MontageReference);
    }

    // BLOCKED
    UFUNCTION()
    void AddHitDeflected(FGameplayTag HitDirection, FGameplayTag AttackDirection, FName MontageReference)
    {
        FGameplayTagContainer Metadata_deflected;
        Metadata_deflected.AddTag(GameplayTag::Combat_HitType_Deflected);
        Metadata_deflected.AddTag(GameplayTag::Combat_BlockState_Block);

        Metadata_deflected.AddTag(HitDirection);
        Metadata_deflected.AddTag(AttackDirection);
        AddHit(Metadata_deflected, MontageReference);
    }

    // ADDITIVE
    UFUNCTION()
    void AddAdditiveHit(FGameplayTag Direction, FName MontageReference)
    {
        FGameplayTagContainer Metadata_additive;
        Metadata_additive.AddTag(GameplayTag::Combat_HitType_Additive);
        Metadata_additive.AddTag(GameplayTag::Combat_BlockState_Idle);

        Metadata_additive.AddTag(Direction);
        AddHit(Metadata_additive, MontageReference);
    }

    UFUNCTION()
    void AddActionAdditiveHit(FGameplayTag Direction, FName MontageReference)
    {
        FGameplayTagContainer Metadata_additive;
        Metadata_additive.AddTag(GameplayTag::Combat_HitType_Additive);
        Metadata_additive.AddTag(GameplayTag::Combat_BlockState_Idle);
        Metadata_additive.AddTag(GameplayTag::State_Attack);

        Metadata_additive.AddTag(Direction);
        AddHit(Metadata_additive, MontageReference);
    }

    UFUNCTION()
    void AddAdditiveHitCrouched(FGameplayTag Direction, FName MontageReference)
    {
        FGameplayTagContainer Metadata_additive;
        Metadata_additive.AddTag(GameplayTag::Combat_HitType_Additive);
        Metadata_additive.AddTag(GameplayTag::State_Movement_Crouching);
        Metadata_additive.AddTag(GameplayTag::Combat_BlockState_Idle);

        Metadata_additive.AddTag(Direction);
        AddHit(Metadata_additive, MontageReference);
    }

    ////// STANDARD
    //This is to make it easier to set the superarmor hits
    FName HitSupAr_RH_F = n"";
    FName HitSupAr_RH_B = n"";
    FName HitSupAr_RH_L = n"";
    FName HitSupAr_RH_R = n"";

    FName HitSupAr_LH_F = n"";
    FName HitSupAr_LH_B = n"";
    FName HitSupAr_LH_L = n"";
    FName HitSupAr_LH_R = n"";

    UFUNCTION()
    void AddStandardHit(FGameplayTag HitDirection, FGameplayTag PoseDirection, FName MontageReference)
    {
        FGameplayTagContainer Metadata_hit_standard;
        Metadata_hit_standard.AddTag(GameplayTag::Combat_HitType_Standard);
        Metadata_hit_standard.AddTag(GameplayTag::Combat_BlockState_Idle);

        Metadata_hit_standard.AddTag(HitDirection);
        Metadata_hit_standard.AddTag(PoseDirection);
        AddHit( Metadata_hit_standard, MontageReference);
    }

    // KNOCKBACK
    UFUNCTION()
    void AddKnockback(FGameplayTag Direction, FName MontageReference)
    {
        FGameplayTagContainer Metadata_hit_knockback;
        Metadata_hit_knockback.AddTag(GameplayTag::Combat_HitType_Knockback);

        Metadata_hit_knockback.AddTag(Direction);
        AddHit(Metadata_hit_knockback, MontageReference);
    }

    // BLOCK BREAK
    UFUNCTION()
    void AddBlockBreak(FGameplayTag Direction, FName MontageReference)
    {
        FGameplayTagContainer Metadata_hit_block_standard;
        Metadata_hit_block_standard.AddTag(GameplayTag::Combat_Pose_Idle);
        Metadata_hit_block_standard.AddTag(GameplayTag::Combat_HitType_Standard);
        Metadata_hit_block_standard.AddTag(GameplayTag::Combat_BlockState_Block);

        Metadata_hit_block_standard.AddTag(Direction);
        AddHit(Metadata_hit_block_standard, MontageReference);
    }

    // RIPOSTE
    UFUNCTION()
    void AddRiposte(FGameplayTag CharacterSize, FGameplayTag OtherCharacterWeapon, FName MontageReference)
    {
        FGameplayTagContainer Metadata_Riposte;
        Metadata_Riposte.AddTag(GameplayTag::Combat_HitType_Riposte);

        if (CharacterSize.IsValid())
        {
            Metadata_Riposte.AddTag(CharacterSize);
        }

        if (OtherCharacterWeapon.IsValid())
        {
            Metadata_Riposte.AddTag(OtherCharacterWeapon);
        }
        
        AddHit( Metadata_Riposte, MontageReference);
    }

    // DEFEATED
    UFUNCTION()
    void AddDefeatedMontages(FGameplayTag Direction, FName HitMontageReference, FName StandUpMontageReference, FName LoopMontageReference, FName DeathMontageReference)
    {
        FGameplayTagContainer Metadata_defeated;
        Metadata_defeated.AddTag(Direction);

        AddDefeatedHitMontage(Metadata_defeated, HitMontageReference);
        AddDefeatedStandUpMontage(Metadata_defeated, StandUpMontageReference);
        AddDefeatedLoopMontage(Metadata_defeated, LoopMontageReference);
        AddDeathFromDefeatedMontage(Metadata_defeated, DeathMontageReference);
    }

    UFUNCTION()
    void AddDefeatedInMontageWithDirection(FGameplayTag Direction, FName DefeatedInMontageReference)
    {
        FGameplayTagContainer Metadata_defeated;
        Metadata_defeated.AddTag(Direction);

        AddDefeatedHitMontage(Metadata_defeated, DefeatedInMontageReference);
    }

    UFUNCTION()
    void AddDefeatedInMontageArrayWithDirection(FGameplayTag Direction, TArray<FName> DefeatedInMontageReferences)
    {
        FGameplayTagContainer Metadata_defeated;
        Metadata_defeated.AddTag(Direction);

        for (auto DefeatedInMontage : DefeatedInMontageReferences)
        {
            AddDefeatedHitMontage(Metadata_defeated, DefeatedInMontage);
        }
    }

    UFUNCTION()
    void AddDefeatedStandUpMontageInAllDirections(FName StandUpMontageReference)
    {
        FGameplayTagContainer Metadata_defeated_B;
        Metadata_defeated_B.AddTag(GameplayTag::Combat_Direction_Back);
        AddDefeatedStandUpMontage(Metadata_defeated_B, StandUpMontageReference);

        FGameplayTagContainer Metadata_defeated_F;
        Metadata_defeated_F.AddTag(GameplayTag::Combat_Direction_Front);
        AddDefeatedStandUpMontage(Metadata_defeated_F, StandUpMontageReference);

        FGameplayTagContainer Metadata_defeated_L;
        Metadata_defeated_L.AddTag(GameplayTag::Combat_Direction_Left);
        AddDefeatedStandUpMontage(Metadata_defeated_L, StandUpMontageReference);

        FGameplayTagContainer Metadata_defeated_R;
        Metadata_defeated_R.AddTag(GameplayTag::Combat_Direction_Right);
        AddDefeatedStandUpMontage(Metadata_defeated_R, StandUpMontageReference);

        FGameplayTagContainer Metadata_defeated_U;
        Metadata_defeated_U.AddTag(GameplayTag::Combat_Direction_Undirectional);
        AddDefeatedStandUpMontage(Metadata_defeated_U, StandUpMontageReference);
    }

    UFUNCTION()
    void AddDefeatedLoopMontageInAllDirections(FName LoopMontageReference)
    {
        FGameplayTagContainer Metadata_defeated_B;
        Metadata_defeated_B.AddTag(GameplayTag::Combat_Direction_Back);
        AddDefeatedLoopMontage(Metadata_defeated_B, LoopMontageReference);

        FGameplayTagContainer Metadata_defeated_F;
        Metadata_defeated_F.AddTag(GameplayTag::Combat_Direction_Front);
        AddDefeatedLoopMontage(Metadata_defeated_F, LoopMontageReference);

        FGameplayTagContainer Metadata_defeated_L;
        Metadata_defeated_L.AddTag(GameplayTag::Combat_Direction_Left);
        AddDefeatedLoopMontage(Metadata_defeated_L, LoopMontageReference);

        FGameplayTagContainer Metadata_defeated_R;
        Metadata_defeated_R.AddTag(GameplayTag::Combat_Direction_Right);
        AddDefeatedLoopMontage(Metadata_defeated_R, LoopMontageReference);

        FGameplayTagContainer Metadata_defeated_U;
        Metadata_defeated_U.AddTag(GameplayTag::Combat_Direction_Undirectional);
        AddDefeatedLoopMontage(Metadata_defeated_U, LoopMontageReference);
    }

    UFUNCTION()
    void AddDefeatedDeathMontageInAllDirections(FName DefeatedDeathMontage)
    {
        FGameplayTagContainer Metadata_defeated_B;
        Metadata_defeated_B.AddTag(GameplayTag::Combat_Direction_Back);
        AddDeathFromDefeatedMontage(Metadata_defeated_B, DefeatedDeathMontage);

        FGameplayTagContainer Metadata_defeated_F;
        Metadata_defeated_F.AddTag(GameplayTag::Combat_Direction_Front);
        AddDeathFromDefeatedMontage(Metadata_defeated_F, DefeatedDeathMontage);

        FGameplayTagContainer Metadata_defeated_L;
        Metadata_defeated_L.AddTag(GameplayTag::Combat_Direction_Left);
        AddDeathFromDefeatedMontage(Metadata_defeated_L, DefeatedDeathMontage);

        FGameplayTagContainer Metadata_defeated_R;
        Metadata_defeated_R.AddTag(GameplayTag::Combat_Direction_Right);
        AddDeathFromDefeatedMontage(Metadata_defeated_R, DefeatedDeathMontage);

        FGameplayTagContainer Metadata_defeated_U;
        Metadata_defeated_U.AddTag(GameplayTag::Combat_Direction_Undirectional);
        AddDeathFromDefeatedMontage(Metadata_defeated_U, DefeatedDeathMontage);
    }

    UFUNCTION()
    void AddDefeatedStandUpMontageArrayInAllDirections(TArray<FName> StandUpMontageReferences)
    {
        FGameplayTagContainer Metadata_defeated_B;
        Metadata_defeated_B.AddTag(GameplayTag::Combat_Direction_Back);

        FGameplayTagContainer Metadata_defeated_F;
        Metadata_defeated_F.AddTag(GameplayTag::Combat_Direction_Front);

        FGameplayTagContainer Metadata_defeated_L;
        Metadata_defeated_L.AddTag(GameplayTag::Combat_Direction_Left);

        FGameplayTagContainer Metadata_defeated_R;
        Metadata_defeated_R.AddTag(GameplayTag::Combat_Direction_Right);

        FGameplayTagContainer Metadata_defeated_U;
        Metadata_defeated_U.AddTag(GameplayTag::Combat_Direction_Undirectional);

        for (auto StandUpMontageReference : StandUpMontageReferences)
        {
            AddDefeatedStandUpMontage(Metadata_defeated_B, StandUpMontageReference);
            AddDefeatedStandUpMontage(Metadata_defeated_F, StandUpMontageReference);
            AddDefeatedStandUpMontage(Metadata_defeated_L, StandUpMontageReference);
            AddDefeatedStandUpMontage(Metadata_defeated_R, StandUpMontageReference);
            AddDefeatedStandUpMontage(Metadata_defeated_U, StandUpMontageReference);
        }
    }

    UFUNCTION()
    void AddDefeatedLoopMontageArrayInAllDirections(TArray<FName> LoopMontageReferences)
    {
        FGameplayTagContainer Metadata_defeated_B;
        Metadata_defeated_B.AddTag(GameplayTag::Combat_Direction_Back);

        FGameplayTagContainer Metadata_defeated_F;
        Metadata_defeated_F.AddTag(GameplayTag::Combat_Direction_Front);

        FGameplayTagContainer Metadata_defeated_L;
        Metadata_defeated_L.AddTag(GameplayTag::Combat_Direction_Left);

        FGameplayTagContainer Metadata_defeated_R;
        Metadata_defeated_R.AddTag(GameplayTag::Combat_Direction_Right);

        FGameplayTagContainer Metadata_defeated_U;
        Metadata_defeated_U.AddTag(GameplayTag::Combat_Direction_Undirectional);

        for (auto LoopMontageReference : LoopMontageReferences)
        {
            AddDefeatedLoopMontage(Metadata_defeated_B, LoopMontageReference);
            AddDefeatedLoopMontage(Metadata_defeated_F, LoopMontageReference);
            AddDefeatedLoopMontage(Metadata_defeated_L, LoopMontageReference);
            AddDefeatedLoopMontage(Metadata_defeated_R, LoopMontageReference);
            AddDefeatedLoopMontage(Metadata_defeated_U, LoopMontageReference);
        }
    }

    UFUNCTION()
    void AddDefeatedDeathMontageArrayInAllDirections(TArray<FName> DefeatedDeathMontages)
    {
        FGameplayTagContainer Metadata_defeated_B;
        Metadata_defeated_B.AddTag(GameplayTag::Combat_Direction_Back);

        FGameplayTagContainer Metadata_defeated_F;
        Metadata_defeated_F.AddTag(GameplayTag::Combat_Direction_Front);

        FGameplayTagContainer Metadata_defeated_L;
        Metadata_defeated_L.AddTag(GameplayTag::Combat_Direction_Left);

        FGameplayTagContainer Metadata_defeated_R;
        Metadata_defeated_R.AddTag(GameplayTag::Combat_Direction_Right);

        FGameplayTagContainer Metadata_defeated_U;
        Metadata_defeated_U.AddTag(GameplayTag::Combat_Direction_Undirectional);

        for (auto DefeatedDeathMontage : DefeatedDeathMontages)
        {
            AddDeathFromDefeatedMontage(Metadata_defeated_B, DefeatedDeathMontage);
            AddDeathFromDefeatedMontage(Metadata_defeated_F, DefeatedDeathMontage);
            AddDeathFromDefeatedMontage(Metadata_defeated_L, DefeatedDeathMontage);
            AddDeathFromDefeatedMontage(Metadata_defeated_R, DefeatedDeathMontage);
            AddDeathFromDefeatedMontage(Metadata_defeated_U, DefeatedDeathMontage);
        }
    }
};