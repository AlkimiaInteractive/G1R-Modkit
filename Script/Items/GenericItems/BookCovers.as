// ============================================================================
// BASE CONFIGURATIONS
// ============================================================================

UCLASS()
class UBookCover_BookBase: UBookCoverConfiguration
{
    const FName Corner1= n"/Game/UI/AnimatedBook/T_SCorner_1.T_SCorner_1";
    const FName Corner2 = n"/Game/UI/AnimatedBook/T_SCorner_2.T_SCorner_2";
    //const FName corner1_Gold= n"/Game/UI/AnimatedBook/T_Corner_1_Gold.T_Corner_1_Gold";
    const FName LeatherStripes = n"/Game/UI/AnimatedBook/T_LeatherStripes.T_LeatherStripes";
    const FName GoldenFrame_LeatherStripes = n"/Game/UI/AnimatedBook/T_Frame_V1_Stripe_D.T_Frame_V1_Stripe_D";
    const FName GoldenStripe=  n"/Game/UI/AnimatedBook/MetalStripe.MetalStripe";//  
    const FName GoldenFrame=  n"/Game/UI/AnimatedBook/T_Golden_Frame_.T_Golden_Frame_";
    const FName GoldenStripe_GoldenFrame=  n"/Game/UI/AnimatedBook/T_Stripe_Metal_Gold_Frame.T_Stripe_Metal_Gold_Frame";
    //const FName GoldenStripe_GoldenFrame2=  n"/Game/UI/AnimatedBook/GoldenFrame_StripeMetal_02.GoldenFrame_StripeMetal_02";


    // Default book cover configuration for books
    // Set default textures for book corners
    // default m_BookVisualConfiguration.m_TopRightCorner = TSoftObjectPtr<UTexture2D>(Corner1);
    // default m_BookVisualConfiguration.m_BottomRightCorner = TSoftObjectPtr<UTexture2D>(Corner1);
    // default m_BookVisualConfiguration.m_TopLeftCorner = TSoftObjectPtr<UTexture2D>(Corner1);
    // default m_BookVisualConfiguration.m_BottomLeftCorner = TSoftObjectPtr<UTexture2D>(Corner1);

    // default m_BookVisualConfiguration.m_TopRightCorner = TSoftObjectPtr<UTexture2D>(Corner2);
    // default m_BookVisualConfiguration.m_BottomRightCorner = TSoftObjectPtr<UTexture2D>(Corner2);
    // default m_BookVisualConfiguration.m_TopLeftCorner = TSoftObjectPtr<UTexture2D>(Corner2);
    // default m_BookVisualConfiguration.m_BottomLeftCorner = TSoftObjectPtr<UTexture2D>(Corner2);

    //default m_BookVisualConfiguration.m_CoverLogo = TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/Template_1_Book_Cover.Template_1_Book_Cover");
    
    //default m_BookVisualConfiguration.m_LeftBorder = TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/T_Border_V1_D.T_Border_V1_D");

    // Set default colors and damage state
    // Available colors: White, Emerald, Red, Turquoise, Yellow, Orange, Purple, Silver, Green, Cyan, Black, Blue, Magenta
    // Colors can also be defined as hex with `FColor::FromHex("RRGGBB")`
    default m_BookVisualConfiguration.m_BookTintColor = FColor::Orange;
    default m_BookVisualConfiguration.m_BookDamageState = 1;

    // Set default title properties
    default m_BookVisualConfiguration.m_BookTitleFont = TSoftObjectPtr<UFont>( n"/Script/Engine.Font'/Game/UI/Fonts/Boucherie-Block_Font.Boucherie-Block_Font'" );
    default m_BookVisualConfiguration.m_BookTitleFontSize = 100.0f;

    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0xFF805F4A);//
    //default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("473f31");
    default m_BookVisualConfiguration.m_BookTitleOpacity = 0.5f;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::LEFT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::TOP;

    default m_BookVisualConfiguration.m_BookTitleShadowIntensity = 1.0f;
    default m_BookVisualConfiguration.m_BookTitleWearIntensity = 0.0f;
}

UCLASS()
class UBookCover_NoteBase: UBookCoverConfiguration
{
    // Default configuration for notes/scrolls
    default m_BookVisualConfiguration.m_BackgroundTexture =  TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Quests/T_PaperPanelBackground.T_PaperPanelBackground");
}


// ╔════════════════════════════════════════════════════════════════════════╗
// ║                                                                        ║
// ║                              BOOKS                                     ║
// ║                                                                        ║
// ╚════════════════════════════════════════════════════════════════════════╝

UCLASS()
class UBookCover_ItMs_Book_Innos: UBookCover_BookBase //magic runes and rituals 
{
    //COVER
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/MagicRunes_Rituals.MagicRunes_Rituals");
    default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;
    //default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/Template_1_Book_Cover.Template_1_Book_Cover");

    //STRIPES
    default m_BookVisualConfiguration.m_RightBorder = TSoftObjectPtr<UTexture2D>(GoldenStripe);

    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#8B7946");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8adfba87);//0xff886a1a  0xff927f40 0x98a0864d 
    default m_BookVisualConfiguration.m_BookTitleOpacity = 100.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER; //positions are wrong
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::TOP;   
}

UCLASS()
class UBookCover_ItMs_Book_WaterMages: UBookCover_BookBase //Old ways of the Druids 
{
    //COVER
    default m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_TheOldWaydOTheDruids.T_TheOldWaydOTheDruids");

    //STRIPES
    //default m_BookVisualConfiguration.m_RightBorder = TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/MetalStripePlusPieces.MetalStripePlusPieces");
    //default m_BookVisualConfiguration.m_RightBorder = TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/T_MetalPieces.T_MetalPieces");       
    default m_BookVisualConfiguration.m_RightBorder = TSoftObjectPtr<UTexture2D>(GoldenStripe);
    
    //COLOR & TITLE
    
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#B7C1D2");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0xffc29a2c);//   
    
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 2; //2 
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::RIGHT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::TOP;
}

UCLASS()
class UBookCover_ItWr_Book_Arcanum: UBookCover_BookBase //arcanum elementorum
{
    //COVER
   default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_ElementryArcanium_Allsymbols.T_ElementryArcanium_Allsymbols");
   //default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/Template_1_Book_Cover.Template_1_Book_Cover");
   //default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/Template_1_Book_Cover_Border.Template_1_Book_Cover_Border");

    //STRIPES
    default m_BookVisualConfiguration.m_RightBorder=TSoftObjectPtr<UTexture2D>(GoldenStripe);
    
  //CORNERS
    default m_BookVisualConfiguration.m_TopRightCorner = TSoftObjectPtr<UTexture2D>(n"/All/Game/UI/AnimatedBook/T_Corner_01");
    default m_BookVisualConfiguration.m_BottomRightCorner = TSoftObjectPtr<UTexture2D>(n"/All/Game/UI/AnimatedBook/T_Corner_01");
    default m_BookVisualConfiguration.m_TopLeftCorner = TSoftObjectPtr<UTexture2D>(n"/All/Game/UI/AnimatedBook/T_Corner_01");
    default m_BookVisualConfiguration.m_BottomLeftCorner = TSoftObjectPtr<UTexture2D>(n"/All/Game/UI/AnimatedBook/T_Corner_01");

    //COLOR & TITLE
    
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#80748B");//Book colors
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x80c29c6b);//0xff473910   0xff806c38//ultimo  0x96d1a877//clarito 0x80c29c6b

    
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::RIGHT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;


}

UCLASS()
class UBookCover_ItWr_Book_Artfighting: UBookCover_BookBase
{ 
     //COVER
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_ArtOfFightingBevel.T_ArtOfFightingBevel");
    //CORNERS
    default m_BookVisualConfiguration.m_TopRightCorner = TSoftObjectPtr<UTexture2D>(Corner2);
    default m_BookVisualConfiguration.m_BottomRightCorner = TSoftObjectPtr<UTexture2D>(Corner2);
    default m_BookVisualConfiguration.m_TopLeftCorner = TSoftObjectPtr<UTexture2D>(Corner2);
    default m_BookVisualConfiguration.m_BottomLeftCorner = TSoftObjectPtr<UTexture2D>(Corner2);

    //COLOR & TITLE
    
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#764336");//D0B28B
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ac9a97d);//0xff806c38 0xff9a8365 //opacity -> 0x8a9a8365
    
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::TOP;
}

UCLASS()
class UBookCover_ItWr_Book_Astronomy: UBookCover_BookBase
{
    //COVER
    //default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_Astronomy.T_Astronomy");
    default m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_Astronomy_02.T_Astronomy_02");
    default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;

    //CORNERS
    default m_BookVisualConfiguration.m_TopRightCorner = TSoftObjectPtr<UTexture2D>(Corner1);
    default m_BookVisualConfiguration.m_BottomRightCorner = TSoftObjectPtr<UTexture2D>(Corner1);
    default m_BookVisualConfiguration.m_TopLeftCorner = TSoftObjectPtr<UTexture2D>(Corner1);
    default m_BookVisualConfiguration.m_BottomLeftCorner = TSoftObjectPtr<UTexture2D>(Corner1);
    
    //COLOR & TITLE
     default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#6C6A95");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ac9a97d);// Color Original: 0xFF8B7946 0x80a08b51 0x8ac6a576
    
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::TOP;
}

UCLASS()
class UBookCover_ItWr_Book_Battle_Varant_01: UBookCover_BookBase //the blue one
{

    //STRIPES
   
    default m_BookVisualConfiguration.m_CoverLogo = TSoftObjectPtr<UTexture2D>(GoldenFrame_LeatherStripes);
    default m_BookVisualConfiguration.m_CoverLogo= TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/CoverDesigns/Battle_Varant_01_Text.Battle_Varant_01_Text");;
    default m_BookVisualConfiguration.m_LeftBorder= TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/T_Border_V1_D.T_Border_V1_D");;
     default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;
    
    //CORNERS
    default m_BookVisualConfiguration.m_TopRightCorner = TSoftObjectPtr<UTexture2D>(Corner1);;
    default m_BookVisualConfiguration.m_BottomRightCorner = TSoftObjectPtr<UTexture2D>(Corner1);;
    default m_BookVisualConfiguration.m_TopLeftCorner = nullptr;
    default m_BookVisualConfiguration.m_BottomLeftCorner = nullptr;

    //COLOR & TITLE
    
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("002042");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ae7c495);// 0x7ca08b51  0x8ab9996c  0x8ac9a97d
    
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::RIGHT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
    
}

UCLASS()
class UBookCover_ItWr_Book_Battle_Varant_02: UBookCover_BookBase //the lilac one
{

    //STRIPES
    default m_BookVisualConfiguration.m_CoverLogo = TSoftObjectPtr<UTexture2D>(GoldenFrame_LeatherStripes);
    default m_BookVisualConfiguration.m_CoverLogo= TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/CoverDesigns/Battle_Varant_02.Battle_Varant_02");;
    //default m_BookVisualConfiguration.m_CoverLogo= TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/CoverDesigns/Battle_Varant_02_TestNewPos.Battle_Varant_02_TestNewPos");;
    default m_BookVisualConfiguration.m_CoverLogo= TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/CoverDesigns/Battle_Varant_02_Text.Battle_Varant_02_Text");;
    default m_BookVisualConfiguration.m_LeftBorder= TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/T_Border_V1_D.T_Border_V1_D");;
     default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;

    
    
    //CORNERS
    default m_BookVisualConfiguration.m_BottomRightCorner = TSoftObjectPtr<UTexture2D>(Corner1);;
    default m_BookVisualConfiguration.m_TopRightCorner = TSoftObjectPtr<UTexture2D>(Corner1);;
    default m_BookVisualConfiguration.m_TopLeftCorner = nullptr;
    default m_BookVisualConfiguration.m_BottomLeftCorner = nullptr;

    //COLOR & TITLE
    
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#7C708F");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ae7c495);// 0x7ca18a44 0x8ac9a97d
    
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::RIGHT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
    
}

UCLASS()
class UBookCover_ItWr_Book_Bestiary_01: UBookCover_BookBase
{
    //COVER
    default m_BookVisualConfiguration.m_CoverLogo = TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/CoverDesigns/T_Bestiary_Scavenger.T_Bestiary_Scavenger"); 
    //default m_BookVisualConfiguration.m_CoverLogo = TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/CoverDesigns/test_cover.test_cover"); 

    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#AC6953");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ac9a97d);//0xff8f7d4c  0xff726747  0x7a72653d
    default m_BookVisualConfiguration.m_BookTitleOpacity = 01.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 1;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
    
    
}

UCLASS()
class UBookCover_ItWr_Book_Bestiary_02: UBookCover_BookBase
{


    //DECO
    default m_BookVisualConfiguration.m_CoverLogo = TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/CoverDesigns/T_Bestiary_Minecrawler.T_Bestiary_Minecrawler"); 

    //CORNERS
    default m_BookVisualConfiguration.m_TopRightCorner = TSoftObjectPtr<UTexture2D>(Corner1);
    default m_BookVisualConfiguration.m_BottomRightCorner = TSoftObjectPtr<UTexture2D>(Corner1);
    default m_BookVisualConfiguration.m_TopLeftCorner = TSoftObjectPtr<UTexture2D>(Corner1);
    default m_BookVisualConfiguration.m_BottomLeftCorner = TSoftObjectPtr<UTexture2D>(Corner1);


    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#AC6953");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ac9a97d);// 0xff9b846a
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 2;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
}

UCLASS()
class UBookCover_ItWr_Book_Bestiary_03: UBookCover_BookBase
{

    //DECO
    default m_BookVisualConfiguration.m_CoverLogo = TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/CoverDesigns/T_Bestiary_Razor.T_Bestiary_Razor"); 
    
    //CORNERS
    default m_BookVisualConfiguration.m_TopRightCorner = TSoftObjectPtr<UTexture2D>(Corner2);
    default m_BookVisualConfiguration.m_BottomRightCorner = TSoftObjectPtr<UTexture2D>(Corner2);
    default m_BookVisualConfiguration.m_TopLeftCorner = TSoftObjectPtr<UTexture2D>(Corner2);
    default m_BookVisualConfiguration.m_BottomLeftCorner = TSoftObjectPtr<UTexture2D>(Corner2);

    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#AC6953");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ac9a97d);// 0x8e9b846a
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
}

UCLASS()
class UBookCover_ItWr_Book_Bestiary_04: UBookCover_BookBase
{
    //DECO
    default m_BookVisualConfiguration.m_CoverLogo = TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/CoverDesigns/T_Bestiary_SwampShark.T_Bestiary_SwampShark"); 

    //CORNERS
    default m_BookVisualConfiguration.m_TopRightCorner = TSoftObjectPtr<UTexture2D>(Corner2);
    default m_BookVisualConfiguration.m_BottomRightCorner = TSoftObjectPtr<UTexture2D>(Corner2);
    default m_BookVisualConfiguration.m_TopLeftCorner = TSoftObjectPtr<UTexture2D>(Corner2);
    default m_BookVisualConfiguration.m_BottomLeftCorner = TSoftObjectPtr<UTexture2D>(Corner2);

    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#AC6953");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ac9a97d);// 0x7c8f7d4c
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 1;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
}

UCLASS()
class UBookCover_ItWr_Book_Bestiary_05: UBookCover_BookBase
{
     //DECO
    default m_BookVisualConfiguration.m_CoverLogo = TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/CoverDesigns/T_Bestiary_snowshadowbeast.T_Bestiary_snowshadowbeast"); 
    //CORNERS
    default m_BookVisualConfiguration.m_TopRightCorner = TSoftObjectPtr<UTexture2D>(Corner1);
    default m_BookVisualConfiguration.m_BottomRightCorner = TSoftObjectPtr<UTexture2D>(Corner1);
    default m_BookVisualConfiguration.m_TopLeftCorner = TSoftObjectPtr<UTexture2D>(Corner1);
    default m_BookVisualConfiguration.m_BottomLeftCorner = TSoftObjectPtr<UTexture2D>(Corner1);

    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#AC6953");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ac9a97d);// 0x7c968057
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
}

UCLASS()
class UBookCover_ItWr_Book_Bloodfly_01: UBookCover_BookBase
{
    //DECO
    default m_BookVisualConfiguration.m_CoverLogo = TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/CoverDesigns/T_TheBloodFlies.T_TheBloodFlies");
    default m_BookVisualConfiguration.m_BookTitleFontSize =  85.0f;

    //CORNERS

    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#846B4D");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x98a0864d);// 0x795f4d1b // 0x8ca0864d
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::TOP;
}

UCLASS()
class UBookCover_ItWr_Book_Chromanin_01: UBookCover_BookBase
{
    //DECO
    default m_BookVisualConfiguration.m_CoverLogo = TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/CoverDesigns/T_Chromanin01.T_Chromanin01"); 
    default m_BookVisualConfiguration.m_BookTitleFontSize =  85.0f;

 
    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#AC6953");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8adfba87);//0xff745b3e  0xff8a745b 0x709b846a 0x94c09d75
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
}

UCLASS()
class UBookCover_ItWr_Book_Chromanin_02: UBookCover_BookBase
{
    //DECO
    default m_BookVisualConfiguration.m_CoverLogo = TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/CoverDesigns/Chromanin_02.Chromanin_02"); 
    default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;
    
    

    //COLOR & TITLE

    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#AC6953");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x94c09d75);//0x6c9b846a 0x94c09d75
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
}

UCLASS()
class UBookCover_ItWr_Book_Chromanin_03: UBookCover_BookBase
{
    //DECO
    default m_BookVisualConfiguration.m_CoverLogo = TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/CoverDesigns/T_Chromanin03.T_Chromanin03"); 
     default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;

    //COLOR & TITLE

    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("AC6953");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8adfba87);// 0x759b846a
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
}

UCLASS()
class UBookCover_ItWr_Book_Chromanin_04: UBookCover_BookBase
{
    //DECO
    default m_BookVisualConfiguration.m_CoverLogo = TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/CoverDesigns/Chromanin_04.Chromanin_04"); 
    default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;

    //COLOR & TITLE

    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("AC6953");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8adfba87);//  0x759b846a
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
}

UCLASS()
class UBookCover_ItWr_Book_Chromanin_05: UBookCover_BookBase
{
    //DECO
    default m_BookVisualConfiguration.m_CoverLogo = TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/CoverDesigns/T_Chromanin05.T_Chromanin05"); 
    default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;

    //COLOR & TITLE

    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("AC6953");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x94c09d75);// 0x8a9b846a
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
}

UCLASS()
class UBookCover_ItWr_Book_Chromanin_06: UBookCover_BookBase
{
    //DECO
    default m_BookVisualConfiguration.m_CoverLogo = TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/CoverDesigns/T_Chromanin06.T_Chromanin06"); 
    default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;

    //COLOR & TITLE

    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("AC6953");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x94c09d75);// 0x8c9b846a
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
}

UCLASS()
class UBookCover_ItWr_Book_Circle_00: UBookCover_BookBase
{
     //COVER
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_CircleMagic_01_Text.T_CircleMagic_01_Text");
    default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;

    //STRIPES
    default m_BookVisualConfiguration.m_RightBorder=TSoftObjectPtr<UTexture2D>(GoldenStripe);
    
    //COLOR & TITLE 

    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("622F22");//Book color
   default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ae7c495);//0xff4d3f1b  0x715e4d22  0x8acaa877 Nice color, but unreadable 0x8acaa877
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::RIGHT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
}

UCLASS()
class UBookCover_ItWr_Book_Circle_01: UBookCover_BookBase
{
    //COVER
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_CircleMagic_01_Text.T_CircleMagic_01_Text");
    default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;

    //STRIPES
    default m_BookVisualConfiguration.m_RightBorder=TSoftObjectPtr<UTexture2D>(GoldenStripe);
    
    //COLOR & TITLE 

    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("622F22");//Book color
   default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ae7c495);//0xff4d3f1b  0x715e4d22  0x8acaa877 0x8adfba87 Nice color, but unreadable 0x8acaa877 0x8ad4a768
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::RIGHT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
    
}

UCLASS()
class UBookCover_ItWr_Book_Circle_02: UBookCover_BookBase
{
   //COVER
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_CircleMagic_01_Text.T_CircleMagic_01_Text");
    default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;
    
    //STRIPES
    default m_BookVisualConfiguration.m_RightBorder=TSoftObjectPtr<UTexture2D>(GoldenStripe);

    //COLOR & TITLE
    
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("622F22");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ae7c495);//  0x6b5e4d22 Nice color, but unreadable 0x8acaa877 0x8ae7c495
    
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::RIGHT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
    
}

UCLASS()
class UBookCover_ItWr_Book_Circle_03: UBookCover_BookBase
{
    ///COVER
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_CircleMagic_01_Text.T_CircleMagic_01_Text");
    default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;
    
    //STRIPES
    default m_BookVisualConfiguration.m_RightBorder=TSoftObjectPtr<UTexture2D>(GoldenStripe);

    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("622F22");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ae7c495);//  0x815e4d22
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::RIGHT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;

}

UCLASS()
class UBookCover_ItWr_Book_Circle_04: UBookCover_BookBase
{
   //COVER
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_CircleMagic_02_Text.T_CircleMagic_02_Text");
    default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;
    
    //STRIPES
    default m_BookVisualConfiguration.m_RightBorder=TSoftObjectPtr<UTexture2D>(GoldenStripe);

    //COLOR & TITLE
    
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("622F22");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ae7c495);// 0x755e4d22
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::RIGHT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;

}

UCLASS()
class UBookCover_ItWr_Book_Circle_05: UBookCover_BookBase
{
    //COVER
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_CircleMagic_02_Text.T_CircleMagic_02_Text");
    default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;
    
    //STRIPES
    default m_BookVisualConfiguration.m_RightBorder=TSoftObjectPtr<UTexture2D>(GoldenStripe);

    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("622F22");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ae7c495);// 0x7a5e4d22
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::RIGHT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;

}

UCLASS()
class UBookCover_ItWr_Book_Circle_06: UBookCover_BookBase
{
    ///COVER
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_CircleMagic_02_Text.T_CircleMagic_02_Text");
    default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;
    
    //STRIPES
    default m_BookVisualConfiguration.m_RightBorder=TSoftObjectPtr<UTexture2D>(GoldenStripe);

    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("622F22");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ae7c495);// 0x805e4d22    
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::RIGHT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;

}

UCLASS()
class UBookCover_ItWr_Book_Demon: UBookCover_BookBase
{
    //COVER
    default m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_Demon.T_Demon");

    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#560319");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x7ec29a2c);// 0x7ec29a2c
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::LEFT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::TOP;
}

UCLASS()
class UBookCover_ItWr_Book_FireLizards: UBookCover_BookBase
{
    //COVER
    default m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_FireLizard.T_FireLizard");

    //STRIPES
    //default m_BookVisualConfiguration.m_RightBorder = TSoftObjectPtr<UTexture2D>(GoldenStripe);

    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#846B4D");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x71c29a2c);//0x71c29a2c
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::LEFT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::TOP;
}

UCLASS()
class UBookCover_ItWr_Book_FireMages: UBookCover_BookBase // RitualsOfFire  the order of fire
{
    //COVER
    default m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_RitualsOfTheOrderOfFire.T_RitualsOfTheOrderOfFire");
    default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;

    //STRIPES
    default m_BookVisualConfiguration.m_RightBorder = TSoftObjectPtr<UTexture2D>(GoldenStripe);

    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("AC6953");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8adfba87);//0xff8a6b48   0xffaa8b67 //clarito 0x8acaa877 0x7abd986b  0x8ac9a97d
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::LEFT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::TOP;
}

UCLASS()
class UBookCover_ItWr_Book_Focus: UBookCover_BookBase //Almanac
{
    //COVER
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_Almanac.T_Almanac");
    default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;
    
    //STRIPES
    default m_BookVisualConfiguration.m_RightBorder = TSoftObjectPtr<UTexture2D>(GoldenStripe);

   //COLOR & TITLE
    
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#966D69");//Book color AC6953
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ebe9e87);// 0xff8b7160 0x7a7e695b
    
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::TOP; 
}

UCLASS()
class UBookCover_ItWr_Book_Gods_01: UBookCover_BookBase //the divine cripture book of origins 
{
    //COVER
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/WordsOfTheGods_01.WordsOfTheGods_01");
     default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;

    //STRIPES
    default m_BookVisualConfiguration.m_LeftBorder= TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/T_Border_V1_D.T_Border_V1_D");;
   
    
    //CORNERS
    default m_BookVisualConfiguration.m_TopRightCorner = TSoftObjectPtr<UTexture2D>(Corner2);;
    default m_BookVisualConfiguration.m_BottomRightCorner = TSoftObjectPtr<UTexture2D>(Corner2);; //quedan enormes tengo quehacer un 3r corner mas simple y chiquito
    default m_BookVisualConfiguration.m_TopLeftCorner = nullptr;
    default m_BookVisualConfiguration.m_BottomLeftCorner = nullptr;

    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#774B2C");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8acaa877);//0x707e6930 0x8acaa877
   // default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0xffc29d39);//
   
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::RIGHT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER; //Bugged
    


}

UCLASS()
class UBookCover_ItWr_Book_Gods_02: UBookCover_BookBase
{
    //COVER
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/WordsOfTheGods_01.WordsOfTheGods_01");
     default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;

    //STRIPES
    default m_BookVisualConfiguration.m_LeftBorder= TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/T_Border_V1_D.T_Border_V1_D");;
    
    //CORNERS
    default m_BookVisualConfiguration.m_TopRightCorner = TSoftObjectPtr<UTexture2D>(Corner2);;
    default m_BookVisualConfiguration.m_BottomRightCorner = TSoftObjectPtr<UTexture2D>(Corner2);;
    default m_BookVisualConfiguration.m_TopLeftCorner = nullptr;
    default m_BookVisualConfiguration.m_BottomLeftCorner = nullptr;

    //COLOR & TITLE
    
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#426E8F");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8acaa877);// 0x775f4d1b 0x8acaa877
    
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::RIGHT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;   //Bugged
    
}

UCLASS()
class UBookCover_ItWr_Book_Gods_03: UBookCover_BookBase
{
    //COVER
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/WordsOfTheGods_01.WordsOfTheGods_01");
     default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;

    //STRIPES
    default m_BookVisualConfiguration.m_LeftBorder= TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/T_Border_V1_D.T_Border_V1_D");;
    
    //CORNERS
    default m_BookVisualConfiguration.m_TopRightCorner = TSoftObjectPtr<UTexture2D>(Corner2);;
    default m_BookVisualConfiguration.m_BottomRightCorner = TSoftObjectPtr<UTexture2D>(Corner2);;
    default m_BookVisualConfiguration.m_TopLeftCorner = nullptr;
    default m_BookVisualConfiguration.m_BottomLeftCorner = nullptr;

    //COLOR & TITLE
    
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("B17C80");//Book color 
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8acaa877);//0x715f4d1b 0x8acaa877
    
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::RIGHT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER; //Bugged
    
    
}

UCLASS()
class UBookCover_ItWr_Book_Godsgift: UBookCover_BookBase
{
    
    //COVER
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/AGiftFromTheGods.AGiftFromTheGods");

    //STRIPES
    default m_BookVisualConfiguration.m_RightBorder = TSoftObjectPtr<UTexture2D>(GoldenStripe);
    
    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("563B28");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8acaa877);//0xff756233  0x6e756233 
    
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::LEFT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
}

UCLASS()
class UBookCover_ItWr_Book_Golem_01: UBookCover_BookBase //massis arcanis vol 01 gris
{
    //COVER
    //default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/Template_1_Book_Cover.Template_1_Book_Cover");
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_ArcanumGolumI.T_ArcanumGolumI");
     default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;
    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#F0F1F4");//Book color B0ADAB
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0xd5c9a97d); //0xffada386  0x7e88806a
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::TOP;
}

UCLASS()
class UBookCover_ItWr_Book_Golem_02: UBookCover_BookBase //arcanum golum massis arcanis vol 02 lilac
{
    //COVER
    //default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/Template_1_Book_Cover.Template_1_Book_Cover");
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_ArcanumGolumII.T_ArcanumGolumII");
default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;
    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#ADA5B6");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0xe0c09d75); // 0xff675f6b  0xffc2b7c7  0x71a098a3
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::TOP;
}

UCLASS()
class UBookCover_ItWr_Book_Hunt: UBookCover_BookBase //the hunter and the prey
{
    //COVER
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_HuntAndprey.T_HuntAndprey");
    default m_BookVisualConfiguration.m_BookTitleFontSize = 80.0f;

    //CORNERS
    default m_BookVisualConfiguration.m_TopRightCorner = TSoftObjectPtr<UTexture2D>(Corner2);
    default m_BookVisualConfiguration.m_BottomRightCorner = TSoftObjectPtr<UTexture2D>(Corner2);
    default m_BookVisualConfiguration.m_TopLeftCorner = TSoftObjectPtr<UTexture2D>(Corner2);
    default m_BookVisualConfiguration.m_BottomLeftCorner = TSoftObjectPtr<UTexture2D>(Corner2);

    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#A99584");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0xabcaa779);//0x65776749 0x80c29c6b
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::TOP;
}

UCLASS()
class UBookCover_ItWr_Book_Lyric: UBookCover_BookBase //Myrtana's Poetry
{
    //COVER
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/MyrtanasPoetry_Text.MyrtanasPoetry_Text");
     default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;

    //STRIPES
    default m_BookVisualConfiguration.m_LeftBorder= TSoftObjectPtr<UTexture2D>(n"/Game/UI/AnimatedBook/T_Border_V1_D.T_Border_V1_D");
    
    
    //CORNERS
    default m_BookVisualConfiguration.m_TopRightCorner = TSoftObjectPtr<UTexture2D>(Corner2);;
    default m_BookVisualConfiguration.m_BottomRightCorner = TSoftObjectPtr<UTexture2D>(Corner2);;
    default m_BookVisualConfiguration.m_TopLeftCorner = nullptr;
    default m_BookVisualConfiguration.m_BottomLeftCorner = nullptr;

    //COLOR & TITLE

    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("846B4D");
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0xabcaa779);//0x7c756233 0x8acaa877 
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::RIGHT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
}

UCLASS()
class UBookCover_ItWr_Book_Magicore: UBookCover_BookBase //concerning ore 
{
    //COVER
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_MagicOre.T_MagicOre");
    
    //CORNERS
    default m_BookVisualConfiguration.m_TopRightCorner = TSoftObjectPtr<UTexture2D>(Corner2);
    default m_BookVisualConfiguration.m_BottomRightCorner = TSoftObjectPtr<UTexture2D>(Corner2);
    default m_BookVisualConfiguration.m_TopLeftCorner = nullptr;
    default m_BookVisualConfiguration.m_BottomLeftCorner = nullptr;


    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#967E69");//Book color AC6953
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ae7c495);//0x77aa8b67 0x77aa8b67  0xe3caa779 0x93a7875d
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::TOP;
}

UCLASS()
class UBookCover_ItWr_Book_Powerfulart: UBookCover_BookBase //the roots of power
{

    //COVER
    default m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_APowerfulArt.T_APowerfulArt");
     default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;

    //STRIPES
   
    default m_BookVisualConfiguration.m_RightBorder = TSoftObjectPtr<UTexture2D>(GoldenStripe);
    

    //COLOR & TITLE
    
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#64443F");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ae7c495);//0x79776749 0x8ac9a97d
    
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::LEFT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
}

UCLASS()
class UBookCover_ItWr_Book_Recipes_01: UBookCover_BookBase
{ 
    //COLOR & TITLE
    
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#CE9263");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ac9a97d);//0x86c29a2c
    
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
}

UCLASS()
class UBookCover_ItWr_Book_Recipes_02: UBookCover_BookBase
{
    //COLOR & TITLE
    
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("426E8F");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ac9a97d);//0x77c29a2c
    
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
}

UCLASS()
class UBookCover_ItWr_Book_Secrets: UBookCover_BookBase //secrets of magic the shape of magic 
{
    //COVER
    default m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_TheSecretsOfMagic.T_TheSecretsOfMagic");
     default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;

    //STRIPES
   
    default m_BookVisualConfiguration.m_RightBorder = TSoftObjectPtr<UTexture2D>(GoldenStripe);
    
    
    //COLOR & TITLE
    
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#93643E");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ac9a97d);//0x88aa8b67 
    
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
}

UCLASS()
class UBookCover_ItWr_Book_Slave: UBookCover_BookBase //Journal (orc temple)
{
    //COVER
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_Journal_OrcTemple_.T_Journal_OrcTemple_");
     default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;

    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#A87A57");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ac9a97d);//0x85a88c3f
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::CENTER;
}

UCLASS()
class UBookCover_ItWr_Book_Troll: UBookCover_NoteBase //Journal Page (Troll Hunter) (???)
{

}

UCLASS()
class UBookCover_ItWr_Book_True_Power: UBookCover_BookBase
{
    //COVER 
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_TruePower.T_TruePower");
    default m_BookVisualConfiguration.m_BookTitleFontSize = 85.0f;


    //STRIPES
    default m_BookVisualConfiguration.m_RightBorder = TSoftObjectPtr<UTexture2D>(GoldenStripe);

    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#D0B28B");//Book color
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x8ac9a97d);//0x79aa8b67 0x96d6a65d 0x8ad4a768 

    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::LEFT;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::TOP;
}

UCLASS()    
class UBookCover_ItWr_Book_Zombie: UBookCover_BookBase
{
    //COVER
    default  m_BookVisualConfiguration.m_CoverLogo=TSoftObjectPtr<UTexture2D>( n"/Game/UI/AnimatedBook/CoverDesigns/T_Zombie.T_Zombie");

    //STRIPES
    //default m_BookVisualConfiguration.m_RightBorder = TSoftObjectPtr<UTexture2D>(GoldenStripe); //crear una nueva stripe???? >:3

    //COLOR & TITLE
    default m_BookVisualConfiguration.m_BookTintColor = FColor::FromHex("#B1AAAD");//B1AAAD
    default m_BookVisualConfiguration.m_BookTitleColor = FLinearColor::MakeFromHex(0x70c29a2c);//0x70c29a2c
    default m_BookVisualConfiguration.m_BookTitleOpacity = 1.0f;
    default m_BookVisualConfiguration.m_BookDamageState = 0;
    default m_BookVisualConfiguration.m_TitleHorizontalAlignment = EHorizontalAlignmenet::CENTER;
    default m_BookVisualConfiguration.m_TitleVerticalAlignment = EVerticalAlignmenet::TOP;
}

// ╔════════════════════════════════════════════════════════════════════════╗
// ║                                                                        ║
// ║                             SCROLLS                                    ║
// ║                                                                        ║
// ╚════════════════════════════════════════════════════════════════════════╝

UCLASS()
class UBookCover_ItMs_Scroll_OldRecipe: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItMs_Scroll_SyraRecipe: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItMs_Scroll_WeaponDesign: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItMs_StoneSketch: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItWr_Scroll_AbandonMineSketch: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItWr_Scroll_Bran_01: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItWr_Scroll_Certificate: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItWr_Scroll_Cronos: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItWr_Scroll_DreamUniverse: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItWr_Scroll_DreamWorld: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItWr_Scroll_Jacko_01: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItWr_Scroll_Kalom: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItWr_Scroll_Letter_01: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItWr_Scroll_Letter_02: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItWr_Scroll_List: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItWr_Scroll_Listnc: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItWr_Scroll_Milten: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItWr_Scroll_Mysteriousnote: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItWr_Scroll_Orkparcment_01: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItWr_Scroll_Orkparcment_02: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItWr_Scroll_RankWaterMages: UBookCover_NoteBase
{
    
}

UCLASS()
class UBookCover_ItWr_Scroll_Sketch: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItWr_Scroll_SyraNote: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItWr_Map_World: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItMs_Scroll_SerialKiller: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItMs_Scroll_ToyMaker: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItMs_Scroll_AbandonedGuy: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItMs_Scroll_LoveInterest: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItMs_Scroll_LoveInterest_2: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItMs_Scroll_WomensRevenge: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItMs_Scroll_PaintersCave: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItMs_Scroll_LoveStoryFogTower: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItMs_Scroll_LoveStoryWomen: UBookCover_NoteBase
{
}

UCLASS()
class UBookCover_ItMs_Scroll_InExtremo: UBookCover_NoteBase
{
}