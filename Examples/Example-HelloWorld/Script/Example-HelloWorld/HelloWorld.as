class UChoiceDiego_HelloWorld : G1R::Conversation::UTopic_Hero__OC_STT_DIEGO
{
    default Caption = FText::FromString("Hello Diego!");

    UFUNCTION(BlueprintOverride)
    void Act()
    {
        Hero.AI.Say(FText::FromString("Hello Diego!"));
        Diego.AI.Say(FText::FromString("Hello World!"));
        Diego.AI.GiveItemTo(Hero, UItMi_Orenugget, 999);
    }
}
