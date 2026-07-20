class UGA_CastSpell_Transform_Base : UGameplayAbilityCastTransform
{
   UPROPERTY()
   TSoftObjectPtr<UAnimMontage> m_ScrollFailureMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_Scroll_Transform_Failure_Montage.A_Scroll_Transform_Failure_Montage'";
   UPROPERTY()
   TSoftObjectPtr<UAnimMontage> m_ScrollMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_Scroll_Transform_Montage.A_Scroll_Transform_Montage'";
   UPROPERTY()
   TSoftObjectPtr<UAnimMontage> m_ScrollCloseMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_Scroll_Transform_Out_Montage.A_Scroll_Transform_Out_Montage'";
   
   default m_GE_Mana = UGE_ManaBurn::StaticClass();
   default m_ExecutionValidator = UCastSpellExecutionValidatorDefault::StaticClass();
   default m_SpawnCreatureDistance = 100.0f;

   default CooldownGameplayEffectClass = UGE_CastTransformCooldown::StaticClass();

   UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSubclassOf<UGameplayEffect> m_CastTransformEffect = UGE_CastTransform::StaticClass();

   UPROPERTY()
   FActiveGameplayEffectHandle m_CastTransformEffectHandle;
   UPROPERTY()
   UDelegateHandleContainer m_CastTransformEventHandle = nullptr;

   UFUNCTION(BlueprintOverride)
   void OnActivateCastSpellServer_Scriptable(const UAnimMontage castMontage)
   {
      PlayScrollAnimationSyncWithMulticast(m_ScrollMontage.Get(), castMontage);
      RegisterGameplayCastTransformEvent();
   }
   
   UFUNCTION()
   void OnCastTransform()
   {
      const auto character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()); 
      auto transformedAbComp = character.GetAbilitySystemComponent();  
      m_CastTransformEffectHandle = QuickApplyGEToTarget(transformedAbComp, m_CastTransformEffect);
      UnRegisterGameplayCastTransformEvent();
   }

   UFUNCTION(BlueprintOverride)
   void OnEndCastSpellServer_Scriptable(bool WasCancelled)
   {
      RemoveGameplayEffectFromOwnerWithHandle(m_CastTransformEffectHandle);
      UnRegisterGameplayCastTransformEvent();
   }

   UFUNCTION(BlueprintOverride)
   void PlayLaunchSpell_Scriptable()
   {
      FGameplayEventData Payload;
      GothicGAS::SendGameplayEvent(GetAvatarActorFromActorInfo(), GameplayTag::Event_Spell_Transform_Begin, Payload);
      PlayCastMontage(n"Launch", false);
   }

   UFUNCTION(BlueprintOverride)
   void OnPlayCancelCastMontage_Scriptable(const UAnimMontage cancelMontage)
   {
      if(HasAuthority())
         PlayScrollAnimationSyncWithMulticast(m_ScrollCloseMontage.Get(), cancelMontage);
   }

   UFUNCTION(BlueprintOverride)
   void OnPlayFailCastMontage_Scriptable()
   {
      GetScrollComponent().SetIsCastFail();
      PlayScrollAnimation(m_ScrollFailureMontage.Get());
   }

   UFUNCTION(BlueprintOverride)
   float GetCastDuration_Scriptable() const
   {
      return GetCastSectionDuration(FName("In")) + GetLevelCastingTime();
   }

   UFUNCTION(BlueprintOverride)
   bool OnShouldFinishSpellAfterActivation_Scriptable()
   {
      return !IsSpellManaUsageContinuous() && !IsSpellManaUsageNormalContinuous();
   }

   UFUNCTION(BlueprintOverride)
   bool OnCanActivateAbilityServer_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo) const
   {
      USpellExecutionValidatorDataDefault data = CreateSpellValidatorExecutionData();
      return DoExecutionValidation(data, GameplayAbilityActorInfo.AvatarActor);
   }
  
   bool DoExecutionValidation(USpellExecutionValidatorDataDefault data, AActor SourceActor) const
   {
      InitializeValidatorData(data, SourceActor);
      return ExecuteValidator(data);
   }

   void InitializeValidatorData(USpellExecutionValidatorDataDefault Data, AActor SourceActor) const
   {
        USpellExecutionValidatorDataDefault data = Cast<USpellExecutionValidatorDataDefault>(Data);
        data.SourceActor = SourceActor;
   }


   USpellExecutionValidatorDataDefault CreateSpellValidatorExecutionData() const
   {
      auto executor = Cast<UCastSpellExecutionValidatorDefault>(m_ExecutionValidator.Get().GetDefaultObject());
      return Cast<USpellExecutionValidatorDataDefault>(NewObject(nullptr, executor.GetExecutionValidatorDataClass()));
   }

   void RegisterGameplayCastTransformEvent()
   {
      if(m_CastTransformEventHandle != nullptr)
         return;
      
      m_CastTransformEventHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_Transform_Cast, this, n"OnCastTransform");
   }

   void UnRegisterGameplayCastTransformEvent()
   {
      if(m_CastTransformEventHandle == nullptr)
         return;

      MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_CastTransformEventHandle);
      m_CastTransformEventHandle = nullptr;
   }
}