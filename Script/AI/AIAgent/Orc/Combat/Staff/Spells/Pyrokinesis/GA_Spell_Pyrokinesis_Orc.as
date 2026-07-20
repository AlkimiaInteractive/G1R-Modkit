
class UGA_Spell_Pyrokinesis_Orc : UGA_Spell_Pyrokinesis
{
    //default m_TriggerBeginOnSpellTag = GameplayTag::Ability_Action_Spell_Throw_Pyrokinesis;
    
    default m_WeaponDefinition = UPyrokinesisProjectileDefinition_Orc::StaticClass();

    UPROPERTY()
    AItemVisual m_ItemInHand;


    UFUNCTION(BlueprintOverride)
    void OnActivateSpellServer_Scriptable()
    {
        //Get the staff
        m_ItemInHand = GetItemInHand();
    }

    void SpawnVisuals() override
    {
        if(m_ItemInHand == nullptr)
        {
            Super::SpawnVisuals();
            return;
        }

        auto meshComp = Cast<UStaticMeshComponent>(m_ItemInHand.GetComponentByClass(UStaticMeshComponent::StaticClass()));
        m_SpawnedActors.Add(SpawnRay(m_Target, GetAvatarActorFromActorInfo(), meshComp, n"Bottom"));

        //Spawn ray from the socket of the staff
        //Improve the ALightningRayVisual to allow update from other mesh than the character ones        
    }

    AItemVisual GetItemInHand()
    {
        auto carryComp = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).GetCarryComponent();
        if(carryComp == nullptr)
            return nullptr;

        return carryComp.GetItemVisual(); 
    }

}