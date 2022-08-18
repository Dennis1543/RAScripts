// Diner Dash: Flo on the Go
// #ID = 20263

// $138824: [32 BIT] Level Timer / Phases
//          0x0 = Start (Full Timer)
//          0x1 = First Phase Done (~1/3 Timer Gone)
//          0x2 = Second Phase Done (~2/3 Timer Gone)
//          0x3 = Closed (Empty Timer)
//          0xfffffffff = Not In Level (Haven't Pressed 'Let's Play!' Yet)
//          (Note: If Choosing "Try Again", goes from 0x3 to 0x0, does not reset to 0xffffffff.
//          If choosing "Restart Level", goes from whatever value it was previously to 0x0)
// $138E2C: [32 BIT] Sound Effects Volume
//          0x1000 = 100% (Full Meter)
//          0x0000 = 0% (Muted)
//          (Note: This value goes to 0 and back up to its settings value during scene transitions)
// $14DC40: Suspicious block of memory (scores?)
// $15F0DC: block of pointers
// $15FA68: [32 BIT] Screen Location ID
//          0x01 = Title Screen Menus
//          0x02 = Selecting a Restaurant (Endless and Story Mode)
//          0x1c = Screen Before Gameplay (with 'Let's Play' Button)
//          0x1d = Screen Before Gameplay Moving Down Onto Screen
//          0x1f = Post-Level Screen (Story)
//          0x26 = In Restaurant (Gameplay) 
//          0x29 = Post-Level Screen (Endless)
// $161979: [8 BIT] A Button Input
//          0x10 = A Button Pressed
//          0x00 = A Button Not Pressed
// $16197D: [8 BIT] B Button Input
//          0x10 = B Button Pressed
//          0x00 = B Button Not Pressed
// $161981: [8 BIT] X Button Input
//          0x10 = X Button Pressed
//          0x00 = X Button Not Pressed
// $161985: [8 BIT] Y Button Input
//          0x10 = Y Button Pressed
//          0x00 = Y Button Not Pressed
// $161991: [8 BIT] L Button Input
//          0x10 = L Button Pressed
//          0x00 = L Button Not Pressed
// $161995: [8 BIT] R Button Input
//          0x10 = R Button Pressed
//          0x00 = R Button Not Pressed
// $1619A9: [8 BIT] Up D-Pad Input
//          0x10 = Up D-Pad Pressed
//          0x00 = Up D-Pad Not Pressed
// $1619AD: [8 BIT] Down D-Pad Input
//          0x10 = Down D-Pad Pressed
//          0x00 = Down D-Pad Not Pressed
// $1619B1: [8 BIT] Left D-Pad Input
//          0x10 = Left D-Pad Pressed
//          0x00 = Left D-Pad Not Pressed
// $1619B5: [8 BIT] Right D-Pad Input
//          0x10 = Right D-Pad Pressed
//          0x00 = Right D-Pad Not Pressed
// $1619C9: [8 BIT] Select Button Input
//          0x10 = Select Button Pressed
//          0x00 = Select Button Not Pressed
// $1619CD: [8 BIT] Start Button Input
//          0x10 = Start Button Pressed
//          0x00 = Start Button Not Pressed
// $1619DD: [8 BIT] Screen Being Tapped
//          0x10 = Screen Tap
//          0x00 = No Screen Tap
// $1620D4: [24 BIT PTR] Level Goals
//          [32 BIT] Goal: 0x0 Offset
//          [32 BIT] Expert Goal: 0x4 Offset
// $162EDC: [24 BIT PTR] Level Stats
//          [32 BIT] TOTAL Score (score in all levels in this world): 0x0 Offset
//          [32 BIT] Score from Other Levels (score from levels that aren't this one) : 0x8 Offset
//          ( Therefore, Current Level Score = Offset(0x0) - Offset(0x8) )
//          [32 BIT] Tables Served: 0xC Offset
//          [32 BIT] Tables Lost: 0x10 Offset
//          [32 BIT] Last Flo State: 0x18 Offset
//          0x0 = Giving High Chair OR Using Phone
//          0x1 = Grab Order Ticket
//          0x2 = Serve Food
//          0x3 = Serve Dessert
//          0x4 = Clean Table
//          0x5 = Get Check
//          0x6 = Serving Drinks
//          0x7 = Serving Appetizer
//          0x8 = Cleaning Spill
//          0x9 = Fanning Tourists
//          0xa = Level Start (Nothing Done Yet)
//          [32 BIT] Current Combo: 0x1C offset
// $162F70: Save Data Error Flag?
//          (Changing this value from 0 causes a "save data could not be accessed" error)
// $1A81C4: [32 BIT] Music Volume
//          0x7f = 100% (Full Music Meter)
//          0x00 = 0% (Muted)
//          (Note: This value goes to 0 and back up to its settings value during scene transitions)
// $2BB70C: [8 BIT] Restaurant Gameplay Paused
//          0x01 = Paused (End Level Screen, Pre-Level Screen, Flo's Closet, Menus, etc.)
//          0x00 = Not Paused (Actively Playing)
// $2BB720: [8 BIT] Mode Select on Restaurant Select Screen
//          0x00 = Story Mode
//          0x01 = Endless Mode
// $2BB73C: [32 BIT] World Select
//          0x00 = Cruise Ship
//          0x01 = Train
//          0x02 = Submarine
//          0x03 = Blimp
//          0x04 = Spaceship
// $2BB740: [32 BIT] Level Number (Story Mode, 0 Indexed) OR Difficulty (Endless Mode)
//          Endless Mode:
//          0x00 = Easy
//          0x01 = Medium
//          0x02 = Hard
// $2DF054: Level Select Something???

function currentLocation() => dword(0x2BB73C)
Cruise_Ship = 0
Train = 1
Submarine = 2
Blimp = 3
Spaceship = 4

// Current World Level, 0 Indexed (Story Mode)
// Endless Mode Difficulty (0x0 = Easy, 0x1 = Medium, 0x2 = Hard)
function currentLevelNumber() => dword(0x2BB740)

function currentCombo() => dword(tbyte(0x162EDC) + 0x1C)

function currentScreen() => dword(0x15FA68)
Title_Screen_Menus = 0x01
Restaurant_Select = 0x02
Screen_Before_Gameplay = 0x1c
Restaurant_Gameplay = 0x26
Post_Level_Story = 0x1f
Post_Level_Endless = 0x29

function currentLevelGoal() => dword(tbyte(0x1620D4))
function currentLevelExpertGoal() => dword(tbyte(0x1620D4) + 0x4)
function currentTotalScore() => dword(tbyte(0x162EDC))
function currentScoreOtherLevels() => dword(tbyte(0x162EDC) + 0x8)
function currentTablesLost() =>  dword(tbyte(0x162EDC) + 0x10)

function currentFloAction() => dword(tbyte(0x162EDC) + 0x18)
Giving_High_Chair_or_Using_Phone = 0x0
Grab_Order_Ticket = 0x1
Serve_Food = 0x2
Serve_Dessert = 0x3
Clean_Table = 0x4
Get_Check = 0x5
Serving_Drinks = 0x6
Serving_Appetizer = 0x7
Cleaning_Spill = 0x8
Taking_Picture = 0x9
Level_Start = 0xa

//Subtract total sum of score from the score earned from previous levels to get current level score.
function currentLevelScore()
{
    totalscore = dword(tbyte(0x162EDC))
    scorefromotherlevels = dword(tbyte(0x162EDC) + 0x8)
    return totalscore - scorefromotherlevels
}

function gameplayMode() => byte(0x2BB720)
Story = 0
Endless = 1
   
   
LocationNumToName = {
                        0: "Cruise Ship", 1: "Train", 2: "Submarine", 3: "Blimp", 4: "Spaceship"
                    }
                    
LevelNumToEndlessDifficulty = {
                                0: "Easy", 1: "Medium", 2: "Hard"
                              }               

// PROGRESSION CLEARS

//1.1 Clear
achievement(title = "So Much For Our Vacation...", description = "Clear Cruise Ship Level 1.", points = 1,
                id = 0, badge = "00000", published = "13/8/2022", modified = "13/8/2022",
                trigger = currentLocation() == Cruise_Ship && currentLevelNumber() == 0 && gameplayMode() == Story
                && currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore()
)

//1.5 Clear
achievement(title = "Something to Take the Edge Off", description = "Clear Cruise Ship Level 5.", points = 5,
                id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
                trigger = currentLocation() == Cruise_Ship && currentLevelNumber() == 4 && gameplayMode() == Story
                && currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore()
)

//1.10 Clear
achievement(title = "Sail-abrate Good Times, Come On!", description = "Clear Cruise Ship Level 10.", points = 10,
                id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
                trigger = currentLocation() == Cruise_Ship && currentLevelNumber() == 9 && gameplayMode() == Story
                && currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore()
)

//2.1 Clear
achievement(title = "All Aboard!", description = "Clear Train Level 1.", points = 2,
                id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
                trigger = currentLocation() == Train && currentLevelNumber() == 0 && gameplayMode() == Story
                && currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore()
)

//2.5 Clear
achievement(title = "A Server AND a Hostess?!", description = "Clear Train Level 5.", points = 5,
                id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
                trigger = currentLocation() == Train && currentLevelNumber() == 4 && gameplayMode() == Story
                && currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore()
)

//2.10 Clear
achievement(title = "Grand Central Serving Saviour", description = "Clear Train Level 10.", points = 10,
                id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
                trigger = currentLocation() == Train && currentLevelNumber() == 9 && gameplayMode() == Story
                && currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore()
)

//3.1 Clear
achievement(title = "An Underwater Adventure?!", description = "Clear Submarine Level 1.", points = 3,
                id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
                trigger = currentLocation() ==  Submarine && currentLevelNumber() ==  0 && gameplayMode() == Story
                && currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore()
)

//3.5 Clear
achievement(title = "Sorbet, If I May", description = "Clear Submarine Level 5.", points = 5,
                id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
                trigger = currentLocation() == Submarine && currentLevelNumber() ==  4 && gameplayMode() == Story
                && currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore()
)

//3.10 Clear
achievement(title = "Going With The Flo", description = "Clear Submarine Level 10.", points = 10,
                id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
                trigger = currentLocation() == Submarine && currentLevelNumber() == 9 && gameplayMode() == Story
                && currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore()
)

//4.1 Clear
achievement(title = "My Milkshake Brings All the Boys to the Blimp", description = "Clear Blimp Level 1.", points = 4,
                id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
                trigger = currentLocation() == Blimp && currentLevelNumber() == 0 && gameplayMode() == Story
                && currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore()
)

//4.5 Clear
achievement(title = "Who You Gonna Call?", description = "Clear Blimp Level 5.", points = 5,
                id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
                trigger = currentLocation() == Blimp && currentLevelNumber() == 4 && gameplayMode() == Story
                && currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore()
)

//4.10 Clear
achievement(title = "What's the Deal with Airline Food?", description = "Clear Blimp Level 10.", points = 10,
                id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
                trigger = currentLocation() == Blimp && currentLevelNumber() == 9 && gameplayMode() == Story
                && currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore()
)

//5.1 Clear
achievement(title = "Finally, an Extra Set of Hands!", description = "Clear Spaceship Level 1.", points = 5,
                id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
                trigger = currentLocation() == Spaceship && currentLevelNumber() == 0 && gameplayMode() == Story
                && currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore()
)

//5.5 Clear
achievement(title = "Less Tables, More Problems", description = "Clear Spaceship Level 5.", points = 10,
                id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
                trigger = currentLocation() == Spaceship && currentLevelNumber() == 4 && gameplayMode() == Story
                && currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore()
)

//5.10 Clear
achievement(title = "Outta This World Serving Skills", description = "Clear Spaceship Level 10.", points = 10,
                id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
                trigger = currentLocation() == Spaceship && currentLevelNumber() == 9 && gameplayMode() == Story
                && currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore()
)

//END PROGRESSION CLEARS




//EXPERT CLEARS

ExpertClearPointVals = [1,2,3,4,5,5,5,5,5,10,
                        2,3,4,5,5,5,5,5,10,10,
                        3,4,5,5,5,5,5,10,10,10,
                        4,5,5,5,5,5,10,10,10,10,
                        5,5,5,5,5,10,10,10,10,25
                        ]


for world in range(0, 4)
{
    for index in range(0,9)
    {    
        achievement(title = "Master Chef - " + LocationNumToName[world] +  " " + (index + 1), description = "Clear the expert goal on level " + (world + 1) + "." + (index + 1), points = ExpertClearPointVals[index + world*10],
                id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
                trigger = gameplayMode() == Story && currentLocation() == world && currentLevelNumber() == index 
                && currentScreen() == Post_Level_Story && currentLevelExpertGoal() <= currentLevelScore()
        )
    }
}

//END EXPERT CLEARS



//ENDLESS GOALS
for world in range(0, 4)
{
     achievement(title = "Never-Ending " + LocationNumToName[world] + " Shift", description = "Finish with at least 60,000 points in Endless Shift mode on the " + LocationNumToName[world] + ".", points = 10,
              id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
              trigger = gameplayMode() == Endless && currentLocation() == world && currentScreen() == Post_Level_Endless
              && currentLevelScore() >= 60000
     )
}


//END ENDLESS GOALS

//Total Score Goal
achievement(title = "How Much of This is Taxable?", description = "Reach a total score of 250,000 in Story Mode.", points = 5,
              id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
              trigger = gameplayMode() == Story && currentScreen() == Post_Level_Story && currentTotalScore() >= 250000 && currentScoreOtherLevels() < 250000
     )

//Endless Shift Combo
achievement(title = "Dressed to the Nines", description = "Reach a Combo of x9 in any Endless Shift stage.", points = 5,
              id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
              trigger = gameplayMode() == Endless && currentScreen() == Restaurant_Gameplay && currentCombo() >= 9
     )

//World 1 Challenges

achievement(title = "Seaside Sobriety", description = "Clear Level 1.7 without picking up any drinks.", points = 3,
              id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
              trigger = gameplayMode() == Story && currentLocation() == Cruise_Ship && currentLevelNumber() == 6 && currentScreen() != Title_Screen_Menus && currentScreen() != Restaurant_Select &&
              disable_when(currentFloAction() == Serving_Drinks, until= currentScreen() == 0x1d) &&
              trigger_when(currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore())
     )
     
achievement(title = "No Flash Photography, Please", description = "Clear Level 1.8 without taking any pictures for tourists.", points = 3,
              id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
              trigger = gameplayMode() == Story && currentLocation() == Cruise_Ship && currentLevelNumber() == 7 && currentScreen() != Title_Screen_Menus && currentScreen() != Restaurant_Select &&
              disable_when(currentFloAction() == Taking_Picture, until= currentScreen() == 0x1d) &&
              trigger_when(currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore())
     )
     
achievement(title = "Not So Family Friendly", description = "Clear Level 1.9 without picking up any high chairs.", points = 5,
              id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
              trigger = gameplayMode() == Story && currentLocation() == Cruise_Ship && currentLevelNumber() == 8 && currentScreen() != Title_Screen_Menus && currentScreen() != Restaurant_Select &&
              disable_when(currentFloAction() == Giving_High_Chair_or_Using_Phone, until= currentScreen() == 0x1d) &&
              trigger_when(currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore())
     )     

//World 2 Challenges

achievement(title = "Passin' Through a Dry County", description = "Clear Level 2.7 without picking up any drinks.", points = 5,
              id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
              trigger = gameplayMode() == Story && currentLocation() == Train && currentLevelNumber() == 6 && currentScreen() != Title_Screen_Menus && currentScreen() != Restaurant_Select &&
              disable_when(currentFloAction() == Serving_Drinks, until= currentScreen() == 0x1d) &&
              trigger_when(currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore())
     )
     
achievement(title = "Desserts? No, Those Are Just For Decoration", description = "Clear Level 2.8 without picking up any desserts.", points = 5,
              id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
              trigger = gameplayMode() == Story && currentLocation() == Train && currentLevelNumber() == 7 && currentScreen() != Title_Screen_Menus && currentScreen() != Restaurant_Select &&
              disable_when(currentFloAction() == Serve_Dessert, until= currentScreen() == 0x1d) &&
              trigger_when(currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore())
     )
     
achievement(title = "Supporting Yourself", description = "Clear Level 2.9 without using the phone and without picking up any high chairs.", points = 10,
              id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
              trigger = gameplayMode() == Story && currentLocation() == Train && currentLevelNumber() == 8 && currentScreen() != Title_Screen_Menus && currentScreen() != Restaurant_Select &&
              disable_when(currentFloAction() == Giving_High_Chair_or_Using_Phone, until= currentScreen() == 0x1d) &&
              trigger_when(currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore())
     )     

//World 3 Challenges

achievement(title = "A Bad Batch of Shrimp", description = "Clear Level 3.7 without picking up any Shrimp Cocktails.", points = 5,
              id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
              trigger = gameplayMode() == Story && currentLocation() == Submarine && currentLevelNumber() == 6 && currentScreen() != Title_Screen_Menus && currentScreen() != Restaurant_Select &&
              disable_when(currentFloAction() == Serving_Appetizer, until= currentScreen() == 0x1d) &&
              trigger_when(currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore())
     )
     
achievement(title = "Father and Son Day Sorbets", description = "In Level 3.8, reach a combo of x3 serving desserts.", points = 5,
              id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
              trigger = gameplayMode() == Story && currentLocation() == Submarine && currentLevelNumber() == 7 && currentScreen() == Restaurant_Gameplay &&
              trigger_when(currentFloAction() == Serve_Dessert && currentCombo() >= 3)              
     )
     
achievement(title = "We're Underwater, It'll Clean Itself", description = "Clear Level 3.9 without picking up the mop.", points = 5,
              id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
              trigger = gameplayMode() == Story && currentLocation() == Submarine && currentLevelNumber() == 8 && currentScreen() != Title_Screen_Menus && currentScreen() != Restaurant_Select &&
              disable_when(currentFloAction() == Cleaning_Spill, until= currentScreen() == 0x1d) &&
              trigger_when(currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore())            
     )

//World 4 Challenges

achievement(title = "Lactose Intolerant", description = "Clear Level 4.7 without picking up any milkshakes.", points = 5,
              id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
              trigger = gameplayMode() == Story && currentLocation() == Blimp && currentLevelNumber() == 6 && currentScreen() != Title_Screen_Menus && currentScreen() != Restaurant_Select &&
              disable_when(currentFloAction() == Serving_Drinks, until= currentScreen() == 0x1d) &&
              trigger_when(currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore())
     )
     
achievement(title = "I'm My Own Table Busser", description = "In Level 4.8, clean 6 tables in a row.", points = 5,
              id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
              trigger = gameplayMode() == Story && currentLocation() == Blimp && currentLevelNumber() == 7 && currentScreen() == Restaurant_Gameplay &&
              trigger_when(currentFloAction() == Clean_Table && currentCombo() >= 6)              
     )
     
achievement(title = "No Dessert For Picky Customers", description = "Clear Level 4.9 without picking up any desserts.", points = 5,
              id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
              trigger = gameplayMode() == Story && currentLocation() == Blimp && currentLevelNumber() == 8 && currentScreen() != Title_Screen_Menus && currentScreen() != Restaurant_Select &&
              disable_when(currentFloAction() == Serve_Dessert, until= currentScreen() == 0x1d) &&
              trigger_when(currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore())
     )

//World 5 Challenges
achievement(title = "Crème Brûlée? Not Today", description = "Clear Level 5.7 without picking up any desserts.", points = 5,
              id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
              trigger = gameplayMode() == Story && currentLocation() == Spaceship && currentLevelNumber() == 6 && currentScreen() != Title_Screen_Menus && currentScreen() != Restaurant_Select &&
              disable_when(currentFloAction() == Serve_Dessert, until= currentScreen() == 0x1d) &&
              trigger_when(currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore())
     )
     
achievement(title = "Stalling For Time", description = "In Level 5.8, serve 6 drinks in a row.", points = 5,
              id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
              trigger = gameplayMode() == Story && currentLocation() == Spaceship && currentLevelNumber() == 7 && currentScreen() == Restaurant_Gameplay &&
              trigger_when(currentFloAction() == Serving_Drinks && currentCombo() >= 6)              
     )

achievement(title = "The Kitchen's A Bit Backed Up", description = "In Level 5.9, serve 7 dishes in a row.", points = 5,
              id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
              trigger = gameplayMode() == Story && currentLocation() == Spaceship && currentLevelNumber() == 8 && currentScreen() == Restaurant_Gameplay &&
              trigger_when(currentFloAction() == Serve_Food && currentCombo() >= 7)              
     )

function flawlessPoints(world)
{
    if(world == 4)
    {
        return 25
    }
    else
    {
        return 10
    }
}


//No Table Miss Achievements
for world in range(0, 4)
{
     achievement(title = "Flawless Flo " + (world + 1), description = "Clear Level " + (world + 1) +".10 without losing any tables.", points = flawlessPoints(world),
              id = 0, badge = "00000", published = "16/8/2022", modified = "16/8/2022",
              trigger = gameplayMode() == Story && currentLocation() == world && currentLevelNumber() == 9 && currentScreen() != Title_Screen_Menus && currentScreen() != Restaurant_Select &&
              disable_when(currentTablesLost() != 0, until= currentScreen() == 0x1d) &&
              trigger_when(currentScreen() == Post_Level_Story && currentLevelGoal() <= currentLevelScore())
     )
}
     

//Leaderboards for each level 0-9, and each world 0-4.
for world in range(0, 4)
{
    for index in range(0,9)
    {
        leaderboard(LocationNumToName[world] + " Level " + index + 1, "Earn the highest score on Level " + world + 1 + "." + index + 1,
        start = gameplayMode() == Story && currentLocation() == world && currentLevelNumber() == index && currentScreen() == Restaurant_Gameplay, 
        cancel = (currentScreen() == 0x1d) || (currentScreen() == Title_Screen_Menus),
        submit = currentScreen() == Post_Level_Story, 
        value = currentLevelScore()
        )
    }
}

//Leaderboard for Endless Modes
for world in range(0, 4)
{
    for difficulty in range(0,2)
    {
        leaderboard(LocationNumToName[world] + " Endless Mode (" + LevelNumToEndlessDifficulty[difficulty] + ")", 
        "Earn the highest score on the " + LocationNumToName[world] + " in Endless Mode on " + LevelNumToEndlessDifficulty[difficulty] + ".",
        start = gameplayMode() == Endless && currentLocation() == world && currentLevelNumber() == difficulty && currentScreen() == Restaurant_Gameplay && prior(currentScreen()) != Post_Level_Endless, 
        cancel = (currentScreen() == 0x1d) || (currentScreen() == Title_Screen_Menus),
        submit = currentScreen() == Post_Level_Endless, 
        value = currentLevelScore()
        )
    }
}


//RP
rich_presence_conditional_display( currentScreen() == Title_Screen_Menus, "Browsing the Menus.")
rich_presence_conditional_display( currentScreen() == Restaurant_Select, "Selecting a Restaurant.")
rich_presence_conditional_display(  (currentScreen() == Screen_Before_Gameplay || 
                                   currentScreen() == Restaurant_Gameplay || 
                                   currentScreen() == Post_Level_Story|| 
                                   currentScreen() == 0x1d) && gameplayMode() == Story , "Diner Dashing on the {0} in Story Mode Level {1}.{2}, 💰={3}.",
                                   rich_presence_lookup("World", currentLocation(), LocationNumToName),
                                   rich_presence_value("World Number", currentLocation() + 1),
                                   rich_presence_value("Level Number", currentLevelNumber() + 1),
                                   rich_presence_value("Current Score", currentLevelScore())
                                   )
rich_presence_conditional_display(  (currentScreen() == Screen_Before_Gameplay || 
                                   currentScreen() == Restaurant_Gameplay || 
                                   currentScreen() == Post_Level_Endless|| 
                                   currentScreen() == 0x1d) && gameplayMode() == Endless , "Diner Dashing on the {0} in Endless Mode on {1}, 💰={2}.",
                                   rich_presence_lookup("World", currentLocation(), LocationNumToName),
                                   rich_presence_lookup("Difficulty", currentLevelNumber(), LevelNumToEndlessDifficulty),
                                   rich_presence_value("Current Score", currentLevelScore())
                                   )


rich_presence_display( "Playing Diner Dash Flo on the Go.") //Basic default catch case  
