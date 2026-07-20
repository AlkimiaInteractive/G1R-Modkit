
class UGA_UnTransform : UGameplayAbilityUnTransform
{
    default ActivationOwnedTags.AddTag(GameplayTag::State_UnTransforming);
    default m_CameraBehaviour = GetCameraBehaviourSpellUnTransform();

    default CooldownGameplayEffectClass = UGE_UnTransformCooldown::StaticClass();

    FActiveGameplayEffectHandle m_UnTransformEffectHandle;
    FActiveGameplayEffectHandle m_UnTransformVisualsEffectHandle;
     
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSubclassOf<UGameplayEffect> m_TransformedEffect = UGE_UnTransform::StaticClass();

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSubclassOf<UGameplayEffect> m_TransformVisualsEffect = UGE_UnTransformVisuals::StaticClass();
    
    

    UFUNCTION(BlueprintOverride)
    void OnActivateSpellServer_Scriptable()
    {
        //Called when untransform ability activates
        const auto character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        if(character == nullptr)
        { 
            return;
        }
        auto abComp = character.GetAbilitySystemComponent();
        
        m_UnTransformVisualsEffectHandle = abComp.ApplyGameplayEffectToSelf(m_TransformVisualsEffect, 0, abComp.MakeEffectContext());
    }

    UFUNCTION(BlueprintOverride)
    void OnUnTransformSpellServer_Scriptable()
    {
        //Called when untranform hold input is released
        const auto character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        if(character == nullptr)
        { 
            return;
        }
        auto abComp = character.GetAbilitySystemComponent();
        
       m_UnTransformEffectHandle = abComp.ApplyGameplayEffectToSelf(m_TransformedEffect, 0, abComp.MakeEffectContext());
    }

    UFUNCTION(BlueprintOverride)
    void OnCancelSpellServer_Scriptable()
    {
        //Called when untranform hold input is released
        RemoveActiveGameplayEffects();
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility(bool bWasCancelled)
    {
       RemoveActiveGameplayEffects();
    }

    void RemoveActiveGameplayEffects()
    {
        const auto character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        if(character == nullptr)
        { 
            return;
        }
        auto abComp = character.GetAbilitySystemComponent();
        
        abComp.RemoveActiveGameplayEffect(m_UnTransformVisualsEffectHandle);
        abComp.RemoveActiveGameplayEffect(m_UnTransformEffectHandle);
    }
}

class UGA_UnTransform_Biter : UGA_UnTransform
{
    default m_TransformedEffect = UGE_UnTransform_Biter::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Biter::StaticClass();
    default m_CameraBehaviour = GetCameraBehaviourSpellUnTransform_Biter();
}

class UGA_UnTransform_Bloodfly : UGA_UnTransform
{
    default m_TransformedEffect = UGE_UnTransform_Bloodfly::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Bloodfly::StaticClass();
    default m_CameraBehaviour = GetCameraBehaviourSpellUnTransform_Bloodfly();
}

class UGA_UnTransform_Bloodhound : UGA_UnTransform
{
    default m_TransformedEffect = UGE_UnTransform_Bloodhound::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Bloodhound::StaticClass();
}

class UGA_UnTransform_FireLizard : UGA_UnTransform
{
    default m_TransformedEffect = UGE_UnTransform_FireLizard::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_FireLizard::StaticClass();
}

class UGA_UnTransform_Harpy : UGA_UnTransform
{
    default m_TransformedEffect = UGE_UnTransform_Harpy::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Harpy::StaticClass();
    default m_CameraBehaviour = GetCameraBehaviourSpellUnTransform_Medium();
}

class UGA_UnTransform_Lizard : UGA_UnTransform
{
    default m_TransformedEffect = UGE_UnTransform_Lizard::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Lizard::StaticClass();
}

class UGA_UnTransform_Lurker : UGA_UnTransform
{
    default m_TransformedEffect = UGE_UnTransform_Lurker::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Lurker::StaticClass();
}

class UGA_UnTransform_Meatbug : UGA_UnTransform
{
    default m_TransformedEffect = UGE_UnTransform_Meatbug::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Meatbug::StaticClass();
    default m_CameraBehaviour = GetCameraBehaviourSpellUnTransform_Meatbug();
}

class UGA_UnTransform_Minecrawler : UGA_UnTransform
{
    default m_TransformedEffect = UGE_UnTransform_Minecrawler::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Minecrawler::StaticClass();
    default m_CameraBehaviour = GetCameraBehaviourSpellUnTransform_Medium();
}

class UGA_UnTransform_Molerat : UGA_UnTransform
{
    default m_TransformedEffect = UGE_UnTransform_Molerat::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Molerat::StaticClass();
    default m_CameraBehaviour = GetCameraBehaviourSpellUnTransform_Molerat();
}

class UGA_UnTransform_OrcDog : UGA_UnTransform
{
    default m_TransformedEffect = UGE_UnTransform_OrcDog::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_OrcDog::StaticClass();
}

class UGA_UnTransform_Razor : UGA_UnTransform
{
    default m_TransformedEffect = UGE_UnTransform_Razor::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Razor::StaticClass();
}

class UGA_UnTransform_ScavengerMedium : UGA_UnTransform
{
    default m_TransformedEffect = UGE_UnTransform_ScavengerMedium::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_ScavengerMedium::StaticClass();
    default m_CameraBehaviour = GetCameraBehaviourSpellUnTransform_Scavenger();
}

class UGA_UnTransform_ShadowBeast : UGA_UnTransform
{
    default m_TransformedEffect = UGE_UnTransform_Shadowbeast::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_ShadowBeast::StaticClass();
    default m_CameraBehaviour = GetCameraBehaviourSpellUnTransform_Shadowbeast();
}

class UGA_UnTransform_Snapper : UGA_UnTransform
{
    default m_TransformedEffect = UGE_UnTransform_Snapper::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Snapper::StaticClass();
    default m_CameraBehaviour = GetCameraBehaviourSpellUnTransform_Snapper();
}

class UGA_UnTransform_Swampshark : UGA_UnTransform
{
    default m_TransformedEffect = UGE_UnTransform_Swampshark::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Swampshark::StaticClass();
    default m_CameraBehaviour = GetCameraBehaviourSpellUnTransform_Swampshark();
}

class UGA_UnTransform_Wolf : UGA_UnTransform
{
    default m_TransformedEffect = UGE_UnTransform_Wolf::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Wolf::StaticClass();
    default m_CameraBehaviour = GetCameraBehaviourSpellUnTransform_Wolf();
}
