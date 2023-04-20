// Music On: Learning Piano (DSi)
// #ID = 22332
// (USA) md5 Hash: bedf9644597131aae9497c7b9be6b6ac
// Author: Dennis1543 (Taylor1543)

// $05B5F8: [8 BIT] Screen ID
//          0xc0 = Song Select / Black Loading Screen
//          0x38 = Title Screen
//          0x46 = Difficulty Select
//          0x02 = Song Demo
//          0x0c = Playing Song
//          0x08 = Completed! Appears
//          0x00 = Finish Screen
function currentScreenID() => byte(0x05B5F8)
Song_Select = 0xc0
Title_Screen = 0x38
Difficulty_Select = 0x46
Song_Demo = 0x02
Playing_Song = 0x0c
Completed_Appears = 0x08
Finish_Screen = 0x00
Paused = 0xb2

// $06B1C4: [8 BIT] Current Song Difficulty
//          0x00 = Bronze
//          0x01 = Silver
//          0x02 = Gold
//          0x03 = Master
function currentSongDifficulty() => byte(0x06B1C4)
Bronze = 0
Silver = 1
Gold = 2
Master = 3

DifficultyNumToName = 
{
    0: "Bronze",
    1: "Silver",
    2: "Gold",
    3: "Master"
}

// $0A8DA0: [32 BIT] Total Points
function currentTotalPoints() => dword(0x0A8DA0)

// $ffe00c: [32 BIT] Running App (Region Specific)
//          0x45414e48 = DSi Selection Screen
//          0x4538384b = Music On: Learning Piano

// Used to check that we are in the game, not other DSi apps.
function currentRunningApp() => dword(0xffe00c)
DSI_Selection_Screen = 0x45414e48
Music_On= 0x4538384b

//Song Unlocks at Total Points

UnlockMilestones = [2600, 3400, 4000, 4800, 5700, 10000, 12000, 15000, 18000, 22000]

achievement(title = "Wait, There's More Than 5 Songs?", description = "Unlock 'Brahms' Lullaby'", points = 1,
            trigger = currentRunningApp() == Music_On && currentTotalPoints() >= 2600 && prev(currentTotalPoints()) < 2600 && currentScreenID() == Playing_Song,
            published = "6/3/2023", modified = "6/3/2023"
            )

achievement(title = "Waltz Time", description = "Unlock 'The Blue Danube'", points = 1,
            trigger = currentRunningApp() == Music_On && currentTotalPoints() >= 3400 && prev(currentTotalPoints()) < 3400 && currentScreenID() == Playing_Song,
            published = "6/3/2023", modified = "6/3/2023"
            )
            
achievement(title = "Yeah, G Major!", description = "Unlock 'Minuet in G Major'", points = 1,
            trigger = currentRunningApp() == Music_On && currentTotalPoints() >= 4000 && prev(currentTotalPoints()) < 4000 && currentScreenID() == Playing_Song,
            published = "6/3/2023", modified = "6/3/2023"
            )            

achievement(title = "A Taste of Italy", description = "Unlock 'La Traviata'", points = 1,
            trigger = currentRunningApp() == Music_On && currentTotalPoints() >= 4800 && prev(currentTotalPoints()) < 4800 && currentScreenID() == Playing_Song,
            published = "6/3/2023", modified = "6/3/2023"
            )
            
achievement(title = "Peer Gynt's Wild Fantasy", description = "Unlock 'In the Hall of the Mountain King'", points = 1,
            trigger = currentRunningApp() == Music_On && currentTotalPoints() >= 5700 && prev(currentTotalPoints()) < 5700 && currentScreenID() == Playing_Song,
            published = "6/3/2023", modified = "6/3/2023"
            )            
            
achievement(title = "D A B F# G D G A", description = "Unlock 'Canon'", points = 2,
            trigger = currentRunningApp() == Music_On && currentTotalPoints() >= 10000 && prev(currentTotalPoints()) < 10000 && currentScreenID() == Playing_Song,
            published = "6/3/2023", modified = "6/3/2023"
            )            
            
achievement(title = "An Austrian New Year (Clap Along!)", description = "Unlock 'Radetzky March'", points = 2,
            trigger = currentRunningApp() == Music_On && currentTotalPoints() >= 12000 && prev(currentTotalPoints()) < 12000 && currentScreenID() == Playing_Song,
            published = "6/3/2023", modified = "6/3/2023"
            )            
            
achievement(title = "Bach Again With Another New Song", description = "Unlock 'Musette in D Major'", points = 2,
            trigger = currentRunningApp() == Music_On && currentTotalPoints() >= 15000 && prev(currentTotalPoints()) < 15000 && currentScreenID() == Playing_Song,
            published = "6/3/2023", modified = "6/3/2023"
            )
            
achievement(title = "A Little Ragtime Jig", description = "Unlock 'The Entertainer'", points = 2,
            trigger = currentRunningApp() == Music_On && currentTotalPoints() >= 18000 && prev(currentTotalPoints()) < 18000 && currentScreenID() == Playing_Song,
            published = "6/3/2023", modified = "6/3/2023"
            )    
            
achievement(title = "Can You Play Can-Can?", description = "Unlock 'The Infernal Galop'", points = 2,
            trigger = currentRunningApp() == Music_On && currentTotalPoints() >= 22000 && prev(currentTotalPoints()) < 22000 && currentScreenID() == Playing_Song,
            published = "6/3/2023", modified = "6/3/2023"
            )    
            
// $0A8DA4: [8 BIT] Ode to Joy - Bronze Percentage
// $0A8DA5: [8 BIT] Ode to Joy - Silver Percentage
// $0A8DA6: [8 BIT] Ode to Joy - Gold Percentage
// $0A8DA7: [8 BIT] Ode to Joy - Master Percentage
// $0A8DA8: [8 BIT] Fur Elise - Bronze Percentage
// $0A8DA9: [8 BIT] Fur Elise - Silver Percentage
// $0A8DAA: [8 BIT] Fur Elise - Gold Percentage
// $0A8DAB: [8 BIT] Fur Elise - Master Percentage
// $0A8DAC: [8 BIT] Wedding March - Bronze Percentage
// $0A8DAD: [8 BIT] Wedding March - Silver Percentage
// $0A8DAE: [8 BIT] Wedding March - Gold Percentage
// $0A8DAF: [8 BIT] Wedding March - Master Percentage
// $0A8DB0: [8 BIT] Opus 10. 2. - Bronze Percentage
// $0A8DB1: [8 BIT] Opus 10. 2. - Silver Percentage
// $0A8DB2: [8 BIT] Opus 10. 2. - Gold Percentage
// $0A8DB3: [8 BIT] Opus 10. 2. - Master Percentage
// $0A8DB4: [8 BIT] Hungarian Dance Bronze Percentage
// $0A8DB5: [8 BIT] Hungarian Dance Silver Percentage
// $0A8DB6: [8 BIT] Hungarian Dance Gold Percentage
// $0A8DB7: [8 BIT] Hungarian Dance Master Percentage
// $0A8DB8: [8 BIT] Brahms' Lullaby Bronze Percentage
// $0A8DB9: [8 BIT] Brahms' Lullaby Silver Percentage
// $0A8DBA: [8 BIT] Brahms' Lullaby Gold Percentage
// $0A8DBB: [8 BIT] Brahms' Lullaby Master Percentage
// $0A8DBC: [8 BIT] The Blue Danube Bronze Percentage
// $0A8DBD: [8 BIT] The Blue Danube Silver Percentage
// $0A8DBE: [8 BIT] The Blue Danube Gold Percentage
// $0A8DBF: [8 BIT] The Blue Danube Master Percentage
// $0A8DC0: [8 BIT] Minuet in G Major Bronze Percentage
// $0A8DC1: [8 BIT] Minuet in G Major Silver Percentage
// $0A8DC2: [8 BIT] Minuet in G Major Gold Percentage
// $0A8DC3: [8 BIT] Minuet in G Major Master Percentage
// $0A8DC4: [8 BIT] La Traviata Bronze Percentage
// $0A8DC5: [8 BIT] La Traviata Silver Percentage
// $0A8DC6: [8 BIT] La Traviata Gold Percentage
// $0A8DC7: [8 BIT] La Traviata Master Percentage
// $0A8DC8: [8 BIT] Hall of the Mountain King Bronze Percentage
// $0A8DC9: [8 BIT] Hall of the Mountain King Silver Percentage
// $0A8DCA: [8 BIT] Hall of the Mountain King Gold Percentage
// $0A8DCB: [8 BIT] Hall of the Mountain King Master Percentage
// $0A8DCC: [8 BIT] Canon Bronze Percentage
// $0A8DCD: [8 BIT] Canon Silver Percentage
// $0A8DCE: [8 BIT] Canon Gold Percentage
// $0A8DCF: [8 BIT] Canon Master Percentage
// $0A8DD0: [8 BIT] Radetzky March Bronze Percentage
// $0A8DD1: [8 BIT] Radetzky March Silver Percentage
// $0A8DD2: [8 BIT] Radetzky March Gold Percentage
// $0A8DD3: [8 BIT] Radetzky March Master Percentage
// $0A8DD4: [8 BIT] Musette in D Major Bronze Percentage
// $0A8DD5: [8 BIT] Musette in D Major Silver Percentage
// $0A8DD6: [8 BIT] Musette in D Major Gold Percentage
// $0A8DD7: [8 BIT] Musette in D Major Master Percentage
// $0A8DD8: [8 BIT] The Entertainer Bronze Percentage
// $0A8DD9: [8 BIT] The Entertainer Silver Percentage
// $0A8DDA: [8 BIT] The Entertainer Gold Percentage
// $0A8DDB: [8 BIT] The Entertainer Master Percentage
// $0A8DDC: [8 BIT] The Infernal Galop Bronze Percentage
// $0A8DDD: [8 BIT] The Infernal Galop Silver Percentage
// $0A8DDE: [8 BIT] The Infernal Galop Gold Percentage
// $0A8DDF: [8 BIT] The Infernal Galop Master Percentage


// $0A8DE0: [8 BIT] Song ID
//          0x00 = Ode to Joy
//          0x01 = For Elise
//          0x02 = Wedding March
//          0x03 = Opus 10. 2.
//          0x04 = Hungarian Dance No. 5
//          0x05 = Brahms' Lullaby
//          0x06 = The Blue Danube
//          0x07 = Minuet in G Major
//          0x08 = La Traviata
//          0x09 = In the Hall of the Mountain King
//          0x0a = Canon
//          0x0b = Radetzky March
//          0x0c = Musette in D Major
//          0x0d = The Entertainer
//          0x0e = The Infernal Galop
function currentSongID() => byte(0x0A8DE0)
Ode_to_Joy = 0
For_Elise = 1
Wedding_March = 2
Opus_10_2 = 3
Hungarian_Dance = 4
Brahms_Lullaby = 5
Blue_Danube = 6
Minuet = 7
La_Traviata = 8
Hall_of_Mountain_King = 9
Canon = 10
Radetzky = 11
Musette = 12
Entertainer = 13
Infernal_Galop = 14


SongNumToName = 
{
    0: "Ode to Joy",
    1: "For Elise",
    2: "Wedding March",
    3: "Opus 10. 2",
    4: "Hungarian Dance No. 5",
    5: "Brahms' Lullaby",
    6: "The Blue Danube",
    7: "Minuet in G Major",
    8: "La Traviata",
    9: "In the Hall of the Mountain King",
    10: "Canon",
    11: "Radetzky March",
    12: "Musette in D Major",
    13: "The Entertainer",
    14: "The Infernal Galop"
}

DifficultyAwards = ["Bronze Medal", "Silver Medal", "Gold Medal", "Laurel Wreath"]

pointVals = [2, 3, 5, 10]



for song in range(0, 14)
{
    for difficulty in range(0,3)
    {
        achievement(title = SongNumToName[song] + " [" + DifficultyNumToName[difficulty] + "]", description = "Earn the " + DifficultyAwards[difficulty] + " on " + SongNumToName[song] + ".", points = pointVals[difficulty],
        trigger = currentRunningApp() == Music_On && currentScreenID() == Playing_Song && currentSongID() == song && currentSongDifficulty() == difficulty &&
                  byte(0x0A8DA4 + (4 * song) + difficulty) >= 85 && prev(byte(0x0A8DA4 + (4 * song) + difficulty)) < 85
        )
    }
}

// $30546C: [8 BIT] End Screen Percentage
// $3054EC: [32 BIT] Key Pressed
//          0x00 = Low C
//          0x01 = Low C#
//          0x02 = Low D
//          0x03 = Low D#
//          0x04 = Low E
//          0x05 = Low F
//          0x06 = Low F#
//          0x07 = Low G
//          0x08 = Low G#
//          0x09 = Low A
//          0x0a = Low A#
//          0x0b = Low B
//          0x0c = C
//          0x0d = C#
//          0x0e = D
//          0x0f = D#
//          0x10 = E
//          0x11 = F
//          0x12 = F#
//          0x13 = G
//          0x14 = G#
//          0x15 = A
//          0x16 = A#
//          0x17 = B
//          0xff = No Note Playing


// Leaderboards for percentages



function currentSongSavedScore(song, difficulty)
{
    return byte(0x0A8DA4 + (4 * song) + difficulty)
}

// $30546f: [8 BIT] New Record Blinking
//          0x3c = Blinking (new record)

// NOTE: This had a very weird issue with frame delay between updating scores, pressing continue too quickly before the percentage added up, and a lot of other issues.
// This was fixed by adding in the following condition manually in RALib into the alt value group of all of these leaderboards:

// This causes a hit to be added once the blinking for new record occurs (byte(0x30546f) == 0x3c), and causes the measured to be equal to the saved score percentage.
// If this MeasuredIf condition is not met, the measured defaults to 0, and therefore takes the max_of(0, OnScreenPercentage) = OnScreenPercentage.
 
// AddHits      Mem 8-bit 0x30546f = Value 0x3c (1)
// MeasuredIf   Value     0x00     = Value 0x01 (1)

for song in range(0,14)
{
    for difficulty in range(0,3)
    {
        leaderboard
        (SongNumToName[song] + " - " + DifficultyNumToName[difficulty],
        "Get the highest percentage on " + SongNumToName[song] + " on " + DifficultyNumToName[difficulty] + " difficulty",
        start = currentRunningApp() == Music_On && currentSongID() == song && currentSongDifficulty() == difficulty && currentScreenID() == Completed_Appears,
        cancel = always_false(),
        submit = byte(0x05B5F8) == 0xc0 && byte(0x05a7a9) == 0x00,
        value = max_of(measured(byte(0x30546C)),
                       measured(currentSongSavedScore(song, difficulty))
                       ),
        format = "VALUE"
        )
    }
}

//Rich Presence
rich_presence_conditional_display( currentRunningApp() != Music_On, "Messing Around With The DSi.")
rich_presence_conditional_display( byte(0x05a7a9) == 0x01, "Reading Through the Help Menus. | Total Points: {0}",
                                   rich_presence_value("TotalPoints", currentTotalPoints()) )
rich_presence_conditional_display( currentScreenID() == Title_Screen, "Admiring the Title Screen. | Total Points: {0}",
                                   rich_presence_value("TotalPoints", currentTotalPoints()) )
rich_presence_conditional_display( currentScreenID() == Paused, "At the Pause Menu. | Total Points: {0}",
                                   rich_presence_value("TotalPoints", currentTotalPoints()) )
rich_presence_conditional_display( currentScreenID() == Song_Select, "Selecting a Song to Perform. | Total Points: {0}",
                                   rich_presence_value("TotalPoints", currentTotalPoints()) )
rich_presence_conditional_display( currentScreenID() == Difficulty_Select, "Selecting a Difficulty for {0}. | Total Points: {1}",
                                   rich_presence_lookup("CurrentSong", currentSongID(), SongNumToName),
                                   rich_presence_value("TotalPoints", currentTotalPoints()) )
rich_presence_conditional_display( currentScreenID() == Song_Demo, "Watching a Demo of {0}. | Total Points: {1}",
                                   rich_presence_lookup("CurrentSong", currentSongID(), SongNumToName),
                                   rich_presence_value("TotalPoints", currentTotalPoints()) )
rich_presence_conditional_display( currentScreenID() == Playing_Song, "Playing {0} on {1} Difficulty. | Total Points: {2}",
                                   rich_presence_lookup("CurrentSong", currentSongID(), SongNumToName), 
                                   rich_presence_lookup("CurrentDifficulty", currentSongDifficulty(), DifficultyNumToName),
                                   rich_presence_value("TotalPoints", currentTotalPoints()) )
rich_presence_conditional_display( currentScreenID() == Finish_Screen || currentScreenID() == Completed_Appears, "Ending {0} on {1} Difficulty. | Total Points: {2}",
                                   rich_presence_lookup("CurrentSong", currentSongID(), SongNumToName), 
                                   rich_presence_lookup("CurrentDifficulty", currentSongDifficulty(), DifficultyNumToName),
                                   rich_presence_value("TotalPoints", currentTotalPoints()) )                                  
rich_presence_display("Playing Music On: Learning Piano (DSi)")



