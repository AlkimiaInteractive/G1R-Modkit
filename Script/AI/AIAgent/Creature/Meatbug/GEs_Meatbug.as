
UCLASS()
class UGE_Meatbug : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Cant_Swim);

    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());
    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());

    default RemoveAbility(UGameplayAbilityRagdoll::StaticClass());
}

UCLASS()
class UGE_Meatbug_AI : UGE_Meatbug
{
    default AddAbility(UGameplayAbilityPick::StaticClass());

    default RemoveAbility(UGA_Death::StaticClass());
    default AddAbility(UGA_Death_Meatbug::StaticClass());
}

UCLASS()
class UGA_Death_Meatbug : UGA_Death
{
    UPROPERTY()
    TSoftObjectPtr<UNiagaraSystem> ParticleSystem = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Meatbug_Splat/P_BloodSplat_Meatbug_NS.P_BloodSplat_Meatbug_NS'";

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(const FGameplayAbilityActorInfo& GAActorInfo, const FGameplayEventData& TriggerEventData)
    {
        auto Character = Cast<AGothicCharacter>(AvatarActorFromActorInfo);
        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(Character);

        if(targetAbComp.HasGameplayTag(GameplayTag::State_Drown))
            return;
        
        if (!targetAbComp.HasGameplayTag(GameplayTag::State_Dead))
        {
            Niagara::SpawnSystemAtLocation(ParticleSystem.Get(), Character.GetActorLocation(), Character.GetActorRotation());
        }

        TArray<UActorComponent> ActorComponent = Character.GetComponentsByClass(USkeletalMeshComponent::StaticClass());
		for (auto Component : ActorComponent)
		{
			if (Component.Name == "CharacterMesh0")
			{
				USkeletalMeshComponent Skeletal = Cast<USkeletalMeshComponent>(Component);
				Skeletal.SetVisibility(false);
				break;
			}
		}

		ActorComponent = Character.GetComponentsByClass(UStaticMeshComponent::StaticClass());
		for (auto Component : ActorComponent)
		{
			if (Component.Name == "DeathMesh")
			{
				UStaticMeshComponent StaticMesh = Cast<UStaticMeshComponent>(Component);
				StaticMesh.SetVisibility(true);
				break;
			}
		}

		if (Character.CapsuleComponent != nullptr)
			 Character.CapsuleComponent.SetCollisionProfileName(FName("Ragdoll"));
    }
}

UCLASS()
class UGE_Meatbug_Player : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Transformed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Menu_ManagementBlock);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Cant_Swim);
    
    default AddAbility(UGA_UnTransform_Meatbug::StaticClass(), EAbilityInputID::Possess);
	default AddAbility(UGameplayAbilityJump::StaticClass(), EAbilityInputID::JumpAction);
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintAction);
    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);
    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
    default AddAbility(UGA_Death_Meatbug::StaticClass());
    default RemoveAbility(UGA_Death);
}