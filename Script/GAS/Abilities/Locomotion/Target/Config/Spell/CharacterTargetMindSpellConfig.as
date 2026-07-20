class UCharacterTargetMindSpellConfig : USpellCharacterTargetConfig
{
   
    USceneComponent GetAccurateAimingComponent(AGothicCharacter Character) override
    {
        auto accurateComp = SearchCollisionComponentBySocketName(Character, FString("head"));
        if(accurateComp != nullptr)
            return accurateComp;
        return Super::GetAccurateAimingComponent(Character);
    }

}