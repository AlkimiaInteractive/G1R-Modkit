
namespace LevelFormula
{
    namespace Tests
    {
        // In the original games you could reach level ~60 at best, choose a
        // save maxlevel to test up to here.
        const int SAVE_MAXLEVEL = 100;

        void Test_ExperienceRequiredForLevel(FUnitTest& T)
        {
            
            const UWorldDefinition WorldDefinition = AG1RGameState::GetWorldDefinition(GetCurrentWorld());

            if (WorldDefinition == nullptr)
                return;
            
            T.AssertEquals(WorldDefinition.ExperienceRequiredForLevel(0), 0);

            // Assert that increasing amounts of XP are required for each level
            for (int i = 0; i < SAVE_MAXLEVEL; i++)
            {
                T.AssertLessThan(WorldDefinition.ExperienceRequiredForLevel(i), 
                                 WorldDefinition.ExperienceRequiredForLevel(i + 1));
            }
        }

        void Test_LevelFromExperience(FUnitTest& T)
        {
            const UWorldDefinition WorldDefinition = AG1RGameState::GetWorldDefinition(GetCurrentWorld());

            if (WorldDefinition == nullptr)
                return;
            
            T.AssertEquals(WorldDefinition.ExperienceRequiredForLevel(0), 0);
            T.AssertEquals(WorldDefinition.ExperienceRequiredForLevel(1), 500);

            T.AssertEquals(WorldDefinition.LevelFromExperience(499), 0);
            T.AssertEquals(WorldDefinition.LevelFromExperience(500), 1);

            for (int i = 0; i < SAVE_MAXLEVEL; i++)
            {
                T.AssertEquals(WorldDefinition.LevelFromExperience(WorldDefinition.ExperienceRequiredForLevel(i)), i);

                // Test that there is no greater vs. greater-or-equal issue at level boundries.
                T.AssertEquals(WorldDefinition.LevelFromExperience(WorldDefinition.ExperienceRequiredForLevel(i) - 1), Math::Max(0, i - 1)); // 1 XP less -> 1 level less
                T.AssertEquals(WorldDefinition.LevelFromExperience(WorldDefinition.ExperienceRequiredForLevel(i) + 1), i);                    // 1 XP more -> Same level
            }
        }
    }
}