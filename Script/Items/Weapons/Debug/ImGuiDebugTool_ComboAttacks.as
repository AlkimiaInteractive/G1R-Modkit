#if TEST
#if WITH_IMGUI

enum EAnimConfigToolSeverity
{
    Info,
    Warning,
    Error,
}

struct FAnimConfigToolIssue
{
    EAnimConfigToolSeverity Severity = EAnimConfigToolSeverity::Info;
    FString Text;
    int Node = -1;
}

// One combo attack reached from the anim config's m_Attacks.
struct FAnimConfigToolNode
{
    TSubclassOf<UComboAttackConfig> AttackClass;
    FString BoundInputs;
    int Depth = 0;      // Shortest chain from a bound attack
    bool bScript = false;
    EAnimConfigToolSeverity Worst = EAnimConfigToolSeverity::Info;
}

// One graph card: a node at one chain length. A node reachable after different numbers of attacks gets one card per
// chain length, in the column of that length.
struct FAnimConfigToolCard
{
    int Node = -1;
    int Column = 0;
    int Row = 0;
}

// An edge drawn between two cards. Loop links close a cycle and point back to the target's shortest-chain card.
struct FAnimConfigToolLink
{
    int FromCard = -1;
    int ToCard = -1;
    int Edge = -1;
    bool bLoop = false;
}

struct FAnimConfigToolEdge
{
    int From = -1;
    int To = -1;
    FGameplayTag Input;
    EComboTiming Timing = EComboTiming::ComboWindow;
}

// Everything the tool knows about one leaf UItemAnimConfig class.
struct FAnimConfigToolEntry
{
    UClass ConfigClass;
    FString Label;
    FString Family;
    FString SourceFile;
    bool bWeapon = false;
    bool bMelee = false;
    bool bBase = false;     // Other anim configs derive from this one
    TArray<FAnimConfigToolNode> Nodes;
    TArray<FAnimConfigToolEdge> Edges;
    TArray<FAnimConfigToolCard> Cards;
    TArray<FAnimConfigToolLink> Links;
    TArray<FAnimConfigToolIssue> Issues;
    int Errors = 0;
    int Warnings = 0;
}

/** Inspects every leaf UItemAnimConfig class: its data, its combo graph (m_Attacks followed through the script
 * Options of UComboAttackConfigScript attacks) and configuration checks for the anim config and its combo attacks.
 * Data is gathered from class defaults on first display and on Refresh; drawing never rebuilds it. */
class UImGuiDebugTool_ComboAttacks : UImGuiDebugTool_Scripted
{
    default MenuEntry = "Gameplay:Combo Attacks";

    private TArray<FAnimConfigToolEntry> Entries;
    private int SelectedEntry = 0;
    private TSubclassOf<UComboAttackConfig> SelectedAttack;
    private bool bBuilt = false;
    private bool bOnlyWithIssues = false;
    private FString EntrySearch;
    private bool bShowInfo = true;
    private int SelectedCard = -1;      // Card of the selected entry's graph; only valid while it shows SelectedAttack

    // Filled once per Build: every script attack class with its source file, and the names of the attacks that any
    // anim config's graph reaches.
    private TArray<UClass> ScriptAttacks;
    private TArray<FString> ScriptAttackFiles;
    private TMap<FString, int> ReachedAttacks;

    // ---------------------------------------------------------------- BUILD

    private void Build()
    {
        bBuilt = true;
        UClass Previous = Entries.IsValidIndex(SelectedEntry) ? Entries[SelectedEntry].ConfigClass : nullptr;
        Entries.Empty();

        PushAllMetadata();

        ScriptAttacks.Empty();
        ScriptAttackFiles.Empty();
        ReachedAttacks.Empty();
        for (UClass AttackClass : UClass::GetAllSubclassesOf(UComboAttackConfigScript::StaticClass()))
        {
            if (IsStaleClass(AttackClass))
                continue;
            ScriptAttacks.Add(AttackClass);
            ScriptAttackFiles.Add(SourceFileOf(AttackClass));
        }

        // Every anim config class, the ones other configs derive from included; those are marked as bases.
        TArray<UClass> AllConfigs;
        TArray<UClass> Parents;
        for (UClass ConfigClass : UClass::GetAllSubclassesOf(UItemAnimConfig::StaticClass(), true))
        {
            if (IsStaleClass(ConfigClass))
                continue;
            AllConfigs.Add(ConfigClass);
            Parents.AddUnique(ConfigClass.GetSuperClass());
        }

        for (UClass ConfigClass : AllConfigs)
        {
            FAnimConfigToolEntry Entry = BuildEntry(ConfigClass);
            Entry.bBase = Parents.Contains(ConfigClass);
            int Insert = 0;
            while (Insert < Entries.Num() && (Entries[Insert].Family < Entry.Family || (Entries[Insert].Family == Entry.Family && Entries[Insert].Label < Entry.Label)))
            {
                Insert++;
            }
            
            Entries.Insert(Entry, Insert);
        }

        // Cross-config checks, once every graph is known.
        for (const FAnimConfigToolEntry& Entry : Entries)
        {
            for (const FAnimConfigToolNode& Node : Entry.Nodes)
                ReachedAttacks.FindOrAdd(Node.AttackClass.Get().GetName().ToString()) = 1;
        }
        for (int Index = 0; Index < Entries.Num(); Index++)
        {
            if (Entries[Index].bWeapon)
                CheckUnreachedAttacks(Entries[Index]);
        }

        SelectedEntry = 0;
        for (int Index = 0; Index < Entries.Num(); Index++)
        {
            if (Entries[Index].ConfigClass == Previous)
                SelectedEntry = Index;
        }
    }

    // A hot reload can rebuild an empty UComboAttackMetaData class without re-running its attack's CreateMetadata;
    // writing every attack's values again keeps the configs in sync.
    private void PushAllMetadata()
    {
        for (UClass AttackClass : UClass::GetAllSubclassesOf(UComboAttackConfigScript::StaticClass()))
        {
            if (IsStaleClass(AttackClass))
                continue;
            auto Attack = Cast<UComboAttackConfigScript>(AttackClass.GetDefaultObject());
            if (IsValid(Attack.m_MetaData.Get()) && Cast<UComboAttackMetaData>(Attack.m_MetaData.Get().GetDefaultObject()) != nullptr)
                Attack.PushMetadata(Attack.m_MetaData);
        }
    }

    private FAnimConfigToolEntry BuildEntry(UClass ConfigClass)
    {
        FAnimConfigToolEntry Entry;
        Entry.ConfigClass = ConfigClass;
        Entry.Label = ConfigClass.GetName().ToString();
        Entry.Family = ConfigClass.GetSuperClass().GetName().ToString();
        Entry.SourceFile = SourceFileOf(ConfigClass);

        auto Config = Cast<UItemAnimConfig>(ConfigClass.GetDefaultObject());
        auto WeaponConfig = Cast<UWeaponItemAnimConfig>(Config);
        auto MeleeConfig = Cast<UWeaponMeleeItemAnimConfig>(Config);
        Entry.bWeapon = WeaponConfig != nullptr;
        Entry.bMelee = MeleeConfig != nullptr;

        CheckItemConfig(Entry, Config, WeaponConfig, MeleeConfig);
        if (WeaponConfig != nullptr)
        {
            BuildGraph(Entry, WeaponConfig);
            for (int Index = 0; Index < Entry.Nodes.Num(); Index++)
                CheckAttack(Entry, Index);
            CheckEdges(Entry);
            CheckGraph(Entry);
        }
        return Entry;
    }

    // ---------------------------------------------------------------- CHECKS: ANIM CONFIG

    private void CheckItemConfig(FAnimConfigToolEntry& Entry, UItemAnimConfig Config, UWeaponItemAnimConfig WeaponConfig, UWeaponMeleeItemAnimConfig MeleeConfig)
    {
        if (Config.m_AnimInstanceClass.IsNull())
            AddIssue(Entry, EAnimConfigToolSeverity::Warning, "No overlay anim blueprint (m_AnimInstanceClass)", -1);
        if (!IsValid(Config.m_SpeedsPlayer.Get()))
            AddIssue(Entry, EAnimConfigToolSeverity::Warning, "No player speed config (m_SpeedsPlayer)", -1);
        if (!IsValid(Config.m_SpeedsNPC.Get()))
            AddIssue(Entry, EAnimConfigToolSeverity::Warning, "No NPC speed config (m_SpeedsNPC)", -1);
        if (!IsValid(Config.m_TurnsData.Get()))
            AddIssue(Entry, EAnimConfigToolSeverity::Info, "No turn data (m_TurnsData)", -1);
        if (!IsValid(Config.m_LocomotionSequencesData.Get()))
            AddIssue(Entry, EAnimConfigToolSeverity::Info, "No locomotion sequences (m_LocomotionSequencesData)", -1);

        if (WeaponConfig == nullptr)
            return;

        if (!IsValid(Config.m_EquipData.Get()))
            AddIssue(Entry, EAnimConfigToolSeverity::Warning, "Weapon config without equip data (m_EquipData): drawing and sheathing have no montages", -1);
        if (!IsValid(Config.m_HitsData.Get()))
            AddIssue(Entry, EAnimConfigToolSeverity::Warning, "Weapon config without hit reactions (m_HitsData)", -1);
        if (WeaponConfig.m_Attacks.Num() == 0)
            AddIssue(Entry, EAnimConfigToolSeverity::Warning, "Weapon config binds no attacks (m_Attacks)", -1);

        if (MeleeConfig == nullptr)
            return;

        if (WeaponConfig.m_BlockMontage.IsNull())
            AddIssue(Entry, EAnimConfigToolSeverity::Warning, "Melee config without block montage (m_BlockMontage)", -1);
        if (!IsValid(Config.m_DodgesData.Get()))
            AddIssue(Entry, EAnimConfigToolSeverity::Warning, "Melee config without dodges (m_DodgesData)", -1);
        if (!IsValid(MeleeConfig.m_ParriesData.Get()))
            AddIssue(Entry, EAnimConfigToolSeverity::Info, "No parries (m_ParriesData): this config cannot parry", -1);
        if (!IsValid(WeaponConfig.m_ExecutionData.Get()))
            AddIssue(Entry, EAnimConfigToolSeverity::Info, "No executions (m_ExecutionData)", -1);
        if (!IsValid(WeaponConfig.m_TauntData.Get()))
            AddIssue(Entry, EAnimConfigToolSeverity::Info, "No taunts (m_TauntData)", -1);
    }

    // ---------------------------------------------------------------- GRAPH

    private void BuildGraph(FAnimConfigToolEntry& Entry, UWeaponItemAnimConfig WeaponConfig)
    {
        TArray<int> Queue;
        for (auto Binding : WeaponConfig.m_Attacks)
        {
            FString Input = TagLeaf(Binding.Key);
            if (!IsValid(Binding.Value.Get()))
            {
                AddIssue(Entry, EAnimConfigToolSeverity::Error, f"m_Attacks[{Input}] is bound to no attack class", -1);
                continue;
            }

            int Index = FindOrAddNode(Entry, Binding.Value, 0, Queue);
            FString& BoundInputs = Entry.Nodes[Index].BoundInputs;
            BoundInputs += BoundInputs.IsEmpty() ? Input : "/" + Input;
            CheckBinding(Entry, Binding.Key, Binding.Value, Index);
        }

        int Cursor = 0;
        while (Cursor < Queue.Num())
        {
            int Index = Queue[Cursor];
            Cursor++;

            UClass AttackClass = Entry.Nodes[Index].AttackClass.Get();
            auto Attack = Cast<UComboAttackConfig>(AttackClass.GetDefaultObject());
            if (Attack == nullptr)
                continue;

            Entry.Nodes[Index].bScript = Cast<UComboAttackConfigScript>(Attack) != nullptr;
            int Depth = Entry.Nodes[Index].Depth + 1;
            for (const FComboAttackOption& Option : ReadOptions(Attack))
            {
                if (!IsValid(Option.Combo.Get()))
                {
                    AddIssue(Entry, EAnimConfigToolSeverity::Error, f"{AttackClass.GetName()}: option {TagLeaf(Option.Direction)} has no attack class; pressing it crashes (C++ GetOption does not check for null)", Index);
                    continue;
                }
                FAnimConfigToolEdge Edge;
                Edge.From = Index;
                Edge.To = FindOrAddNode(Entry, Option.Combo, Depth, Queue);
                Edge.Input = Option.Direction;
                Edge.Timing = Option.Timing;
                Entry.Edges.Add(Edge);
            }
        }

        BuildCards(Entry);
    }

    // Every option of one attack, read from the C++ m_Options through GetOptionsForDirection, so legacy attacks are
    // covered as well as script ones. Each attack is read once per graph, while its node is taken off the queue.
    private TArray<FComboAttackOption> ReadOptions(UComboAttackConfig Attack) const
    {
        TArray<FGameplayTag> Directions;
        Directions.Add(AttackCombo::DirectionTag::Top);
        Directions.Add(AttackCombo::DirectionTag::Bottom);
        Directions.Add(AttackCombo::DirectionTag::Left);
        Directions.Add(AttackCombo::DirectionTag::Right);

        TArray<FComboAttackOption> Options;
        for (FGameplayTag Direction : Directions)
        {
            TMap<EComboTiming, TSubclassOf<UComboAttackConfig>> ByTiming;
            Attack.GetOptionsForDirection(ByTiming, Direction);
            for (auto Timed : ByTiming)
            {
                FComboAttackOption Option;
                Option.Direction = Direction;
                Option.Timing = Timed.Key;
                Option.Combo = Timed.Value;
                Options.Add(Option);
            }
        }
        return Options;
    }

    // Unrolls the node graph into cards, one per node and chain length, following chains from each bound attack.
    // A chain stops when it would repeat an attack: that link becomes a loop link back to the attack's
    // shortest-chain card. Each card is expanded once, so the card count stays bounded.
    private void BuildCards(FAnimConfigToolEntry& Entry)
    {
        TArray<bool> OnPath;
        for (int Index = 0; Index < Entry.Nodes.Num(); Index++)
            OnPath.Add(false);

        TArray<bool> Expanded;
        for (int Index = 0; Index < Entry.Nodes.Num(); Index++)
        {
            if (!Entry.Nodes[Index].BoundInputs.IsEmpty())
                ExpandCard(Entry, FindOrAddCard(Entry, Index, 0), OnPath, Expanded);
        }

        TArray<int> RowsPerColumn;
        for (FAnimConfigToolCard& Card : Entry.Cards)
        {
            while (RowsPerColumn.Num() <= Card.Column)
                RowsPerColumn.Add(0);
            Card.Row = RowsPerColumn[Card.Column];
            RowsPerColumn[Card.Column] = Card.Row + 1;
        }
    }

    private void ExpandCard(FAnimConfigToolEntry& Entry, int CardIndex, TArray<bool>& OnPath, TArray<bool>& Expanded)
    {
        while (Expanded.Num() <= CardIndex)
            Expanded.Add(false);
        if (Expanded[CardIndex])
            return;
        Expanded[CardIndex] = true;

        int Node = Entry.Cards[CardIndex].Node;
        int Column = Entry.Cards[CardIndex].Column;
        OnPath[Node] = true;
        for (int EdgeIndex = 0; EdgeIndex < Entry.Edges.Num(); EdgeIndex++)
        {
            int Target = Entry.Edges[EdgeIndex].To;
            if (Entry.Edges[EdgeIndex].From != Node)
                continue;

            FAnimConfigToolLink Link;
            Link.FromCard = CardIndex;
            Link.Edge = EdgeIndex;
            Link.bLoop = OnPath[Target];
            Link.ToCard = FindOrAddCard(Entry, Target, Link.bLoop ? Entry.Nodes[Target].Depth : Column + 1);
            Entry.Links.Add(Link);

            if (!Link.bLoop)
                ExpandCard(Entry, Link.ToCard, OnPath, Expanded);
        }
        OnPath[Node] = false;
    }

    private int FindOrAddCard(FAnimConfigToolEntry& Entry, int Node, int Column)
    {
        for (int Index = 0; Index < Entry.Cards.Num(); Index++)
        {
            if (Entry.Cards[Index].Node == Node && Entry.Cards[Index].Column == Column)
                return Index;
        }

        FAnimConfigToolCard Card;
        Card.Node = Node;
        Card.Column = Column;
        Entry.Cards.Add(Card);
        return Entry.Cards.Num() - 1;
    }

    // The selected card if it still shows the selected attack, else that attack's leftmost card (e.g. after picking
    // it in the attack table or switching anim config).
    private int ActiveCard(const FAnimConfigToolEntry& Entry) const
    {
        if (Entry.Cards.IsValidIndex(SelectedCard) && Entry.Nodes[Entry.Cards[SelectedCard].Node].AttackClass == SelectedAttack)
            return SelectedCard;

        int Best = -1;
        for (int Index = 0; Index < Entry.Cards.Num(); Index++)
        {
            if (Entry.Nodes[Entry.Cards[Index].Node].AttackClass == SelectedAttack && (Best == -1 || Entry.Cards[Index].Column < Entry.Cards[Best].Column))
                Best = Index;
        }
        return Best;
    }

    private int FindNode(const FAnimConfigToolEntry& Entry, TSubclassOf<UComboAttackConfig> AttackClass) const
    {
        for (int Index = 0; Index < Entry.Nodes.Num(); Index++)
        {
            if (Entry.Nodes[Index].AttackClass == AttackClass)
                return Index;
        }
        return -1;
    }

    private int FindOrAddNode(FAnimConfigToolEntry& Entry, TSubclassOf<UComboAttackConfig> AttackClass, int Depth, TArray<int>& Queue)
    {
        int Existing = FindNode(Entry, AttackClass);
        if (Existing != -1)
            return Existing;

        FAnimConfigToolNode Node;
        Node.AttackClass = AttackClass;
        Node.Depth = Depth;
        Entry.Nodes.Add(Node);
        Queue.Add(Entry.Nodes.Num() - 1);
        return Entry.Nodes.Num() - 1;
    }

    // ---------------------------------------------------------------- CHECKS: BINDINGS AND ATTACKS

    private void CheckBinding(FAnimConfigToolEntry& Entry, FGameplayTag Input, TSubclassOf<UComboAttackConfig> AttackClass, int Index)
    {
        FString AttackName = AttackClass.Get().GetName().ToString();
        if (AttackCombo::IsRemovedScriptClass(AttackClass.Get()))
            AddIssue(Entry, EAnimConfigToolSeverity::Error, f"m_Attacks[{TagLeaf(Input)}] binds {AttackName}, a class from a deleted or renamed script file", Index);
        if (AttackName.Contains("Test"))
            AddIssue(Entry, EAnimConfigToolSeverity::Warning, f"m_Attacks[{TagLeaf(Input)}] binds the test attack {AttackName}", Index);

        FString AttackFolder = FolderOf(SourceFileOf(AttackClass.Get()));
        FString ConfigFolder = FolderOf(Entry.SourceFile);
        if (!AttackFolder.IsEmpty() && !ConfigFolder.IsEmpty() && AttackFolder != ConfigFolder)
            AddIssue(Entry, EAnimConfigToolSeverity::Info, f"m_Attacks[{TagLeaf(Input)}] binds {AttackName} from another folder ({AttackFolder})", Index);

        auto Config = MetaDataOf(AttackClass);
        auto AttackConfig = Cast<UAttackConfig>(Config);
        if (AttackConfig != nullptr && IsDirectionTag(Input) && Cast<UAttackMeleeConfig>(Config) != nullptr && AttackConfig.GetAttackDirection() != Input)
            AddIssue(Entry, EAnimConfigToolSeverity::Warning, f"m_Attacks[{TagLeaf(Input)}] binds {AttackName}, whose config attacks {TagLeaf(AttackConfig.GetAttackDirection())}", Index);
    }

    private void CheckAttack(FAnimConfigToolEntry& Entry, int Index)
    {
        UClass AttackClass = Entry.Nodes[Index].AttackClass.Get();
        FString AttackName = AttackClass.GetName().ToString();
        auto Attack = Cast<UComboAttackConfig>(AttackClass.GetDefaultObject());

        if (!IsValid(Attack.m_GA_Attack.Get()))
            AddIssue(Entry, EAnimConfigToolSeverity::Error, f"{AttackName} has no attack ability (m_GA_Attack)", Index);
        if (!Entry.Nodes[Index].bScript)
            AddIssue(Entry, EAnimConfigToolSeverity::Info, f"{AttackName} is a legacy attack: not a UComboAttackConfigScript, so its values live in its own config class", Index);

        UObject Config = MetaDataOf(Entry.Nodes[Index].AttackClass);
        if (Config == nullptr)
        {
            AddIssue(Entry, EAnimConfigToolSeverity::Error, f"{AttackName} has no config (m_MetaData)", Index);
            return;
        }

        FString ConfigName = Config.Class.GetName().ToString();
        if (AttackCombo::IsRemovedScriptClass(Config.Class))
            AddIssue(Entry, EAnimConfigToolSeverity::Error, f"{AttackName}: config {ConfigName} comes from a deleted or renamed script file", Index);

        auto ScriptAttack = Cast<UComboAttackConfigScript>(Attack);
        auto FilledConfig = Cast<UComboAttackMetaData>(Config);
        if (FilledConfig != nullptr)
        {
            if (!IsValid(FilledConfig.FilledBy.Get()))
                AddIssue(Entry, EAnimConfigToolSeverity::Error, f"{AttackName}: {ConfigName} was never filled; end the attack with `default m_MetaData = CreateMetadata({ConfigName});`", Index);
            else if (FilledConfig.FilledBy.Get() != AttackClass)
                AddIssue(Entry, EAnimConfigToolSeverity::Warning, f"{AttackName}: {ConfigName} holds the values of {FilledConfig.FilledBy.Get().GetName()}; each attack needs its own config class", Index);
        }
        else if (ScriptAttack != nullptr && (!ScriptAttack.AttackMontage.IsNull() || ScriptAttack.DamageMultipliers.Num() > 0))
        {
            AddIssue(Entry, EAnimConfigToolSeverity::Warning, f"{AttackName} sets Attack Config values, but {ConfigName} is not a UComboAttackMetaData, so they are ignored", Index);
        }

        auto AttackConfig = Cast<UAttackConfig>(Config);
        if (AttackConfig == nullptr)
        {
            AddIssue(Entry, EAnimConfigToolSeverity::Warning, f"{AttackName}: config {ConfigName} is not a UAttackConfig", Index);
            return;
        }
        if (AttackConfig.GetDamageMultipliers().Num() == 0)
            AddIssue(Entry, EAnimConfigToolSeverity::Warning, f"{AttackName}: {ConfigName} has no damage multipliers, so the attack deals no damage", Index);
        if (AttackConfig.GetSuperArmorDamageMultiplier() <= 0.0f)
            AddIssue(Entry, EAnimConfigToolSeverity::Warning, f"{AttackName}: {ConfigName} has a super armor damage multiplier of {AttackConfig.GetSuperArmorDamageMultiplier()}", Index);

        auto MeleeConfig = Cast<UAttackMeleeConfig>(Config);
        if (MeleeConfig != nullptr)
        {
            if (MeleeConfig.m_AttackMontage.IsNull())
                AddIssue(Entry, EAnimConfigToolSeverity::Error, f"{AttackName}: {ConfigName} has no attack montage", Index);
            if (MeleeConfig.m_ParriedMontage.IsNull())
                AddIssue(Entry, EAnimConfigToolSeverity::Warning, f"{AttackName}: {ConfigName} has no parried montage, so the attack cannot be parried", Index);
            if (MeleeConfig.m_DeflectedMontage.IsNull())
                AddIssue(Entry, EAnimConfigToolSeverity::Warning, f"{AttackName}: {ConfigName} has no deflected montage, so the attack cannot be deflected", Index);
            if (!IsDirectionTag(MeleeConfig.GetAttackDirection()))
                AddIssue(Entry, EAnimConfigToolSeverity::Warning, f"{AttackName}: {ConfigName} attacks {TagLeaf(MeleeConfig.GetAttackDirection())}, not a Top/Bottom/Left/Right direction", Index);
        }

        auto RiposteConfig = Cast<UAttackRiposteConfig>(Config);
        if (RiposteConfig != nullptr && RiposteConfig.m_Ripostes.Num() == 0)
            AddIssue(Entry, EAnimConfigToolSeverity::Error, f"{AttackName}: riposte config {ConfigName} has no riposte montages", Index);
    }

    private void CheckEdges(FAnimConfigToolEntry& Entry)
    {
        for (const FAnimConfigToolEdge& Edge : Entry.Edges)
        {
            FString FromName = Entry.Nodes[Edge.From].AttackClass.Get().GetName().ToString();
            FString ToName = Entry.Nodes[Edge.To].AttackClass.Get().GetName().ToString();

            if (Edge.From == Edge.To)
                AddIssue(Entry, EAnimConfigToolSeverity::Warning, f"{FromName}: {TagLeaf(Edge.Input)} chains into itself", Edge.From);
            if (!IsDirectionTag(Edge.Input))
                AddIssue(Entry, EAnimConfigToolSeverity::Warning, f"{FromName}: option input {TagLeaf(Edge.Input)} is not a Top/Bottom/Left/Right direction", Edge.From);

            // Reset links intentionally play the opposite opener, so only combo-window links must match their input.
            auto TargetConfig = Cast<UAttackMeleeConfig>(MetaDataOf(Entry.Nodes[Edge.To].AttackClass));
            if (Edge.Timing == EComboTiming::ComboWindow && TargetConfig != nullptr && IsDirectionTag(Edge.Input) && TargetConfig.GetAttackDirection() != Edge.Input)
                AddIssue(Entry, EAnimConfigToolSeverity::Warning, f"{FromName}: {TagLeaf(Edge.Input)} leads to {ToName}, which attacks {TagLeaf(TargetConfig.GetAttackDirection())}", Edge.From);
        }
    }

    private void CheckGraph(FAnimConfigToolEntry& Entry)
    {
        // Configs and montages shared by several attacks of this graph.
        TMap<FString, FString> ConfigUsers;
        TMap<FString, FString> MontageUsers;
        for (const FAnimConfigToolNode& Node : Entry.Nodes)
        {
            UObject Config = MetaDataOf(Node.AttackClass);
            if (Config == nullptr)
                continue;
            FString AttackName = Node.AttackClass.Get().GetName().ToString();
            AppendUser(ConfigUsers, Config.Class.GetName().ToString(), AttackName);

            auto MeleeConfig = Cast<UAttackMeleeConfig>(Config);
            if (MeleeConfig != nullptr && !MeleeConfig.m_AttackMontage.IsNull())
                AppendUser(MontageUsers, MontageName(MeleeConfig.m_AttackMontage), Config.Class.GetName().ToString());
        }
        for (auto Users : ConfigUsers)
        {
            if (Users.Value.Contains(", "))
                AddIssue(Entry, EAnimConfigToolSeverity::Info, f"Config {Users.Key} is shared by {Users.Value}", -1);
        }
        for (auto Users : MontageUsers)
        {
            if (Users.Value.Contains(", "))
                AddIssue(Entry, EAnimConfigToolSeverity::Info, f"Attack montage {Users.Key} is played by several configs: {Users.Value}", -1);
        }

        // Loops through combo-window links: the chain never has to end.
        TArray<int> State;
        for (int Index = 0; Index < Entry.Nodes.Num(); Index++)
            State.Add(0);
        TArray<int> Path;
        for (int Index = 0; Index < Entry.Nodes.Num(); Index++)
        {
            if (State[Index] == 0)
                FindLoops(Entry, Index, State, Path);
        }

    }

    // Attacks declared next to this graph's script attacks that no anim config reaches at all (e.g. a forgotten
    // link). It runs once every graph is built, so reachability is a lookup in ReachedAttacks instead of a fresh
    // walk of every other anim config per attack.
    private void CheckUnreachedAttacks(FAnimConfigToolEntry& Entry)
    {
        TArray<FString> Files;
        for (const FAnimConfigToolNode& Node : Entry.Nodes)
        {
            if (Node.bScript)
                Files.AddUnique(SourceFileOf(Node.AttackClass.Get()));
        }

        FString Unreached;
        int UnreachedCount = 0;
        for (int Index = 0; Index < ScriptAttacks.Num(); Index++)
        {
            FString AttackName = ScriptAttacks[Index].GetName().ToString();
            if (!Files.Contains(ScriptAttackFiles[Index]) || ReachedAttacks.Contains(AttackName))
                continue;
            Unreached += (Unreached.IsEmpty() ? "" : ", ") + AttackName;
            UnreachedCount++;
        }
        if (UnreachedCount > 0)
            AddIssue(Entry, EAnimConfigToolSeverity::Warning, f"{UnreachedCount} attack(s) declared in this graph's files are reached by no anim config: {Unreached}", -1);
    }

    private void FindLoops(FAnimConfigToolEntry& Entry, int Index, TArray<int>& State, TArray<int>& Path)
    {
        State[Index] = 1;
        Path.Add(Index);
        for (const FAnimConfigToolEdge& Edge : Entry.Edges)
        {
            if (Edge.From != Index || Edge.Timing != EComboTiming::ComboWindow)
                continue;
            if (State[Edge.To] == 1)
            {
                FString Loop;
                for (int Step = Path.FindIndex(Edge.To); Step < Path.Num(); Step++)
                    Loop += Entry.Nodes[Path[Step]].AttackClass.Get().GetName().ToString() + " > ";
                Loop += Entry.Nodes[Edge.To].AttackClass.Get().GetName().ToString();
                AddIssue(Entry, EAnimConfigToolSeverity::Info, f"Endless chain: {Loop}", Edge.To);
            }
            else if (State[Edge.To] == 0)
                FindLoops(Entry, Edge.To, State, Path);
        }
        Path.RemoveAt(Path.Num() - 1);
        State[Index] = 2;
    }

    // ---------------------------------------------------------------- HELPERS

    private void AddIssue(FAnimConfigToolEntry& Entry, EAnimConfigToolSeverity Severity, FString Text, int Node)
    {
        FAnimConfigToolIssue Issue;
        Issue.Severity = Severity;
        Issue.Text = Text;
        Issue.Node = Node;
        Entry.Issues.Add(Issue);

        if (Severity == EAnimConfigToolSeverity::Error)
            Entry.Errors++;
        else if (Severity == EAnimConfigToolSeverity::Warning)
            Entry.Warnings++;
        if (Node != -1 && int(Severity) > int(Entry.Nodes[Node].Worst))
            Entry.Nodes[Node].Worst = Severity;
    }

    private void AppendUser(TMap<FString, FString>& Users, FString Key, FString User) const
    {
        FString Existing;
        if (!Users.Find(Key, Existing))
            Users.Add(Key, User);
        else if (!Existing.Contains(User))
            Users.Add(Key, Existing + ", " + User);
    }

    private UObject MetaDataOf(TSubclassOf<UComboAttackConfig> AttackClass) const
    {
        auto Attack = Cast<UComboAttackConfig>(AttackClass.Get().GetDefaultObject());
        return IsValid(Attack.m_MetaData.Get()) ? Attack.m_MetaData.Get().GetDefaultObject() : nullptr;
    }

    private bool IsStaleClass(UClass CheckedClass) const
    {
        FString ClassName = CheckedClass.GetName().ToString();
        return ClassName.StartsWith("SKEL_") || ClassName.StartsWith("REINST_") || ClassName.StartsWith("TRASHCLASS_")
            || AttackCombo::IsRemovedScriptClass(CheckedClass);
    }

    private FString SourceFileOf(UClass SourceClass) const
    {
        auto ScriptClass = Cast<UASClass>(SourceClass);
        return ScriptClass != nullptr ? ScriptClass.GetRelativeSourceFilePath() : "";
    }

    private FString FolderOf(FString File) const
    {
        TArray<FString> Parts;
        File.Replace("\\", "/").ParseIntoArray(Parts, "/");
        FString Folder;
        for (int Part = 0; Part < Parts.Num() - 1; Part++)
            Folder += (Folder.IsEmpty() ? "" : "/") + Parts[Part];
        return Folder;
    }

    private bool IsDirectionTag(FGameplayTag Tag) const
    {
        return Tag == AttackCombo::DirectionTag::Top || Tag == AttackCombo::DirectionTag::Bottom
            || Tag == AttackCombo::DirectionTag::Left || Tag == AttackCombo::DirectionTag::Right;
    }

    private FString TagLeaf(FGameplayTag Tag) const
    {
        TArray<FString> Parts;
        Tag.ToString().ParseIntoArray(Parts, ".");
        return Parts.Num() > 0 ? Parts[Parts.Num() - 1] : "None";
    }

    private FString InputLetter(FGameplayTag Tag) const
    {
        if (Tag == AttackCombo::DirectionTag::Top)
            return "T";
        if (Tag == AttackCombo::DirectionTag::Bottom)
            return "B";
        if (Tag == AttackCombo::DirectionTag::Left)
            return "L";
        if (Tag == AttackCombo::DirectionTag::Right)
            return "R";
        return TagLeaf(Tag);
    }

    private FString MontageName(TSoftObjectPtr<UAnimMontage> Montage) const
    {
        if (Montage.IsNull())
            return "<none>";
        FString Path = Montage.ToSoftObjectPath().ToString();
        FString PackagePath;
        FString Asset;
        if (Path.Split(".", PackagePath, Asset))
            return Asset;
        return Path;
    }

    private FString ClassLabel(TSubclassOf<UObject> ClassValue) const
    {
        return IsValid(ClassValue.Get()) ? ClassValue.Get().GetName().ToString() : "<none>";
    }

    private FString DamageText(const UAttackConfig Config) const
    {
        FString Text;
        for (auto Damage : Config.GetDamageMultipliers())
            Text += (Text.IsEmpty() ? "" : ", ") + f"{TagLeaf(Damage.Key)} {Damage.Value}";
        return Text.IsEmpty() ? "-" : Text;
    }

    // ---------------------------------------------------------------- DISPLAY

    private FColor SeverityColor(EAnimConfigToolSeverity Severity) const
    {
        if (Severity == EAnimConfigToolSeverity::Error)
            return FColor(225, 105, 110);
        if (Severity == EAnimConfigToolSeverity::Warning)
            return FColor(235, 180, 65);
        return FColor(150, 165, 190);
    }

    private FColor NodeColor(const FAnimConfigToolNode& Node) const
    {
        if (Node.Worst != EAnimConfigToolSeverity::Info)
            return SeverityColor(Node.Worst);
        return Node.bScript ? FColor(90, 200, 135) : FColor(130, 140, 155);
    }

    private FColor InputColor(FGameplayTag Input) const
    {
        if (Input == AttackCombo::DirectionTag::Top)
            return FColor(95, 165, 245);
        if (Input == AttackCombo::DirectionTag::Bottom)
            return FColor(185, 130, 240);
        if (Input == AttackCombo::DirectionTag::Left)
            return FColor(110, 215, 200);
        if (Input == AttackCombo::DirectionTag::Right)
            return FColor(240, 150, 90);
        return FColor(200, 200, 200);
    }

    private FString EntryLabel(const FAnimConfigToolEntry& Entry) const
    {
        FString Base = Entry.bBase ? "  [base]" : "";
        return f"{Entry.Label}{Base}   ({Entry.Errors}E / {Entry.Warnings}W)";
    }

    private bool MatchesSearch(const FAnimConfigToolEntry& Entry) const
    {
        return EntrySearch.IsEmpty() || Entry.Label.Contains(EntrySearch) || Entry.Family.Contains(EntrySearch) || Entry.SourceFile.Contains(EntrySearch);
    }

    UFUNCTION(BlueprintOverride)
    void OnDisplay()
    {
        if (!bBuilt)
            Build();

        if (ImGui::Button("Refresh"))
            Build();
        ImGui::SetItemTooltip("Rescan all anim config classes. Needed after a script hot reload.");
        ImGui::SameLine();
        ImGui::Checkbox("Only configs with errors or warnings", bOnlyWithIssues);
        ImGui::SameLine();
        ImGui::Checkbox("Show info", bShowInfo);

        if (Entries.Num() == 0)
        {
            ImGui::TextDisabled("No UItemAnimConfig classes found.");
            return;
        }

        ImGui::SetNextItemWidth(Math::Max(360.0f, ImGui::GetFontSize() * 28.0f));
        if (ImGui::BeginCombo("Anim config", EntryLabel(Entries[SelectedEntry])))
        {
            ImGui::SetNextItemWidth(Math::Max(320.0f, ImGui::GetFontSize() * 24.0f));
            ImGui::InputTextWithHint("Search by class, family or file", EntrySearch);
            ImGui::Separator();

            FString Family;
            bool bAnyMatch = false;
            for (int Index = 0; Index < Entries.Num(); Index++)
            {
                const FAnimConfigToolEntry& Entry = Entries[Index];
                if (bOnlyWithIssues && Entry.Errors + Entry.Warnings == 0)
                    continue;
                if (!MatchesSearch(Entry))
                    continue;
                bAnyMatch = true;
                if (Entry.Family != Family)
                {
                    Family = Entry.Family;
                    ImGui::TextDisabled(Family);
                }
                ImGui::PushID(Index);
                FColor LabelColor = Entry.Errors > 0 ? SeverityColor(EAnimConfigToolSeverity::Error) : (Entry.Warnings > 0 ? SeverityColor(EAnimConfigToolSeverity::Warning) : FColor(225, 230, 240));
                ImGui::PushTextColor(LabelColor);
                if (ImGui::Selectable("   " + EntryLabel(Entry), Index == SelectedEntry))
                    SelectedEntry = Index;
                ImGui::PopTextColor();
                ImGui::PopID();
            }
            if (!bAnyMatch)
                ImGui::TextDisabled("No anim config matches.");
            ImGui::EndCombo();
        }

        DisplayEntry(Entries[SelectedEntry]);
    }

    private void DisplayEntry(const FAnimConfigToolEntry& Entry)
    {
        ImGui::TextDisabled(f"{Entry.Family} > {Entry.Label}   {Entry.SourceFile}");
        
        ImGui::BeginTabBar("Tabs");

        bool bPushedColor = false;
        if (Entry.Errors > 0)
        {
            ImGui::PushTextColor(SeverityColor(EAnimConfigToolSeverity::Error));
            bPushedColor = true;
        }
        else if (Entry.Warnings > 0)
        {
            ImGui::PushTextColor(SeverityColor(EAnimConfigToolSeverity::Error));
            bPushedColor = true;
        }

        if (ImGui::BeginTabItem(f"Issues ({Entry.Errors} errors, {Entry.Warnings} warnings)###Issues"))
        {
            if (bPushedColor)
            {
                bPushedColor = false;
                ImGui::PopTextColor();
            }

            DisplayIssues(Entry.Issues, -1);
            ImGui::EndTabItem();
        }

        if (bPushedColor)
        {
            bPushedColor = false;
            ImGui::PopTextColor();
        }

        if (ImGui::BeginTabItem("Anim config data###Data"))
        {
            DisplayConfigData(Entry);
            ImGui::EndTabItem();
        }

        if (!Entry.bWeapon)
        {
            ImGui::EndTabBar();
            return;
        }

        if (ImGui::BeginTabItem(f"Combo graph ({Entry.Nodes.Num()} attacks, {Entry.Edges.Num()} links)###Graph"))
        {
            DisplayGraph(Entry);

            int Selected = FindNode(Entry, SelectedAttack);
            if (Selected != -1 && ImGui::CollapsingHeader(f"Selected: {SelectedAttack.Get().GetName()}###Selected", true))
            {
                DisplayAttackDetails(Entry, Selected);
            }
            ImGui::EndTabItem();
        }

        if (ImGui::BeginTabItem(f"Attacks ({Entry.Nodes.Num()})###Attacks"))
        {
            DisplayAttackTable(Entry);
            ImGui::EndTabItem();
        }

        ImGui::EndTabBar();
    }

    private void DisplayConfigData(const FAnimConfigToolEntry& Entry)
    {
        auto Config = Cast<UItemAnimConfig>(Entry.ConfigClass.GetDefaultObject());
        auto WeaponConfig = Cast<UWeaponItemAnimConfig>(Config);
        auto MeleeConfig = Cast<UWeaponMeleeItemAnimConfig>(Config);

        if (!ImGui::BeginTable("ConfigData", 2, ImGuiTableFlags::Borders | ImGuiTableFlags::RowBg | ImGuiTableFlags::SizingFixedFit))
            return;
        ImGui::TableSetupColumn("Property");
        ImGui::TableSetupColumn("Value");
        ImGui::TableHeadersRow();

        DataRow("Anim blueprint", Config.m_AnimInstanceClass.IsNull() ? "<none>" : "set");
        DataRow("Equip data", ClassLabel(Config.m_EquipData));
        DataRow("Non-combat equip data", ClassLabel(Config.m_NonCombatEquipData));
        DataRow("Hits data", ClassLabel(Config.m_HitsData));
        DataRow("Dodges data", ClassLabel(Config.m_DodgesData));
        DataRow("Consumables data", ClassLabel(Config.m_ConsumablesData));
        DataRow("Picks / Loots data", ClassLabel(Config.m_PicksData) + " / " + ClassLabel(Config.m_LootsData));
        DataRow("Start / End fire data", ClassLabel(Config.m_StartFireData) + " / " + ClassLabel(Config.m_EndFireData));
        DataRow("Turns data", ClassLabel(Config.m_TurnsData));
        DataRow("Locomotion sequences", ClassLabel(Config.m_LocomotionSequencesData));
        DataRow("Speeds player / NPC", ClassLabel(Config.m_SpeedsPlayer) + " / " + ClassLabel(Config.m_SpeedsNPC));
        DataRow("Throw / crouch throw", MontageName(Config.m_ThrowItem) + " / " + MontageName(Config.m_ThrowItem_Crouch));
        DataRow("Idle / walk breakers", f"{Config.m_IdleBreakers.Num()} / {Config.m_WalkBreakers.Num()}");
        DataRow("Overrides locomotion config", Config.m_OverrideLocomotionConfig ? "yes" : "no");

        if (WeaponConfig != nullptr)
        {
            DataRow("Block montage", MontageName(WeaponConfig.m_BlockMontage));
            DataRow("Taunt data", ClassLabel(WeaponConfig.m_TauntData));
            DataRow("Execution data", ClassLabel(WeaponConfig.m_ExecutionData));
            DataRow("Magnet rotate speed player / AI", f"{WeaponConfig.GetRotateSpeedMagnetPlayer()} / {WeaponConfig.GetRotateSpeedMagnetAI()}");
            DataRow("Manual reorient speed", f"{WeaponConfig.GetAttackRotateSpeedManualReorient()}");
            for (auto Binding : WeaponConfig.m_Attacks)
                DataRow(f"m_Attacks[{TagLeaf(Binding.Key)}]", ClassLabel(Binding.Value));
        }
        if (MeleeConfig != nullptr)
            DataRow("Parries data", ClassLabel(MeleeConfig.m_ParriesData));

        ImGui::EndTable();
    }

    private void DataRow(FString Label, FString Value)
    {
        ImGui::TableNextRow();
        ImGui::TableNextColumn();
        ImGui::Text(Label);
        ImGui::TableNextColumn();
        if (Value.Contains("<none>"))
            ImGui::TextDisabled(Value);
        else
            ImGui::Text(Value);
    }

    private void DisplayIssues(const TArray<FAnimConfigToolIssue>& Issues, int OnlyNode)
    {
        bool bAny = false;
        for (int Severity = int(EAnimConfigToolSeverity::Error); Severity >= 0; Severity--)
        {
            if (Severity == int(EAnimConfigToolSeverity::Info) && !bShowInfo)
                continue;
            for (const FAnimConfigToolIssue& Issue : Issues)
            {
                if (int(Issue.Severity) != Severity || (OnlyNode != -1 && Issue.Node != OnlyNode))
                    continue;
                bAny = true;
                FString Prefix = Issue.Severity == EAnimConfigToolSeverity::Error ? "ERROR  " : (Issue.Severity == EAnimConfigToolSeverity::Warning ? "WARN   " : "INFO   ");
                ImGui::TextColored(SeverityColor(Issue.Severity), Prefix + Issue.Text);
            }
        }
        if (!bAny)
            ImGui::TextColored(FColor(90, 200, 135), "No issues.");
    }

    private void DisplayAttackTable(const FAnimConfigToolEntry& Entry)
    {
        ImGui::TextDisabled("Click a row or a graph card to inspect the attack.");
        if (!ImGui::BeginTable("Attacks", 8, ImGuiTableFlags::Borders | ImGuiTableFlags::RowBg | ImGuiTableFlags::SizingFixedFit))
            return;
        ImGui::TableSetupColumn("Attack");
        ImGui::TableSetupColumn("Bound");
        ImGui::TableSetupColumn("Config");
        ImGui::TableSetupColumn("Direction");
        ImGui::TableSetupColumn("Attack montage");
        ImGui::TableSetupColumn("Damage");
        ImGui::TableSetupColumn("Super armor");
        ImGui::TableSetupColumn("Links");
        ImGui::TableHeadersRow();

        for (int Index = 0; Index < Entry.Nodes.Num(); Index++)
        {
            const FAnimConfigToolNode& Node = Entry.Nodes[Index];
            UObject Config = MetaDataOf(Node.AttackClass);
            auto AttackConfig = Cast<UAttackConfig>(Config);
            auto MeleeConfig = Cast<UAttackMeleeConfig>(Config);

            ImGui::TableNextRow();
            ImGui::TableNextColumn();
            ImGui::PushID(Index);
            ImGui::PushTextColor(NodeColor(Node));
            if (ImGui::Selectable(Node.AttackClass.Get().GetName().ToString(), Node.AttackClass == SelectedAttack))
                SelectedAttack = Node.AttackClass;
            ImGui::PopTextColor();
            ImGui::PopID();
            ImGui::TableNextColumn();
            ImGui::Text(Node.BoundInputs);
            ImGui::TableNextColumn();
            ImGui::Text(Config != nullptr ? Config.Class.GetName().ToString() : "<none>");
            ImGui::TableNextColumn();
            ImGui::Text(AttackConfig != nullptr ? TagLeaf(AttackConfig.GetAttackDirection()) : "-");
            ImGui::TableNextColumn();
            ImGui::Text(MeleeConfig != nullptr ? MontageName(MeleeConfig.m_AttackMontage) : "-");
            ImGui::TableNextColumn();
            ImGui::Text(AttackConfig != nullptr ? DamageText(AttackConfig) : "-");
            ImGui::TableNextColumn();
            ImGui::Text(AttackConfig != nullptr ? f"{AttackConfig.GetSuperArmorDamageMultiplier()}" : "-");
            ImGui::TableNextColumn();
            ImGui::Text(LinksText(Entry, Index));
        }
        ImGui::EndTable();
    }

    private FString LinksText(const FAnimConfigToolEntry& Entry, int Index) const
    {
        FString Text;
        for (const FAnimConfigToolEdge& Edge : Entry.Edges)
        {
            if (Edge.From != Index)
                continue;
            FString Reset = Edge.Timing == EComboTiming::ResetStates ? "*" : "";
            Text += (Text.IsEmpty() ? "" : "  ") + InputLetter(Edge.Input) + Reset;
        }
        return Text.IsEmpty() ? "end" : Text;
    }

    private void DisplayAttackDetails(const FAnimConfigToolEntry& Entry, int Index)
    {
        const FAnimConfigToolNode& Node = Entry.Nodes[Index];
        UClass AttackClass = Node.AttackClass.Get();
        auto Attack = Cast<UComboAttackConfig>(AttackClass.GetDefaultObject());

        ImGui::SeparatorText("Attack");
        ImGui::Text("Class:"); ImGui::SameLine(); ImGui::Text(AttackClass.GetName().ToString());
        ImGui::Text("Source:"); ImGui::SameLine(); ImGui::Text(SourceFileOf(AttackClass));
        ImGui::Text("Ability:"); ImGui::SameLine(); ImGui::Text(ClassLabel(Attack.m_GA_Attack));

        if (!Node.BoundInputs.IsEmpty())
        {
            ImGui::Text("Bound on:"); ImGui::SameLine(); ImGui::Text(Node.BoundInputs);
        }

        ImGui::SeparatorText("Options");
        bool bAny = false;
        for (const FAnimConfigToolEdge& Edge : Entry.Edges)
        {
            if (Edge.From != Index)
                continue;

            bAny = true;
            FString Timing = Edge.Timing == EComboTiming::ResetStates ? "reset timing" : "combo window";
            ImGui::TextColored(InputColor(Edge.Input), f"{TagLeaf(Edge.Input)} ({Timing}) -> {Entry.Nodes[Edge.To].AttackClass.Get().GetName()}");
        }

        if (!bAny)
        {
            ImGui::TextDisabled("None: the chain ends here.");
        }

        ImGui::SeparatorText("Config (m_MetaData)");
        UObject Config = MetaDataOf(Node.AttackClass);
        if (Config == nullptr)
        {
            ImGui::TextColored(SeverityColor(EAnimConfigToolSeverity::Error), "No config.");
        }
        else
        {
            ImGui::Text("Class:"); ImGui::SameLine(); ImGui::Text(Config.Class.GetName().ToString());
            ImGui::Text("Source:"); ImGui::SameLine(); ImGui::Text(SourceFileOf(Config.Class));
            auto AttackConfig = Cast<UAttackConfig>(Config);
            if (AttackConfig != nullptr)
            {
                ImGui::Text("Direction:"); ImGui::SameLine(); ImGui::Text(TagLeaf(AttackConfig.GetAttackDirection()));
                ImGui::Text("Damage:"); ImGui::SameLine(); ImGui::Text(DamageText(AttackConfig));
                ImGui::Text("Super armor damage:"); ImGui::SameLine(); ImGui::Text(f"{AttackConfig.GetSuperArmorDamageMultiplier()}");
                ImGui::Text("Super armor resistance:"); ImGui::SameLine(); ImGui::Text(f"{AttackConfig.GetSuperArmorResistanceMultiplier()}");
                ImGui::Text("Knockback:"); ImGui::SameLine(); ImGui::Text(AttackConfig.CanKnockback() ? "yes" : "no");
            }
            auto MeleeConfig = Cast<UAttackMeleeConfig>(Config);
            if (MeleeConfig != nullptr)
            {
                ImGui::Text("Attack hand:"); ImGui::SameLine(); ImGui::Text(ImGui::UEnumToString(MeleeConfig.GetAttackHandle()));
                ImGui::Text("Attack montage:"); ImGui::SameLine(); ImGui::Text(MontageName(MeleeConfig.m_AttackMontage));
                ImGui::SetItemTooltip(MeleeConfig.m_AttackMontage.ToSoftObjectPath().ToString());
                ImGui::Text("Parried montage:"); ImGui::SameLine(); ImGui::Text(MontageName(MeleeConfig.m_ParriedMontage));
                ImGui::SetItemTooltip(MeleeConfig.m_ParriedMontage.ToSoftObjectPath().ToString());
                ImGui::Text("Deflected montage:"); ImGui::SameLine(); ImGui::Text(MontageName(MeleeConfig.m_DeflectedMontage));
                ImGui::SetItemTooltip(MeleeConfig.m_DeflectedMontage.ToSoftObjectPath().ToString());
            }
            auto RiposteConfig = Cast<UAttackRiposteConfig>(Config);
            if (RiposteConfig != nullptr)
            {
                ImGui::Text("Riposte montages:"); ImGui::SameLine(); ImGui::Text(f"{RiposteConfig.m_Ripostes.Num()}");
            }
        }

        ImGui::SeparatorText("Issues");
        DisplayIssues(Entry.Issues, Index);
    }

    // ---------------------------------------------------------------- GRAPH DRAWING

    private void DisplayGraph(const FAnimConfigToolEntry& Entry)
    {
        if (Entry.Cards.Num() == 0)
        {
            ImGui::TextDisabled("No bound attacks.");
            return;
        }

        const float Line = ImGui::GetTextLineHeight();
        const float CardWidth = Math::Max(240.0f, ImGui::GetFontSize() * 19.0f);
        const float CardHeight = Line * 3.0f + 18.0f;
        const float GapX = 120.0f;
        const float GapY = 18.0f;
        const float Header = Line + 10.0f;

        int Columns = 0;
        int Rows = 0;
        for (const FAnimConfigToolCard& Card : Entry.Cards)
        {
            Columns = Math::Max(Columns, Card.Column + 1);
            Rows = Math::Max(Rows, Card.Row + 1);
        }

        const FVector2D Canvas(Columns * (CardWidth + GapX), Header + Rows * (CardHeight + GapY) + CardHeight);
        const int Active = ActiveCard(Entry);

        ImGui::TextColored(InputColor(AttackCombo::DirectionTag::Top), "Top");       ImGui::SameLine();
        ImGui::TextColored(InputColor(AttackCombo::DirectionTag::Bottom), "Bottom"); ImGui::SameLine();
        ImGui::TextColored(InputColor(AttackCombo::DirectionTag::Left), "Left");     ImGui::SameLine();
        ImGui::TextColored(InputColor(AttackCombo::DirectionTag::Right), "Right");   ImGui::SameLine();
        ImGui::TextDisabled("|  thin line + * = reset timing  |  border: attack direction  |  dot: green OK, amber warning, red error, grey legacy attack  |  corner mark: same attack as the selected card");

        if (ImGui::BeginChild(f"Graph_{Entry.Label}", FVector2D(0, Math::Min(Canvas.Y + 20.0f, 680.0f)), ImGuiChildFlags::None, ImGuiWindowFlags::HorizontalScrollbar))
        {
            const FVector2D Origin = ImGui::GetCursorScreenPos();
            auto Draw = ImGui::GetWindowDrawList();

            for (int Column = 0; Column < Columns; Column++)
            {
                FString Title = Column == 0 ? "BOUND (m_Attacks)" : f"STEP {Column + 1}";
                Draw.AddText(Origin + FVector2D(Column * (CardWidth + GapX), 0), FColor(180, 190, 210), Title);
            }

            // The selected card's links are drawn last so they stay on top.
            for (int Pass = 0; Pass < 2; Pass++)
            {
                for (int LinkIndex = 0; LinkIndex < Entry.Links.Num(); LinkIndex++)
                {
                    const FAnimConfigToolLink& Link = Entry.Links[LinkIndex];
                    bool bConnected = Active != -1 && (Link.FromCard == Active || Link.ToCard == Active);
                    if (bConnected == (Pass == 1))
                        DrawLink(Entry, LinkIndex, Active, Origin, CardWidth, CardHeight, GapX, GapY, Header);
                }
            }

            for (int Index = 0; Index < Entry.Cards.Num(); Index++)
            {
                DrawCard(Entry, Index, Active, CardPosition(Entry.Cards[Index], Origin, CardWidth, CardHeight, GapX, GapY, Header), FVector2D(CardWidth, CardHeight));
            }

            ImGui::SetCursorScreenPos(Origin);
            ImGui::Dummy(Canvas);
        }
        ImGui::EndChild();
    }

    private FVector2D CardPosition(const FAnimConfigToolCard& Card, FVector2D Origin, float CardWidth, float CardHeight, float GapX, float GapY, float Header) const
    {
        return Origin + FVector2D(Card.Column * (CardWidth + GapX), Header + Card.Row * (CardHeight + GapY));
    }

    private void DrawLink(const FAnimConfigToolEntry& Entry, int LinkIndex, int Active, FVector2D Origin, float CardWidth, float CardHeight, float GapX, float GapY, float Header)
    {
        const FAnimConfigToolLink& Link = Entry.Links[LinkIndex];
        const FAnimConfigToolEdge& Edge = Entry.Edges[Link.Edge];
        const FAnimConfigToolCard& From = Entry.Cards[Link.FromCard];
        const FAnimConfigToolCard& To = Entry.Cards[Link.ToCard];
        const bool bReset = Edge.Timing == EComboTiming::ResetStates;
        auto Draw = ImGui::GetWindowDrawList();

        // Links that don't touch the selected card fade out; the rest keep their normal look.
        const bool bConnected = Active != -1 && (Link.FromCard == Active || Link.ToCard == Active);
        FColor Color = InputColor(Edge.Input);
        if (Active != -1 && !bConnected)
            Color = FColor(Color.R, Color.G, Color.B, 50);
        const float Thickness = bReset ? 1.0f : 2.0f;
        const float Arrow = 10.0f;

        // Spread a card's outgoing links so their labels don't overlap.
        int Slot = 0;
        int SlotCount = 0;
        for (int Other = 0; Other < Entry.Links.Num(); Other++)
        {
            if (Entry.Links[Other].FromCard != Link.FromCard)
                continue;
            if (Other < LinkIndex)
                Slot++;
            SlotCount++;
        }
        const float Line = ImGui::GetTextLineHeight();
        const float Spread = (Slot - (SlotCount - 1) * 0.5f) * (Line + 2.0f);

        const FVector2D Start = CardPosition(From, Origin, CardWidth, CardHeight, GapX, GapY, Header) + FVector2D(CardWidth, CardHeight * 0.5f + Spread * 0.5f);
        const FVector2D End = CardPosition(To, Origin, CardWidth, CardHeight, GapX, GapY, Header) + FVector2D(0, CardHeight * 0.5f);

        FVector2D Control1;
        FVector2D Control2;
        if (To.Column > From.Column)
        {
            Control1 = Start + FVector2D(GapX * 0.5f, 0);
            Control2 = End - FVector2D(GapX * 0.5f, 0);
        }
        else
        {
            // Loop link back to an earlier card: loop under the cards.
            const float Drop = CardHeight + GapY + 8.0f * Slot;
            Control1 = Start + FVector2D(GapX * 0.8f, Drop);
            Control2 = End + FVector2D(-GapX * 0.8f, Drop);
        }
        Draw.AddBezierCubic(Start, Control1, Control2, End, Color, Thickness);

        // Arrow head along the curve's end tangent.
        FVector2D Tangent = End - Control2;
        float Length = Math::Sqrt(Tangent.X * Tangent.X + Tangent.Y * Tangent.Y);
        FVector2D Forward = Length > 0.01f ? Tangent / Length : FVector2D(1, 0);
        FVector2D Side(-Forward.Y, Forward.X);
        Draw.AddTriangleFilled(End, End - Forward * Arrow + Side * (Arrow * 0.5f), End - Forward * Arrow - Side * (Arrow * 0.5f), Color);

        FString Label = InputLetter(Edge.Input) + (bReset ? "*" : "");
        Draw.AddText(Start + FVector2D(6, Spread * 0.5f - Line), Color, Label);
    }

    private void DrawCard(const FAnimConfigToolEntry& Entry, int CardIndex, int Active, FVector2D Position, FVector2D Size)
    {
        const int NodeIndex = Entry.Cards[CardIndex].Node;
        const FAnimConfigToolNode& Node = Entry.Nodes[NodeIndex];
        auto Draw = ImGui::GetWindowDrawList();
        const float Line = ImGui::GetTextLineHeight();

        UObject Config = MetaDataOf(Node.AttackClass);
        auto MeleeConfig = Cast<UAttackMeleeConfig>(Config);
        FString Direction = MeleeConfig != nullptr ? TagLeaf(MeleeConfig.GetAttackDirection()) : "-";
        FString Montage = MeleeConfig != nullptr ? MontageName(MeleeConfig.m_AttackMontage) : (Config != nullptr ? Config.Class.GetName().ToString() : "<no config>");
        FColor Border = MeleeConfig != nullptr ? InputColor(MeleeConfig.GetAttackDirection()) : FColor(110, 118, 130);

        Draw.AddRectFilled(Position, Position + Size, Border, 5.0f);
        Draw.AddRectFilled(Position + FVector2D(2, 2), Position + Size - FVector2D(2, 2), FColor(30, 35, 43), 4.0f);

        if (CardIndex == Active)
        {
            Draw.AddRect(Position - FVector2D(3, 3), Position + Size + FVector2D(3, 3), FColor(255, 255, 255), 6.0f, 0, 2.0f);
        }
        else if (Active != -1 && Entry.Cards[Active].Node == NodeIndex)
        {
            // Another card of the selected attack.
            Draw.AddRect(Position - FVector2D(3, 3), Position + Size + FVector2D(3, 3), FColor(255, 255, 255), 6.0f, 0, 1.0f);
            Draw.AddTriangleFilled(Position + FVector2D(Size.X - 18, 0), Position + FVector2D(Size.X, 0), Position + FVector2D(Size.X, 18), FColor(255, 255, 255));
        }

        // Status dot before the name.
        const FVector2D Dot = Position + FVector2D(10, 6 + Line * 0.5f - 5.0f);
        Draw.AddRectFilled(Dot, Dot + FVector2D(10, 10), NodeColor(Node), 5.0f);

        FString Title = Node.AttackClass.Get().GetName().ToString();
        if (!Node.BoundInputs.IsEmpty())
            Title = f"[{Node.BoundInputs}] {Title}";

        ImGui::PushClipRect(Position + FVector2D(8, 4), Position + Size - FVector2D(8, 4), true);
        Draw.AddText(Position + FVector2D(26, 6), FColor(235, 238, 245), Title);
        Draw.AddText(Position + FVector2D(10, 8 + Line), FColor(225, 230, 240), f"attacks {Direction}");
        Draw.AddText(Position + FVector2D(10, 10 + Line * 2.0f), FColor(170, 178, 192), Montage);
        ImGui::PopClipRect();

        ImGui::SetCursorScreenPos(Position);
        ImGui::PushID(CardIndex);
        if (ImGui::InvisibleButton("Card", Size))
        {
            if (CardIndex == Active)
            {
                SelectedAttack = TSubclassOf<UComboAttackConfig>();
                SelectedCard = -1;
            }
            else
            {
                SelectedAttack = Node.AttackClass;
                SelectedCard = CardIndex;
            }
        }
        ImGui::SetItemTooltip(f"{Node.AttackClass.Get().GetName()}\nConfig: {ClassLabel(Cast<UComboAttackConfig>(Node.AttackClass.Get().GetDefaultObject()).m_MetaData)}\nClick to select, click again to clear.");
        ImGui::PopID();
    }
}

#endif
#endif
