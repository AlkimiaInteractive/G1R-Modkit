
UCLASS()
class UXardas_Sleeper_Minion_BillboardComponent : UBillboardComponent
{
    default bReplicates = true;
    
    UPROPERTY(BlueprintReadWrite, EditAnywhere, Replicated)
    AXardas_Sleeper_Env_RubyVisual m_AttachedRuby;


    void CheckErrors()
    {
        bool shouldPrint = false;
        FString text = FString("");
        if(m_AttachedRuby == nullptr)
        {
            shouldPrint = true;
            FString("AXardas_Sleeper_Env_RubyVisual is NULL - ");
        }

        if(shouldPrint)
        {
            text.Append(FString("On : "));
            text.Append(FString(GetName()));
            PrintError(text, 50.f);
        }
    }

    UFUNCTION()
    void ActivateVisuals()
    {
        m_AttachedRuby.DoActivateVisuals();
    }

}