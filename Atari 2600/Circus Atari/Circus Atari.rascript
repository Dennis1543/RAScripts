// Circus Atari
// #ID = 13058
// Author: Dennis1543 (Taylor1543)

// $0004: [8 BIT] Red Balloon Display 1
// $0005: [8 BIT] Red Balloon Display 2
// $0006: [8 BIT] Red Balloon Display 3
// $0007: [8 BIT] Red Balloon Display 4
// $0008: [8 BIT] Red Balloon Display 5
// $0009: [8 BIT] Red Balloon Display 6
function allRedDestroyed()
{
    return byte(0x0004) == 0x00 && byte(0x0005) == 0x00 && byte(0x0006) == 0x00 && 
           byte(0x0007) == 0x00 && byte(0x0008) == 0x00 && byte(0x0009) == 0x00
}

// $000A: [8 BIT] Blue Balloon Display 1
// $000B: [8 BIT] Blue Balloon Display 2
// $000C: [8 BIT] Blue Balloon Display 3
// $000D: [8 BIT] Blue Balloon Display 4
// $000E: [8 BIT] Blue Balloon Display 5
// $000F: [8 BIT] Blue Balloon Display 6
function allBlueDestroyed()
{
    return byte(0x000A) == 0x00 && byte(0x000B) == 0x00 && byte(0x000C) == 0x00 && 
           byte(0x000D) == 0x00 && byte(0x000E) == 0x00 && byte(0x000F) == 0x00
}

// $0010: [8 BIT] White Balloon Display 1
// $0011: [8 BIT] White Balloon Display 2
// $0012: [8 BIT] White Balloon Display 3
// $0013: [8 BIT] White Balloon Display 4
// $0014: [8 BIT] White Balloon Display 5
// $0015: [8 BIT] White Balloon Display 6
function allWhiteDestroyed()
{
    return byte(0x0010) == 0x00 && byte(0x0011) == 0x00 && byte(0x0012) == 0x00 && 
           byte(0x0013) == 0x00 && byte(0x0014) == 0x00 && byte(0x0015) == 0x00
}

// $0029: [8 BIT] Game State
//        0x00 = Playing Game
//        0x01 = End of Game
//        0x80 = Selecting a Game
//        0xff = Just Started Up / "Title Screen"
function gameStateLookup() => byte(0x0029)
Playing = 0x00
EndGame = 0x01
SelectingGame = 0x80
Title = 0xff


// $002A: [8 BIT] Score Left Two Digits  (XX--)
// $002B: [8 BIT] Score Right Two Digits (--XX) / LOWER4 = Game Number in Game Select
function calcCurrentScore()
{
    return (bcd(byte(0x002A)) * 100) + bcd(byte(0x002B))
}



// $002C: [8 BIT] UI Player Number (Level Select and In-Game)
//        UPPER 4: UI Player Number Display (either 1 or 2)

function currentPlayerNum()
{
    return high4(0x002C)
}

// This is also where P2's score is displayed at the end of a 2 player game
function calcp2EndScore()
{
    return (bcd(byte(0x002C)) * 100) + bcd(byte(0x002D))
}

// $002D: [8 BIT] Clown Counter (Lives player gets clown number 1 through 5 inclusive)
//        UPPER 4: Current Clown Number
//      
//        LOWER 4: Extra Life Indicator
//        0xa = No Extra Life
//        0xb = Extra Life Achieved (X shown)
function livesRemaining()
{
    return high4(0x002D)
}

function lostAClown()
{
    return ( high4(0x002D) > prev(high4(0x002D)) || low4(0x002D) == 0xa && prev(low4(0x002D)) == 0xb)
}

// $004F: [8 BIT] Teeter-Totter Position
//        0x94 = Left-Most Position
//        0x26 = Right-Most Position
// $0055: [8 BIT] Teeter-Totter Orientation
//        0xe8 = Clown on Right Side
//        0x04 = Clown on Left Side


// $0067: [8 BIT] Difficulty Switch
//          0x00 = Default Speed (Left Difficulty B)
//          0x40 = Faster Speed (Left Difficulty A)
function difficultySwitch() => byte(0x0067)
LeftB = 0x00
LeftA = 0x40


// $0068: [8 BIT] Level ID
//        0x00 = Game 1 (1P)
//        0x01 = Game 1 (2P)
//        0x02 = Game 2 (1P)
//        0x03 = Game 2 (2P)
//        0x04 = Game 3 (1P)
//        0x05 = Game 3 (2P)
//        0x06 = Game 4 (1P)
//        0x07 = Game 4 (2P)
//        0x08 = Game 5 (1P)
//        0x09 = Game 5 (2P)
//        0x0a = Game 6 (1P)
//        0x0b = Game 6 (2P)
//        0x0c = Game 7 (2P)
//        0x0d = Game 8 (2P)
function levelIDLookup() => byte(0x0068)

function isTwoPlayerLevel()
{
    return (levelIDLookup() == 0x01 || levelIDLookup() == 0x03 || levelIDLookup() == 0x05 ||
           levelIDLookup() == 0x07 || levelIDLookup() == 0x09 || levelIDLookup() == 0x0b ||
           levelIDLookup() == 0x0c || levelIDLookup() == 0x0d)
}

LevelIDToString = {
                        0: "Game 1 (1P)", 1: "Game 1 (2P)", 2: "Game 2 (1P)", 3: "Game 2 (2P)",
                        4: "Game 3 (1P)", 5: "Game 3 (2P)", 6: "Game 4 (1P)", 7: "Game 4 (2P)",
                        8: "Game 5 (1P)", 9: "Game 5 (2P)", 10: "Game 6 (1P)", 11: "Game 6 (2P)",
                        12: "Game 7 (2P)", 13: "Game 8 (2P)"
                  }
                  
//Achievements

achievement(title = "I Hope You Have Clown Insurance", description = "Find out what happens when you don't catch your partner clown.", points = 0,
              id = 0, badge = "00000", published = "28/2/2023", modified = "28/2/2023",
              trigger = !isTwoPlayerLevel() && gameStateLookup() == Playing && lostAClown()
            ) 
            
achievement(title = "These Look Yellow to Me...", description = "Clear the white row of balloons in Game 1, 2, 3, or 4.", points = 3,
              id = 0, badge = "00000", published = "28/2/2023", modified = "28/2/2023",
              trigger = ( (levelIDLookup() == 0x00 || levelIDLookup() == 0x02 || levelIDLookup() == 0x04 || levelIDLookup() == 0x06) && gameStateLookup() == Playing &&
                        allWhiteDestroyed() )
            ) 

achievement(title = "Why So Blue, Mr. Clown?", description = "Clear the blue row of balloons in Game 1, 2, 3, or 4.", points = 4,
              id = 0, badge = "00000", published = "28/2/2023", modified = "28/2/2023",
              trigger = ( (levelIDLookup() == 0x00 || levelIDLookup() == 0x02 || levelIDLookup() == 0x04 || levelIDLookup() == 0x06) && gameStateLookup() == Playing &&
                        allBlueDestroyed() )
            )            

achievement(title = "Bloons Jumping Offensive", description = "Clear the red row of balloons in Game 1, 2, 3, or 4.", points = 5,
              id = 0, badge = "00000", published = "28/2/2023", modified = "28/2/2023",
              trigger = ( (levelIDLookup() == 0x00 || levelIDLookup() == 0x02 || levelIDLookup() == 0x04 || levelIDLookup() == 0x06) && gameStateLookup() == Playing &&
                        allRedDestroyed() )
            )

achievement(title = "Breakout!", description = "Clear all the balloons in Game 5 or 6.", points = 5,
              id = 0, badge = "00000", published = "28/2/2023", modified = "28/2/2023",
              trigger = ( (levelIDLookup() == 0x08 || levelIDLookup() == 0x0a) && gameStateLookup() == Playing &&
                        allRedDestroyed() && allBlueDestroyed() && allWhiteDestroyed() )
            )

achievement(title = "Quadruple Digits!", description = "Earn 1000+ points in any game.", points = 5,
              id = 0, badge = "00000", published = "28/2/2023", modified = "28/2/2023",
              trigger = gameStateLookup() == Playing && !isTwoPlayerLevel() && calcCurrentScore() >= 1000 && prior(calcCurrentScore()) < 1000
            )
            
achievement(title = "No Clown Left Behind", description = "Earn 500+ points in any game without dropping a clown.", points = 10,
              id = 0, badge = "00000", published = "28/2/2023", modified = "28/2/2023",
              trigger = gameStateLookup() == Playing && !isTwoPlayerLevel() && 
              disable_when(lostAClown(), until= (gameStateLookup() == EndGame || gameStateLookup() == Title || gameStateLookup() == SelectingGame || byte(0x004c) != 0xff) ) &&
              trigger_when(calcCurrentScore() >= 500 && prior(calcCurrentScore()) < 500)
            )

achievement(title = "Harder, Better, Faster, Clown-ier", description = "Earn 500+ points in any game on Left Difficulty A. (Set difficulty before beginning game)", points = 5,
              id = 0, badge = "00000", published = "28/2/2023", modified = "28/2/2023",
              trigger = gameStateLookup() == Playing && !isTwoPlayerLevel() && difficultySwitch() == LeftA &&
              disable_when(prev(difficultySwitch()) == LeftB, until= (gameStateLookup() == EndGame || gameStateLookup() == Title || gameStateLookup() == SelectingGame) || byte(0x004c) != 0xff) &&
              trigger_when(calcCurrentScore() >= 500 && prior(calcCurrentScore()) < 500)
            )
            
progressionTitles = ["Welcome to the Circus!", "Teeterboard Trainee", "Acrobatic Apprentice", "Skilled Showman", "Expert Entertainer", "Carnival Ringmaster"]
            
for game in range(0,5)
{
    achievement(title = progressionTitles[game], description = "Earn 500+ points in Game " + (game + 1) + ".", points = 5,
              id = 0, badge = "00000", published = "28/2/2023", modified = "28/2/2023",
              trigger = (gameStateLookup() == Playing && levelIDLookup() == game * 2 && calcCurrentScore() >= 500 && prior(calcCurrentScore()) < 500)
            )
}

// Leaderboards

leaderboard("One Clown Challenge", 
        "Earn the highest score possible without dropping a clown.",
        start = gameStateLookup() == Playing && !isTwoPlayerLevel() && calcCurrentScore() == 0, 
        cancel = gameStateLookup() == SelectingGame,
        submit = lostAClown(),
        value = calcCurrentScore()
        )


for game in range(0,5)
{
    leaderboard("Game " + (game + 1), 
        "Earn the highest score possible on Game " + (game + 1) + ".",
        start = gameStateLookup() == Playing && levelIDLookup() == game * 2, 
        cancel = gameStateLookup() == SelectingGame,
        submit = gameStateLookup() == EndGame,
        value = calcCurrentScore()
        )
}


// Rich Presence

rich_presence_conditional_display( gameStateLookup() == Title, "Booting Up Circus Atari.")
rich_presence_conditional_display( gameStateLookup() == SelectingGame, "Selecting a Game.")

//2P 
rich_presence_conditional_display( gameStateLookup() == Playing && isTwoPlayerLevel(),  "🎈{0}🎈 | P{1}: {2} points | {3}/5 🤡", 
                                   rich_presence_lookup("Game", levelIDLookup(), LevelIDToString),
                                   rich_presence_value("PlayerNumber", currentPlayerNum()),
                                   rich_presence_value("Points", calcCurrentScore()),
                                   rich_presence_value("Clowns/Lives", livesRemaining())
                                 )
rich_presence_conditional_display( gameStateLookup() == EndGame && isTwoPlayerLevel(), "Ended 🎈{0}🎈 with P1: {1} points / P2: {2} points", 
                                   rich_presence_lookup("Game", levelIDLookup(), LevelIDToString),
                                   rich_presence_value("p1Points", calcCurrentScore()),
                                   rich_presence_value("p2Points", calcp2EndScore())
                                 )

//1P (Conditionals fire in order, only need to check for 2P above first)
rich_presence_conditional_display( gameStateLookup() == Playing, "🎈{0}🎈 | {1} points | {2}/5 🤡", 
                                   rich_presence_lookup("Game", levelIDLookup(), LevelIDToString),
                                   rich_presence_value("Points", calcCurrentScore()),
                                   rich_presence_value("Clowns/Lives", livesRemaining())
                                 )
rich_presence_conditional_display( gameStateLookup() == EndGame, "Ended 🎈{0}🎈 with {1} points.", 
                                   rich_presence_lookup("Game", levelIDLookup(), LevelIDToString),
                                   rich_presence_value("Points", calcCurrentScore())
                                 )
                                 
//Default base case
rich_presence_display( "Playing Circus Atari" )