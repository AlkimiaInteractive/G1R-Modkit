
class UGA_Spell_Transform : UGameplayAbilitySpellTransform
{
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSubclassOf<UGameplayEffect> m_TransformationGameplayEffect = nullptr;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    TSubclassOf<UGameplayEffect> m_ScavengingSkillEffect = UGE_Skill_Scavenging::StaticClass();

    bool m_HasScavengingSkill = false;

    default m_UnTransformMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_Man_UnTransform_Montage.A_Man_UnTransform_Montage'";
    default m_SpawnCreatureDistance = 100.0f;

    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnDefinition;
    }

    UFUNCTION(BlueprintOverride)
    bool OnShouldFinishSpellAfterActivation_Scriptable() 
    {
        return false;
    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner, TSubclassOf<UObject> actorToSpawnClass) const
    {
        const auto creatureDefinition = Cast<USpawnCharacterCanTransformIntoDefinition>(actorToSpawnClass.GetDefaultObject());
        const auto creature = creatureDefinition.GetCharacterClass().GetDefaultObject();
        const auto creatureCapsuleComponent = creature.CapsuleComponent;
        const auto height = creatureCapsuleComponent.CapsuleHalfHeight;
        const auto spawnLocation = owner.GetActorLocation() + owner.ActorForwardVector * m_SpawnCreatureDistance;

        FHitResult hitResult;
        auto result = MagicScript::FindFloorAtLocation(spawnLocation, hitResult, owner, ECollisionChannel::IKTrace);
        if(result)
        {
            return hitResult.ImpactPoint + FVector::UpVector * (height + 1); //Adding 1cm up to avoid flat ground
        }

        return spawnLocation;
    }

    UFUNCTION(BlueprintOverride)
    FRotator GetSpawnRotationServer_Scriptable(AGothicCharacter owner, TSubclassOf<UObject> actorToSpawnClass) const
    {
        return owner.GetActorRotation();
    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned)
    {
        auto toTransformCharacter = Cast<AGothicCharacter>(ActorSpawned);
        auto instigatorCharacter = Cast<AGothicPlayerCharacter>(GetActorInfo().GetAvatarActor());
        PlayEffects(toTransformCharacter, instigatorCharacter);
    }

    const float WitnessSearchRadius = 6000.0f;

    /** For every character in radius that currently senses the caster, records Memory_WitnessedTransformation so they stay friendly to the transformed creature. */
    void RecordWitnessedTransformationForCharactersSensingCaster(AGothicCharacter caster, AGothicCharacter transformedCharacter)
    {
        if (!IsValid(caster) || !IsValid(caster.CharacterState) || !IsValid(transformedCharacter))
            return;
        AGothicCharacterState CasterState = caster.CharacterState;
        auto Nearby = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius(AGothicCharacter::StaticClass(), caster.ActorLocation, WitnessSearchRadius);
        for (auto Actor : Nearby)
        {
            auto Witness = Cast<AGothicCharacter>(Actor);
            if (!IsValid(Witness) || Witness == caster || Witness == transformedCharacter)
                continue;
            if (!IsValid(Witness.CharacterState) || !IsValid(Witness.CharacterState.LongTermMemory))
                continue;
            if (Witness.IsPlayerCharacterOrPlayerControlled())
                continue;
            auto Sensed = Witness.Perception.GetSensedLivingCharacters();
            if (Sensed.Contains(caster))
            {
                Witness.CharacterState.LongTermMemory.MemorizeActionAgainstCharacter(
                    GameplayTag::Memory_WitnessedTransformation,
                    Witness.CharacterState,
                    CasterState
                );
            }
        }
    }

    UFUNCTION()
    void PlayEffects(AGothicCharacter transformedCharacter, AGothicPlayerCharacter instigatorCharacter)
    {
        auto instigatorTransformedAbComp = instigatorCharacter.GetAbilitySystemComponent();
        //In case the player who is transforming is burning, better remove the debuff otherwise will be unpredictable.
        QuickApplyGEToTarget(instigatorTransformedAbComp, UGE_BurnRemoval::StaticClass());

        auto transformedAbComp = transformedCharacter.GetAbilitySystemComponent();
        
        // Give "witnessed transformation" memory to every NPC who currently senses the caster (Hero), so they stay friendly to the wolf. Done here so the memory exists before they evaluate the wolf.
        RecordWitnessedTransformationForCharactersSensingCaster(instigatorCharacter, transformedCharacter);
        
        if(m_HasScavengingSkill)
            QuickApplyGEToTarget(transformedAbComp, m_ScavengingSkillEffect);
    
        if(IsValid(m_TransformationGameplayEffect))
        {
            //specific for creature effect
            //This effect adds to the transormed tha abilities for instance normal wolf has. Also, specific abilities transformed creature need.
            //For instance normal wolf can not jump, but transformed wolf can jump. 
            QuickApplyGEToTarget(transformedAbComp, m_TransformationGameplayEffect);
        }
    }
}

class UGA_Spell_Transform_Meatbug : UGA_Spell_Transform
{
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Meatbug::StaticClass();
	default m_TransformationGameplayEffect = UGE_Meatbug_Player::StaticClass();
}

class UGA_Spell_Transform_Scavenger_Medium : UGA_Spell_Transform
{
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_ScavengerMedium::StaticClass();
	default m_TransformationGameplayEffect = UGE_Scavenger_Medium_Player::StaticClass();
}

class UGA_Spell_Transform_Molerat : UGA_Spell_Transform
{
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Molerat::StaticClass();
	default m_TransformationGameplayEffect = UGE_Molerat_Player::StaticClass();
}

class UGA_Spell_Transform_Bloodfly : UGA_Spell_Transform
{
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Bloodfly::StaticClass();
	default m_TransformationGameplayEffect = UGE_Bloodfly_Player::StaticClass();
}

class UGA_Spell_Transform_Wolf : UGA_Spell_Transform
{
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Wolf::StaticClass();
	default m_TransformationGameplayEffect = UGE_Wolf_Player::StaticClass();
    default m_HasScavengingSkill = true;   
}

class UGA_Spell_Transform_Lizard : UGA_Spell_Transform
{
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Lizard::StaticClass();
	default m_TransformationGameplayEffect = UGE_Lizard_Player::StaticClass();
}

class UGA_Spell_Transform_Lurker : UGA_Spell_Transform
{
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Lurker::StaticClass();
	default m_TransformationGameplayEffect = UGE_Lurker_Player::StaticClass();
}

class UGA_Spell_Transform_OrcDog : UGA_Spell_Transform
{
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_OrcDog::StaticClass();
	default m_TransformationGameplayEffect = UGE_OrcDog_Player::StaticClass();
}

class UGA_Spell_Transform_Minecrawler : UGA_Spell_Transform
{
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Minecrawler::StaticClass();
	default m_TransformationGameplayEffect = UGE_Minecrawler_Player::StaticClass();
}

class UGA_Spell_Transform_Snapper : UGA_Spell_Transform
{
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Snapper::StaticClass();
	default m_TransformationGameplayEffect = UGE_Snapper_Player::StaticClass();
}

class UGA_Spell_Transform_Shadowbeast : UGA_Spell_Transform
{
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_ShadowBeast::StaticClass();
	default m_TransformationGameplayEffect = UGE_ShadowBeast_Player::StaticClass();
}

class UGA_Spell_Transform_Biter : UGA_Spell_Transform
{
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Biter::StaticClass();
	default m_TransformationGameplayEffect = UGE_Biter_Player::StaticClass();
}

class UGA_Spell_Transform_Razor : UGA_Spell_Transform
{
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Razor::StaticClass();
	default m_TransformationGameplayEffect = UGE_Razor_Player::StaticClass();
}

class UGA_Spell_Transform_Bloodhound : UGA_Spell_Transform
{
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Bloodhound::StaticClass();
	default m_TransformationGameplayEffect = UGE_Bloodhound_Player::StaticClass();
}

class UGA_Spell_Transform_FireLizard : UGA_Spell_Transform
{
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_FireLizard::StaticClass();
	default m_TransformationGameplayEffect = UGE_Lizard_Player::StaticClass();
}

class UGA_Spell_Transform_Harpy : UGA_Spell_Transform
{
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Harpy::StaticClass();
	default m_TransformationGameplayEffect = UGE_Harpy_Player::StaticClass();
}

class UGA_Spell_Transform_Swampshark : UGA_Spell_Transform
{
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Swampshark::StaticClass();
	default m_TransformationGameplayEffect = UGE_Swampshark_Player::StaticClass();
}