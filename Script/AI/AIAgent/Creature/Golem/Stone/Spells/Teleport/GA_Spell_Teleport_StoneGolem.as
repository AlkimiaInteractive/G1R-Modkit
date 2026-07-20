class UGA_Spell_Teleport_StoneGolem : UGA_Spell_Teleport_Creature
{
    UPROPERTY()
    FGameplayTag m_StartTeleportTag = GameplayTag::Event_Teleport_StoneGolem_Start;
    UPROPERTY()
    FGameplayTag m_EndTeleportTag = GameplayTag::Event_Teleport_StoneGolem_End;
   UFUNCTION(BlueprintOverride)
   void OnActivateSpellServer_Scriptable()
   {
        FGameplayEventData Payload;
        GothicGAS::SendGameplayEvent(GetAvatarActorFromActorInfo(), m_StartTeleportTag, Payload);
        Super::OnActivateSpellServer_Scriptable();
   }

   UFUNCTION(BlueprintOverride)
   void DoSpellBehaviour_Scriptable()
   {
        FGameplayEventData Payload;
        GothicGAS::SendGameplayEvent(GetAvatarActorFromActorInfo(), m_EndTeleportTag, Payload);
        Super::DoSpellBehaviour_Scriptable();
   }
}


