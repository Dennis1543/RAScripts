// Beat City [Nintendo_DS]
// #ID = 19147
// (Europe) md5 Hash: e5f77bd1a09557f89214ed23f605a63a
// Author: Dennis1543 (Taylor1543)



// $0E5693: [BITFLAG] Tutorials On/Off
//          0x00 = Tutorials Off
//          0x01 = Tutorials On (Default)
achievement(title = "Don't Tell Me What To Do!", description = "Turn off the tutorials in the options menu.", points = 1,
                id = 0, badge = "00000", published = "24/7/2022", modified = "24/7/2022",
                trigger = byte(0x0e58d0) == 0x21 && //On the Options Menu
                prev(byte(0x0e5693)) == 0x01 && //Tutorials on previous frame
                byte(0x0e5693) == 0x00 //Tutorials off   
)

// $0E56D4: [8 BIT] Beat Album Unlocks
//          Bit 0 = Synchronizer
//          Bit 1 = Groovy Whale
//          Bit 2 = Beatrice
//          Bit 3 = Dame Isolde
//          Bit 4 = Discord Troops
//          Bit 5 = Mimes
//          Bit 6 = Beat Heart
//          Bit 7 = Hippos of Love
// $0E56D5: [8 BIT] Beat Album Unlocks 2
//          Bit 0 = Mr. Cool Trunk
//          Bit 1 = Yellow Submarine
//          Bit 2 = Smooth Moves
//          Bit 3 = Blue Wiener
//          Bit 4 = Moody Birds
//          Bit 5 = The Walrus
//          Bit 6 = Bee Costume
//          Bit 7 = Sushi Sumo
// $0E56D6: [8 BIT] Beat Album Unlocks 3
//          Bit 0 = Silly Seal
//          Bit 1 = Walking Car
//          Bit 2 = Party Animals
//          Bit 3 = Jamming Pines
//          Bit 4 = Synch-O-Bot
//          Bit 5 = Cosmic Whale
function albumUnlockCount()
{
    return measured(
        bitcount(0x0E56D4) + bitcount(0x0E56D5) + bit0(0x0E56D6) + bit1(0x0E56D6) +
        bit2(0x0E56D6) + bit3(0x0E56D6) + bit4(0x0E56D6) + bit5(0x0E56D6) == 22
    )
}

function prioralbumUnlockCount()
{
    return prior(
        bitcount(0x0E56D4) + bitcount(0x0E56D5) + bit0(0x0E56D6) + bit1(0x0E56D6) +
        bit2(0x0E56D6) + bit3(0x0E56D6) + bit4(0x0E56D6) + bit5(0x0E56D6)
    )
}

achievement(title = "Beat City Biographer", description = "Unlock all of the items in the Beat Album.", points = 25,
                id = 0, badge = "00000", published = "24/7/2022", modified = "24/7/2022",
                trigger = albumUnlockCount() && prioralbumUnlockCount() != 0 //if prev is 0, loading in from save (can't check if prev() == 21, since you can earn >1 in a frame)
)



// THIS ACHIEVEMENT NEEDED A SUBSOURCE 1, ADDED IN EDITOR AS RATOOLS AUTOMATICALLY CHANGED THE SUBTRACTION


// $0E56D8: [16 BIT] Stairway Star Count
//          (This is the count of TOTAL Stars, but you are given one at the start of the game for free. Therefore, need 233 to have all stars collected)
//          0x00e9 = 232/232 Stars Collected{}
//function starCount()
//{
//   return measured(
//        word(0x0E56D8) - 1 == 0x00e8
//    )
//}

//function prevStarCount()
//{
//    return prev(
//        word(0x0E56D8) - 1
//    )
//}

//achievement(title = "Ground Control to Major Groove", description = "Finish the stairway to heaven by collecting every star.", points = 50,
//               id = 0, badge = "00000", published = "24/7/2022", modified = "24/7/2022",
//                trigger = starCount() && prevStarCount() == 0x00e7 //if prev is 0, loading in from save (can't check if prev() == 21, since you can earn >1 in a frame)
//)




// $0E56DC: [32 BIT] Tutorial Check
//          0xffffffff = In-Game, not Tutorial
//          0x00000000 = In Tutorial

// $0E56F0: [8 BIT] Minigame ID
//          0x00 = Heart Beat
//          0x01 = Lovers' Poem
//          0x02 = Cool Trunk of Joy
//          0x03 = Toilet Break
//          0x04 = Staring Contest
//          0x05 = Funky Mannequins
//          0x06 = Hit Haircuts
//          0x07 = Crow Choir
//          0x08 = Zoo Blues
//          0x09 = Touch of Magic
//          0x0a = Bee's Sneeze
//          0x0b = Sushi Swipe
//          0x0c = Rush Hour
//          0x0d = Wire Dancing
//          0x0e = Inner Beat
//          0x0f = Discord Beatdown
//          0x10 = Funk Factory
//          0x11 = Falling Acorns
//          0x12 = Silly Sauna
//          0x13 = Final Showdown
function currentMinigameID() => byte(0x0E56F0)
Heart_Beat = 0
Lovers_Poem = 1
Cool_Trunk_of_Joy = 2
Toilet_Break = 3
Staring_Content = 4
Funky_Mannequins = 5
Hit_Haircuts = 6
Crow_Choir = 7
Zoo_Blues = 8
Touch_of_Magic = 9
Bees_Sneeze = 10
Sushi_Swipe = 11
Rush_Hour = 12
Wire_Dancing = 13
Inner_Beat = 14
Discord_Beatdown = 15
Funk_Factory = 16
Falling_Acorns = 17
Silly_Sauna = 18
Final_Showdown = 19

//0 Indexed Minigame Num to Name String
MinigameNumToName = {
                         0: "Heart Beat",  1: "Lovers' Poem",  2: "Cool Trunk of Joy",  3: "Toilet Break",  4: "Staring Contest",
                         5: "Funky Mannequins",  6: "Hit Haircuts",  7: "Crow Choir",  8: "Zoo Blues", 9: "Touch of Magic",
                        10: "Bee's Sneeze", 11: "Sushi Swipe", 12: "Rush Hour", 13: "Wire Dancing", 14: "Inner Beat",
                        15: "Discord Beatdown", 16: "Funk Factory", 17: "Falling Acorns", 18: "Silly Sauna", 19: "Final Showdown"
                    }

// $0E56F8: [8 BIT] Minigame Difficulty
//          0x00 = Easy
//          0x01 = Normal
//          0x02 = Hard
function minigameDifficulty() => byte(0x0E56F8)
Easy = 0
Normal = 1
Hard = 2

DifficultyNumToName = { 0: "Easy", 1: "Medium", 2: "Hard"}


// $0E5738: [8 BIT] Note Hit / Miss Flag
//          0x05 = X Spawned (missed release)
//          0x04 = X Spawned (missed hold)
//          0x03 = X Spawned (missed tap)
//          0x02 = Note Spawned (hit)
//          0x01 = Holding (hit)
// $0E576C: [32 BIT] Minigame Score Percentage (post-minigame screen)
// $0E5858: [32 BIT] Player Running Score
//          Big Green Note = +11 points
//          Little Green Note = +9 points
//          Little Red Note = +4 Points
//          X = 0 Points
// $0E58CC: [8 BIT] Minigame Unlocks
//          Bit 0 = Heart Beat (Default Unlocked)
//          Bit 1 = Lovers' Poem (Default Unlocked)
//          Bit 2 = Cool Trunk of Joy
//          Bit 3 = Toilet Break (Default Unlocked)
//          Bit 4 = Staring Contest
//          Bit 5 = Funky Mannequins (Default Unlocked)
//          Bit 6 = Hit Haircuts (Default Unlocked)
//          Bit 7 = Crow Choir (Default Unlocked)
// $0E58CD: [8 BIT] Minigame Unlocks 2
//          Bit 0 = Zoo Blues (Default Unlocked)
//          Bit 1 = Touch of Magic (Default Unlocked)
//          Bit 2 = Bee's Sneeze (Default Unlocked)
//          Bit 3 = Sushi Swipe (Default Unlocked)
//          Bit 4 = Rush Hour (Default Unlocked)
//          Bit 5 = Wire Dancing
//          Bit 6 = Inner Beat (Default Unlocked)
//          Bit 7 = Discord Beatdown
// $0E58CE: [8 BIT] Minigame Unlocks 3
//          Bit 0 = Funk Factory (Default Unlocked)
//          Bit 1 = Falling Acorns (Default Unlocked)
//          Bit 2 = Silly Sauna
//          Bit 3 = Final Showdown

// $0E58D0: [8 BIT] Game Screen / State
//          0x01 = Play Menu
//          0x02 = Beat Album
//          0x03 = Beat Revolution Comic 1
//          0x04 = Beat Revolution Comic 2
//          0x05 = Beat Revolution Comic 3
//          0x06 = Beat Revolution Comic 4 (Launches 3 Beat Moves Tutorial)
//          0x07 = Beat Revolution Comic 5 (Launches into Day 1)
//          0x08 = 3 Beat Moves Tutorial
//          0x09 = The Park (Intro)
//          0x0a = Good Work! (High Street Cleared)
//          0x0d = Calendar
//          0x0e = Beat Revolution Level Select Screen
//          0x0f = Beat Revolution Comics Before Minigame
//          0x10 = That Night
//          0x11 = Star Counting / Stairway to Heaven
//          0x15 = Mini Games Menu
//          0x16 = Difficulty Selection
//          0x17 = In Minigame / Tutorial
//          0x18 = Post-Minigame Screen
//          0x19 = Game Info
//          0x1b = Reading Game Info
//          0x20 = Title Screen
//          0x21 = Options Screen
//          0x24 = Pause Menu
//          0x25 = Restart Level Prompt
//          0x26 = Quit Prompt
//          0x2a = Loading Screen
achievement(title = "High Street Hero", description = "Clear High Street. (Days 1 - 3)", points = 3,
                id = 0, badge = "00000", published = "24/7/2022", modified = "24/7/2022",
                trigger = 
                currentMinigameID() == Heart_Beat && //Previous minigame is Heart Beat
                minigameDifficulty() == Normal && //previous minigame is on normal
                byte(0x0E58D0) == 0x0a //Good work screen cleared 
)

achievement(title = "Beat City Park Ranger", description = "Clear The Park. (Days 4 - 7)", points = 4,
                id = 0, badge = "00000", published = "24/7/2022", modified = "24/7/2022",
                trigger = 
                currentMinigameID() == Silly_Sauna && //Previous minigame is Silly Sauna
                minigameDifficulty() == Easy && //previous minigame is on easy
                byte(0x0E58D0) == 0x0a //Good work screen cleared 
)

achievement(title = "Nodding Hill's Noble Knight", description = "Clear Nodding Hill. (Days 8 - 12)", points = 5,
                id = 0, badge = "00000", published = "24/7/2022", modified = "24/7/2022",
                trigger = 
                currentMinigameID() == Discord_Beatdown && //Previous minigame is Discord Beatdown
                minigameDifficulty() == Easy && //previous minigame is on easy
                byte(0x0E58D0) == 0x0a //Good work screen cleared 
)

achievement(title = "Industrialization Reformation", description = "Clear The Industrial Area. (Days 13 - 17)", points = 10,
                id = 0, badge = "00000", published = "24/7/2022", modified = "24/7/2022",
                trigger = 
                currentMinigameID() == Discord_Beatdown && //Previous minigame is Discord Beatdown
                minigameDifficulty() ==  Normal && //previous minigame is on normal
                byte(0x0E58D0) == 0x0a //Good work screen cleared 
)

achievement(title = "Beat City Savior", description = "Clear City Hall and defeat Dame Isolde, bringing happiness back to Beat City! (Day 17 - 18)", points = 10,
                id = 0, badge = "00000", published = "24/7/2022", modified = "24/7/2022",
                trigger = 
                currentMinigameID() == Final_Showdown && //Previous minigame is Final Showdown
                minigameDifficulty() == Normal  && //previous minigame is on Normal
                byte(0x0E58D0) == 0x0a //Good work screen cleared 
)


// $0E566C: [BITFLAG]  Handedness
//          0x00 = Right-Handed (Default)
//          0x01 = Left-Handed
achievement(title = "Hendrix Wannabe", description = "Complete 'Final Showdown' (any difficulty) in Left-Handed Mode with a score of at least 50%.", points = 1,
                id = 0, badge = "00000", published = "24/7/2022", modified = "24/7/2022",
                trigger = 
                currentMinigameID() == 19 && //Minigame Selected
                byte(0x0E566C) == 0x01 && //Left Hand Mode
                dword(0x0E56DC) == 0xffffffff && //Not in Tutorial
                prev(byte(0x0E58D0)) == 0x17 && //Last frame is on the Minigame Screen
                never(prev(byte(0x0E58D0)) == 0x2a) && //No misses, reset after loading screen
                trigger_when(byte(0x0E58D0) == 0x18 && dword(0x0e576c) >= 50) //End of Minigame Screen
)


//Titles will also be changed in editor
for index in range(0,19)
{
    achievement(title = MinigameNumToName[index] + " Perfectionist", description = "Finish the '" + MinigameNumToName[index] + "' minigame on Hard without making any mistakes.", points = 10,
                id = 0, badge = "00000", published = "24/7/2022", modified = "24/7/2022",
                trigger = minigameDifficulty() == Hard &&
                currentMinigameID() == index && //Minigame Selected
                dword(0x0E56DC) == 0xffffffff && //Not in Tutorial
                prev(byte(0x0E58D0)) == 0x17 && //Last frame is on the Minigame Screen
                disable_when( ( (byte(0x0E5738) == 0x03 || byte(0x0E5738) == 0x04 || byte(0x0E5738) == 0x05)), until = prev(byte(0x0E58D0)) == 0x2a) && //No misses, reset after loading screen
                trigger_when(byte(0x0E58D0) == 0x18) //End of Minigame Screen
        
    )
}

for index in range(0,19) //each minigame
{
    for difficulty in range(0,2) //each difficulty
    {
        leaderboard(MinigameNumToName[index] + " (" + DifficultyNumToName[difficulty] +") ", "Finish '" + MinigameNumToName[index] + "' with the highest percentage on " + DifficultyNumToName[difficulty],
        start = byte(0x0E58D0) == 0x18 && prev(byte(0x0E58D0)) == 0x17 && currentMinigameID() == index && minigameDifficulty() == difficulty, 
        cancel = always_false(),
        submit = prev(byte(0x0E58D0)) == 0x18, //submit on the second frame we're on the post-minigame screen
        value = dword(0x0e576c)
        )
    }
}

function minigameLookup() => byte(0x0E56F0)
function difficultyLookup() => byte(0x0E56F8)

minigames = {
    0: "Heart Beat",  1: "Lovers' Poem",  2: "Cool Trunk of Joy",  3: "Toilet Break",  4: "Staring Contest",
    5: "Funky Mannequins",  6: "Hit Haircuts",  7: "Crow Choir",  8: "Zoo Blues", 9: "Touch of Magic",
    10: "Bee's Sneeze", 11: "Sushi Swipe", 12: "Rush Hour", 13: "Wire Dancing", 14: "Inner Beat",
    15: "Discord Beatdown", 16: "Funk Factory", 17: "Falling Acorns", 18: "Silly Sauna", 19: "Final Showdown"
}

difficulties = {
    0: "Easy", 1: "Normal", 2: "Hard"
}

rich_presence_conditional_display( byte(0x0E58D0) == 0x01 || byte(0x0E58D0) == 0x19 || byte(0x0E58D0) == 0x1b 
                                    || byte(0x0E58D0) == 0x20 || byte(0x0E58D0) == 0x21, "Browsing the Menus.")
rich_presence_conditional_display( byte(0x0E58D0) == 0x02, "Viewing the Beat Album with {0}/22 items unlocked.",
                                   rich_presence_value( "AlbumUnlocks", bitcount(0x0E56D4) + bitcount(0x0E56D5) + bit0(0x0E56D6) + bit1(0x0E56D6) +
                                   bit2(0x0E56D6) + bit3(0x0E56D6) + bit4(0x0E56D6) + bit5(0x0E56D6) )
                                 ) 
rich_presence_conditional_display( (byte(0x0E58D0) > 0x02 && byte(0x0E58D0) <= 0x07) || (byte(0x0E58D0) == 0x0c), "Viewing a Comic in 'Beat Revolution'.")
rich_presence_conditional_display( byte(0x0E58D0) == 0x08, "Playing the '3 Beat Moves' Tutorial.")
rich_presence_conditional_display( byte(0x0E58D0) == 0x09, "Starting to Explore a New Area.")
rich_presence_conditional_display( byte(0x0E58D0) == 0x10, "Snoozing in Bed.")
rich_presence_conditional_display( byte(0x0E58D0) == 0x11, "Building a Stairway to Heaven with {0}/232 Stars.",
                                   rich_presence_value( "StarCount", word(0x0E56D8) - 1)
                                 )
rich_presence_conditional_display( byte(0x0E58D0) == 0x0a, "Finishing Up An Area.")
rich_presence_conditional_display( byte(0x0E58D0) == 0x0d, "Selecting a Day on the Calendar.")
rich_presence_conditional_display( byte(0x0E58D0) == 0x0e, "Selecting a Level in 'Beat Revolution'.")
rich_presence_conditional_display( byte(0x0E58D0) == 0x0f, "Viewing a Comic in 'Beat Revolution' Before A Minigame.")
rich_presence_conditional_display( byte(0x0E58D0) == 0x15 || byte(0x0E58D0) == 0x16, "Selecting a Minigame.")

rich_presence_conditional_display( byte(0x0E58D0) == 0x17,  
                                    "Playing {0} on {1}. ",                                
                                  rich_presence_lookup("Minigame", minigameLookup(), minigames),
                                  rich_presence_lookup( "Difficulty", difficultyLookup(), difficulties )
                                  )
                                  
rich_presence_conditional_display( byte(0x0E58D0) == 0x18,  
                                    "Finishing {0} on {1} with a score of {2}%.",                                
                                  rich_presence_lookup("Minigame", minigameLookup(), minigames),
                                  rich_presence_lookup( "Difficulty", difficultyLookup(), difficulties ),
                                  rich_presence_value( "Score", dword(0x0e576c) )
                                  )                                  

rich_presence_conditional_display( byte(0x0E58D0) == 0x2a || byte(0x0E58D0) == 0x40 || byte(0x0E58D0) == 0x34
                                    || byte(0x0E58D0) == 0x39 || byte(0x0E58D0) == 0x3a, "Waiting Through a Loading Screen.")                                  
rich_presence_conditional_display( byte(0x0E58D0) == 0x24, "Vibing in the Pause Menu.")
rich_presence_conditional_display( byte(0x0E58D0) == 0x25, "Restarting a Minigame.")
rich_presence_conditional_display( byte(0x0E58D0) == 0x26, "Quitting a Minigame.")                                 

rich_presence_display( "Playing Beat City.") //Basic default catch case  


