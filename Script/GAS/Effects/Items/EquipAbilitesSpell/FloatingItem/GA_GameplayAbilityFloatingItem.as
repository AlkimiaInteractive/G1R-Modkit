class UGA_GameplayAbilityFloatingItem : UGameplayAbilityFloatingItem
{
    //The equip action is local. Due the unequip and equip again. The ability calls twice to EndAbility. 
    //If the equip action is called twice. The equip ability throw an anim blendOut and the scroll is not equipped.
    bool m_DoneEquipScroll = false;
    bool m_ScrollConsumed = false;

    default m_RecoverItemTimeoutDelay = 1.5f;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable()
    {
        m_DoneEquipScroll = false;
        m_ScrollConsumed = false;
    }

    UFUNCTION(BlueprintOverride)
    bool ShouldRestartVisualsOnThrowRuneWhileRunning_Scriptable()
    {
        auto itemVisual = MagicScript::GetSpellVisualRuneScroll(GetAvatarActorFromActorInfo());
        if(itemVisual == nullptr)
            return false;

        return itemVisual.Item.GetItemType().MatchesTag(GameplayTag::Item_Weapon_Scroll);
    }

    UFUNCTION(BlueprintOverride)
    void OnLaunchSpellOnServer_Scriptable()
    {
        if(MagicScript::IsScroll(MagicScript::GetSpellVisualRuneScroll(GetAvatarActorFromActorInfo())))
        {
            //@DE - When cast a spell to cancel a previous one, we should not consume scroll. Ej: Light or UrizielWaveOfDeath
            auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
            if(abComp.HasGameplayTag(GameplayTag::State_CastToCancelSpell))
            {
                return;
            }
            auto magicComponent = Cast<UGothicMagicComponent>(GetAvatarActorFromActorInfo().GetComponentByClass(UGothicMagicComponent::StaticClass()));
            magicComponent.ConsumeScroll();
            m_ScrollConsumed = true;
        }
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable()
    {       
        if(HasAuthority())
        {
           ServerTryEquipFloatingItem();
        }
    }

    UFUNCTION(Server)
    void ServerTryEquipFloatingItem()
    {
        if(!m_ScrollConsumed)
            return;
        TryEquipFloatingItem();
        ClientTryEquipFloatingItem();
    }

    UFUNCTION(Client)
    void ClientTryEquipFloatingItem()
    {
        TryEquipFloatingItem();
    }

    UFUNCTION()
    void TryEquipFloatingItem()
    {     
        if(m_DoneEquipScroll)
            return;
        //Avoid multiple executions.
        m_DoneEquipScroll = true;

        const auto avatar = GetAvatarActorFromActorInfo();
        if(avatar == nullptr)
        {
            return;
        }
        auto magicComponent = Cast<UGothicMagicComponent>(GetAvatarActorFromActorInfo().GetComponentByClass(UGothicMagicComponent::StaticClass()));
        if(MagicScript::HasMoreScrolls(GetAvatarActorFromActorInfo()) && MagicScript::CanEquipRuneOrScrollAfterUse(GetAvatarActorFromActorInfo()))
        {
            magicComponent.EquipRightHandScroll();
        }
        else
        {
            magicComponent.UnAttachRightHandScroll();
        } 
    }
}