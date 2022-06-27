// MySims: Party [Nintendo_DS]
// #ID = 17318
// (Europe) md5 Hash = 6343755738d1d8a49aefe9d80d48670b
// Author: Dennis1543 (Taylor1543)

// $06BFBC: [8 BIT] Minigame ID Number (based on list of minigames)
function currentMinigameID() => byte(0x06bfbc)
Pass_and_Check = 1
Hush_Hush_Library_Rush = 2
My_Mix_Masters = 3
Haunted_Hunted = 4
Sushi_Scramble = 5
Chemistry_Calamity = 6
Spaghetti_Spin_Off = 7
Soft_Service = 8
Vroom_Service = 9
Skull_Finder = 10
Clap_Happy = 11
Air_Guitar_Star = 12
Okay_Bouquet = 13
Petal_Platform_Peril = 14
Keys_to_Success = 15
Mallet_Melee = 16
Signal_Search = 17
Spotlight_Please = 18
Sim_Fu_Showdown = 19
Fashion_Mogul = 20
Crystal_Clear = 21
Sudsy_Salon = 22
Skating_Scamper = 23
Soccer_Bounce = 24
Bus_Stop = 25
Catch_the_Crook = 26
Clothing_Cut_Out = 27
Pretty_Pottery = 28
Gone_Fishing = 29
Hidden_Treasures = 30
Sleeping_Sophie = 31
Pastry_Puzzle = 32
Hang_Gliding_Hurricane = 33
Fortune_Finders = 34
Shuffle_Cup = 35
Plane_Pop = 36
Bumper_Boat_Battle = 37
Fashion_Reaction = 38
Perfect_Slot_Jackpot = 39
Spotting_Safari = 40


// $0A00D1: [8 BIT] Start / Finish Sprite Position
//          Minigame Started = 0x70
function isMinigameStarted() => byte(0x0A00D1) == 0x70 //Check for minigame Start
function isPaused() => byte(0x0A0095) == 0x1e // Checks for Paused Text Showing


p1ActiveScoreLocations = {
                            Pass_and_Check: 0x148804,
                            Hush_Hush_Library_Rush: 0x14aafa,
                            My_Mix_Masters: 0x149034,
                            Haunted_Hunted: 0x150458,
                            Sushi_Scramble: 0x147202,
                            Chemistry_Calamity: 0x146b0c,                            
                            Soft_Service: 0x149183,                                                       
                            Clap_Happy: 0x1468b4,
                            Air_Guitar_Star: 0x146900,
                            Okay_Bouquet: 0x148634,
                            Petal_Platform_Peril: 0x149b08,
                            Keys_to_Success: 0x149430,                                                                                    
                            Sim_Fu_Showdown: 0x14c0c4,
                            Fashion_Mogul: 0x147810,                                                                                
                            Soccer_Bounce: 0x146aa4,                            
                            Catch_the_Crook: 0x14a09a,                            
                            Pretty_Pottery: 0x14a1d8,
                            Gone_Fishing: 0x147f28,                                                       
                            Pastry_Puzzle: 0x14a750,                            
                            Fortune_Finders: 0x148f78,
                            Shuffle_Cup: 0x1470d2,
                            Plane_Pop: 0x148218,                                                   
                            Perfect_Slot_Jackpot: 0x14a968,
                            Spotting_Safari: 0x14b6e8
                         }

nonScoreGames = {
    Spaghetti_Spin_Off: 7, 
    Vroom_Service: 9, 
    Skull_Finder: 10, 
    Mallet_Melee: 16, 
    Signal_Search: 17,
    Spotlight_Please: 18, 
    Crystal_Clear: 21,
    Sudsy_Salon: 22,
    Skating_Scamper: 23,
    Bus_Stop: 25,
    Clothing_Cut_Out: 27,
    Hidden_Treasures: 30,
    Sleeping_Sophie: 31,
    Hang_Gliding_Hurricane: 33,
    Bumper_Boat_Battle: 37,
    Fashion_Reaction: 38,
}

function currentFestival() => byte(0x12a508)
Opening_Festival = 0x00
Happy_Festival = 0x01
Pretty_Festival = 0x02
Music_Festival = 0x03
Bizarre_Festival = 0x04
Delicious_Festival = 0x05
Speed_Festival = 0x06
Horror_Festival = 0x07
Sports_Festival = 0x08
Dynamic_Festival = 0x09
Dream_Festival = 0x0a
Customizing_Festival = 0x0b


festivalTotalMinigames = {
    Opening_Festival: 3,
    Happy_Festival: 4,
    Pretty_Festival: 5,
    Music_Festival: 6,
    Bizarre_Festival: 7,
    Delicious_Festival: 8,
    Speed_Festival: 10,
    Horror_Festival: 12,
    Sports_Festival: 14,
    Dynamic_Festival: 16,
    Dream_Festival: 18,
    Customizing_Festival: 20
}


// $09B2B1: [8 BIT] Cutscene Interaction
//          0x57 = Begin Trash
//          0xaf = Trash Interaction Prior
achievement(title = "Environmentalist", description = "Recycle the litter in front of the fountain in the Residential Area.", points = 1,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = byte(0x12a24e) == 0x02 && byte(0x12a24c) == 0x02 && //In Residential Hub
            (byte(0x0975be) == 0x00 || byte(0x0975be) == 0xff) && //Near position
            byte(0x09B2B1) == 0x57 && prior(byte(0x09B2B1)) == 0xaf //Activate Animation              
)

achievement(title = "Mushroom Brothers", description = "Jump on the suspiciously familiar mushroom in the Plains Area.", points = 1,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = byte(0x12a24e) == 0x04 && byte(0x12a24c) == 0x04 && //In Plains
            (byte(0x0975be) == 0xef || byte(0x0975be) == 0xf0) && //Near position
            byte(0x09B2B1) == 0x57 && prior(byte(0x09B2B1)) == 0xaf //Activate Animation              
)

achievement(title = "Mine Cart Carnage", description = "Ride the minecart from the Desert Area to the Plains Area.", points = 1,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = byte(0x12a24e) == 0x05 && byte(0x12a24c) == 0x05 && //In Desert
            ( byte(0x0975be) == 0xfd || byte(0x0975be) == 0xfe || //Left side of Cart
            byte(0x0975be) == 0xfb || byte(0x0975be) == 0xfc) && //Right side of Cart
            byte(0x09B2B1) == 0x57 && prior(byte(0x09B2B1)) == 0xaf //Activate Animation
)

achievement(title = "White Water Rafting", description = "Ride the kayak from the Plains Area to the Residential Area.", points = 1,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = byte(0x12a24e) == 0x04 && byte(0x12a24c) == 0x04 && //In Plains
            (byte(0x0975be) == 0x07 || byte(0x0975be) == 0x08 || byte(0x0975be) == 0x09) && //On the dock
            byte(0x09B2B1) == 0x57 && prior(byte(0x09B2B1)) == 0xaf //Activate Animation
)

achievement(title = "MySims Pro Skater", description = "Ride the skateboard in the Seaside Area.", points = 1,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = byte(0x12a24e) == 0x03 && byte(0x12a24c) == 0x03 && //In Seaside
            (byte(0x0975be) == 0x11 || byte(0x0975be) == 0x12) && //On the dock
            byte(0x09B2B1) == 0x57 && prior(byte(0x09B2B1)) == 0xaf //Activate Animation
)

achievement(title = "Money DOES grow on trees!", description = "Shake the money tree in the Residential Area.", points = 1,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = byte(0x12a24e) == 0x02 && byte(0x12a24c) == 0x02 && //In Residentail area
            (byte(0x0975be) == 0xf7) && //Near the Tree
            byte(0x09B2B1) == 0x57 && prior(byte(0x09B2B1)) == 0xaf //Activate Animation
)



// $09BD12: [8 BIT] Opponent Health Remaining If Not at Full Health (0x09bd13 is bool for full health)
//          0x00 = Loss (0 Health if Full Health == 00) Full Health if Full Health == 01
// $09BD13: [8 BIT] Opponent Full Health Flag in Mallet Melee
//          0x01 = Full Health
//          0x00 = Not Full Health (0x09bd12 now shows health remaining)
// $09BD22: [8 BIT] Health Remaining If Not at Full Health GUI (0x09bd23 is bool for full health)
//          0x00 = Loss (0 Health if Full Health == 00) Full Health if Full Health == 01
// $09BD23: [8 BIT] P1 Full Health Flag in Mallet Melee
//          0x01 = Full Health
//          0x00 = Not Full Health (0x09bd22 now shows health remaining)
achievement(title = "Brawn Over Brains", description = "Win 'Mallet Melee' by only pressing the Y button (no other attacks or movement until the 'win' screen).", points = 3,
            id = 0, badge = "00000", published = "7/6/2022", modified = "7/6/2022",
            trigger = currentMinigameID() == Mallet_Melee && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            disable_when( word(0x09bd32) == 0xfff4 && ( bit0(0x09f8b4) ==  1 || bit1(0x09f8b4) == 1 || bit4(0x09f8b4) ==  1 || bit5(0x09f8b4) ==  1 ), until = byte(0x0ac797) == 0x00 && prev(byte(0x0ac797)) == 0xd1) && 
            trigger_when(byte(0x0ac797) == 0x0b)
)

// $09C046: [8 BIT] P1 Position Top Screen in Skating Scamper
//          0x10 = Pre-Game Cutscene
//          0xb4 = Start
//          0x24 = Finish
// $09C072: [8 BIT] P2 Position Top Screen in Skating Scamper
//          0x10 = Pre-Game Cutscene
//          0xb4 = Start
//          0x24 = Finish
// $09C09E: [8 BIT] P3 Position Top Screen in Skating Scamper
//          0x70 = Pre-Game Cutscene
//          0xb4 = Start
//          0x24 = Finish
// $09C0CA: [8 BIT] P4 Position Top Screen in Skating Scamper
//          0x70 = Pre-Game Cutscene
//          0xb4 = Start
//          0x24 = Finish
// $09C185: [8 BIT] Minigame Timer Seconds Digit 1 in Skating Scamper (if countdown > 10)
// $09C1B1: [8 BIT] Minigame Timer Seconds Digit 2 in Skating Scamper
achievement(title = "Speed Skater", description = "Cross the finish line in 'Skating Scamper' with at least 30 seconds remaining on the timer.", points = 5,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = currentMinigameID() == Skating_Scamper && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            byte(0x0ac797) == 0x80 && //Game Running
            byte(0x09C185) >= 0x03 &&
            trigger_when(byte(0x09C046) == 0x24)
)

// $09C235: [8 BIT] Fish Caught Index for Gone Fishing
//          00 = Brown Fish (+2)
//          01 = Purple Fish (+5)
//          02 = Green Fish (+10)
//          03 = Gold Fish (+20)
achievement(title = "Snack That Smiles Back", description = "Catch the gold fish in 'Gone Fishing'.", points = 2,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = currentMinigameID() == Gone_Fishing && //Minigame Selected
            byte(0x0ac797) == 0x80 && //Minigame Not Ended
            byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && //Game not paused
            trigger_when(byte(0x09c235) == 0x03)  //Fish caught index == Gold Fish
)


// $09C33D: [4 BIT] P1 Active Seconds Digit 1 in Spotlight Please!
// $09C369: [4 BIT] P1 Active Seconds Digit 2 in Spotlight Please!
// $09C395: [4 BIT] P1 Active Milliseconds Digit 1 in Spotlight Please!
// $09C3C1: [4 BIT] P1 Active Milliseconds Digit 2 in Spotlight Please!
achievement(title = "All Eyes On Me", description = "In 'Spotlight Please!', give Trevor at least 10 seconds of spotlight time.", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentMinigameID() == Spotlight_Please && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && //Game not paused
            byte(0x0ac797) == 0x64 && //Game Running
            trigger_when(byte(0x09C33D) >= 0x01)
)

// $09C35C: [8 BIT] P1 Bottom Screen Location (Left/Right) in Hang Gliding Hurricane
//          0x00 = cutscene
//          0x08 = start
//          0xdf = finish
// $09C388: [8 BIT] P2 Bottom Screen Location (Left/Right) in Hang Gliding Hurricane
//          0x00 = cutscene
//          0x08 = start
//          0xdf = finish
// $09C3B4: [8 BIT] P3 Bottom Screen Location (Left/Right) in Hang Gliding Hurricane
//          0x00 = cutscene
//          0x08 = start
//          0xdf = finish
// $09C3E0: [8 BIT] P4 Bottom Screen Location (Left/Right) in Hang Gliding Hurricane
//          0x00 = cutscene
//          0x08 = start
//          0xdf = finish  
achievement(title = "Weather Dodger", description = "Win 'Hang Gliding Hurricane' without hitting any obstacles or CPU players.", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentMinigameID() == Hang_Gliding_Hurricane && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            disable_when( byte(0x09c07e) == 0x00 && (byte(0x145728) == 0x01 || byte(0x145728) == 0x02), until = byte(0x0ac797) != 0x80 && byte(0x0ac797) != 0x0b) &&
            trigger_when(byte(0x0ac797) == 0x0b)
)

// $09C655: [4 BIT] P1 Seconds Digit 1 Bus! Stop!
// $09C681: [4 BIT] P1 Seconds Digit 2 Bus! Stop!
// $09C6D9: [4 BIT] P1 Milliseconds Digit 1 Bus! Stop!
// $09C705: [4 BIT]
//          P1 Milliseconds Digit 2 Bus! Stop!
//          Minigame Timer in Signal Search + Sim-Fu Showdown + Crystal Clear Digit 1 and Countdown if < 10
achievement(title = "Please Buy A Bus Schedule", description = "In 'Bus! Stop!', reach the bus stop with a score of at least 10 seconds.", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentMinigameID() == Bus_Stop && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && //Game not paused
            byte(0x0ac797) == 0x80 && //Game Running
            trigger_when(byte(0x09C655) >= 0x01)
)

// $09C731: [4 BIT] Minigame Timer Digit 2 in Signal Search + Sim-Fu Showdown + Crystal Clear if timer >= 10
// $09C865: [8 BIT] Skull Finder First Digit (and countdown after < 10)
// $09C891: [8 Bit] Skull Finder Timer Second Digit (While >= 10)

// $12A154: [32 BIT] Simoleons
achievement(title = "Motherlode", description = "Have at least 50,000 Simoleons.", points = 5,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = dword(0x12A154) >= 50000 &&
            prev(dword(0x12A154)) < 50000 &&
            prev(byte(0x12a24c)) != 0x00 //title screen value for save protection
)


// $12A24C: [8 BIT] LOCATION ADDRESS
//          
//          02 = Hub World Main
//          cb = Vic's
//          c8 = My House
//          c9 = Dolly's
//          d0 = Police Station
//          d1= Tyler's
//          d3 = Town Hall
//          69 = Poppy's Flower Shop
// $12A24E: [8 BIT] Which "Hub World" you're in
//          
//          01- Downtown
//          02 - Residential Area
//          03 - Seaside
//          04 - Plains
// $12A24F: [8 BIT] Map Mode
//          00 = character view
//          01 = zoomed out

achievement(title = "Is This Strangetown?", description = "Unlock and visit the desert area.", points = 1,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = prior(byte(0x12A24C)) == 01 && prior(byte(0x12A24E)) == 01 &&
                      byte(0x12A24C) == 05 && byte(0x12A24E) == 05
                       
)


// $12A258 - $12A28B: [8 BIT] Card Quantities
//          ff = Not Discovered

// $12A296 - $12A37B : [8 BIT] Fashion Item Quantities
//          ff = Not Discovered

// 0x12A370 Suglasses 0x12A307 Red Trainter
achievement(title = "Enable Spellcheck", description = "Unlock the 'Giant Suglasses' and the 'Red Trainter' fashion items.", points = 2,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = (byte(0x12A370) != 0xff && byte(0x12A307) != 0xff && prior(byte(0x12A370)) != 0xff) || 
                      (byte(0x12A370) != 0xff && byte(0x12A307) != 0xff && prior(byte(0x12A307)) != 0xff)
)


// $12A3D3: [8 BIT] First 8 Houses
//          0x00 = None Unlocked
//          0xff = All 8 Unlocked
// $12A3D4: [8 BIT]
//          Bits 7-4 = 4 Final Roofs
//          Bits 3-0 = 4 Final Houses
// $12A3D5: [8 BIT] First 8 Roofs
//          0x00 = None Unlocked
//          0xff = All 8 Unlocked
// $12A3D6: [8 BIT] First 8 Doors
//          0x00 = None Unlocked
//          0xff = All 8 Unlocked
// $12A3D7: [8 BIT]
//          Bits 7-4 = 4 Final Windows
//          Bits 3-0 = 4 Final Doors
// $12A3D8: [8 BIT] First 8 Windows
//          0x00 = None Unlocked
//          0xff = All 8 Unlocked
// $12A3D9: [8 BIT] First 8 Chimneys
//          0x00 = None Unlocked
//          0xff = All 8 Unlocked
// $12A3DA: [4 BIT]
//          Bits 3-0 = Final 4 Chimneys
function houseUnlockCount()
{
    return measured(
           bitcount(0x12A3D3) + bitcount(0x12A3D4) + bitcount(0x12A3D5) + 
           bitcount(0x12A3D6) + bitcount(0x12A3D7) + bitcount(0x12A3D8) +
           bitcount(0x12A3D9) + bit3(0x12A3DA) + bit2(0x12A3DA) + bit1(0x12A3DA) + bit0(0x12A3DA) == 60
           )
}

function prevHouseUnlockCount()
{
    return prev(bitcount(0x12A3D3) + bitcount(0x12A3D4) + bitcount(0x12A3D5) + 
           bitcount(0x12A3D6) + bitcount(0x12A3D7) + bitcount(0x12A3D8) +
           bitcount(0x12A3D9) + bit3(0x12A3DA) + bit2(0x12A3DA) + bit1(0x12A3DA) + bit0(0x12A3DA))
}

achievement(title = "Happy Home Designer", description = "Unlock every house item.", points = 25,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = houseUnlockCount() && prevHouseUnlockCount() == 59 
)

//Dict of bit corresponding to the character number
charNumToUnlockBit = {
                         1: bit5(0x12a423),  2: bit6(0x12a423),  3: bit7(0x12a423),  4: bit0(0x12a424),  5: bit1(0x12a424),
                         6: bit2(0x12a424),  7: bit3(0x12a424),  8: bit4(0x12a424),  9: bit5(0x12a424), 10: bit6(0x12a424),
                        11: bit7(0x12a424), 12: bit0(0x12a425), 13: bit1(0x12a425), 14: bit2(0x12a425), 15: bit3(0x12a425),
                        16: bit4(0x12a425), 17: bit5(0x12a425), 18: bit6(0x12a425), 19: bit7(0x12a425), 20: bit0(0x12a426),
                        21: bit1(0x12a426), 22: bit2(0x12a426), 23: bit3(0x12a426), 24: bit4(0x12a426), 25: bit5(0x12a426),
                        26: bit6(0x12a426), 27: bit7(0x12a426), 28: bit0(0x12a427), 29: bit1(0x12a427), 30: bit2(0x12a427),
                        31: bit3(0x12a427), 32: bit4(0x12a427), 33: bit5(0x12a427), 34: bit6(0x12a427), 35: bit7(0x12a427),
                        36: bit0(0x12a428), 37: bit1(0x12a428), 38: bit2(0x12a428), 39: bit3(0x12a428), 40: bit4(0x12a428),
                        41: bit5(0x12a428), 42: bit6(0x12a428)
                     }
charNumToName = {
                         1: "Rosalyn",  2: "Elmira",  3: "DJ Candy",  4: "Goth Boy",  5: "Watanabe",
                         6: "Dr. F",  7: "Gino",  8: "Roxie",  9: "Buddy", 10: "Vincent",
                        11: "Nicole", 12: "Odin", 13: "Poppy", 14: "Violet", 15: "Ginny",
                        16: "Vic", 17: "Travis", 18: "Trevor", 19: "Aran", 20: "Dolly",
                        21: "Zoe", 22: "Shirley", 23: "Chaz", 24: "Tim", 25: "Helen",
                        26: "Ewan", 27: "Tyler", 28: "Ashley", 29: "Joseph", 30: "Olivia",
                        31: "Sophie", 32: "Charlie", 33: "Marie", 34: "Tracy", 35: "Hawk",
                        36: "Martin", 37: "Nicki", 38: "Elizabeth", 39: "Emma", 40: "Foster",
                        41: "King Roland", 42: "MC Emi"
                }
                
for index in range(1, 42){
    achievement(title = charNumToName[index] + "'s Friend", description = "Befriend " + charNumToName[index] + ", letting you select them for festivals and minigames!" , points = 5,
                id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
                trigger = charNumToUnlockBit[index] == 1 && prev(charNumToUnlockBit[index]) == 0  && prev(byte(0x12a24c)) != 0x00     
                )
}
    


// $12A79C: [4 BIT] P2 Difficulty
// $12A9E0: [4 BIT] P3 Difficulty
// $12AC24: [4 BIT] P4 Difficulty
// Normal => bit2() == 0 && bit1() == 1
// Strong => bit2() == 1 && bit1() == 0
// Powerful => bit2() == 1 && bit1() == 1


//Check difficulty or higher
// Weak == 0
// Normal == 1
// Strong == 2
// Powerful == 3
function cpuDifficultyCheck(difficulty) //check difficulty or higher
{
    if(difficulty == 0)
        return true
    else if(difficulty == 1)
    {
        return ( ( (bit2(0x12A79C) == 0 && bit1(0x12A79C) == 1) ||  (bit2(0x12A79C) == 1 && bit1(0x12A79C) == 0) || (bit2(0x12A79C) == 1 && bit1(0x12A79C) == 1) ) && //P2
                 ( (bit2(0x12A9E0) == 0 && bit1(0x12A9E0) == 1) ||  (bit2(0x12A9E0) == 1 && bit1(0x12A9E0) == 0) || (bit2(0x12A9E0) == 1 && bit1(0x12A9E0) == 1) ) && //P3
                 ( (bit2(0x12AC24) == 0 && bit1(0x12AC24) == 1) ||  (bit2(0x12AC24) == 1 && bit1(0x12AC24) == 0) || (bit2(0x12AC24) == 1 && bit1(0x12AC24) == 1) ) //P4
               )
    }
    else if(difficulty == 2)
    {
        return ( (   (bit2(0x12A79C) == 1 && bit1(0x12A79C) == 0) || (bit2(0x12A79C) == 1 && bit1(0x12A79C) == 1) ) && //P2
                 (   (bit2(0x12A9E0) == 1 && bit1(0x12A9E0) == 0) || (bit2(0x12A9E0) == 1 && bit1(0x12A9E0) == 1) ) && //P3
                 (   (bit2(0x12AC24) == 1 && bit1(0x12AC24) == 0) || (bit2(0x12AC24) == 1 && bit1(0x12AC24) == 1) ) //P4
               )
    }
    else if(difficulty == 3)
    {
        return ( (   (bit2(0x12A79C) == 1 && bit1(0x12A79C) == 1) ) && //P2
                 (   (bit2(0x12A9E0) == 1 && bit1(0x12A9E0) == 1) ) && //P3
                 (   (bit2(0x12AC24) == 1 && bit1(0x12AC24) == 1) ) //P4
               )
    }
}

// $12A3E0: [8 BIT] Festivals Unlocked 1 Bitflags
//          Bit 0 = Happy Festival
//          Bit 1 = Pretty Festival
//          Bit 2 = Music Festival
//          Bit 3 = Bizarre Festival
//          Bit 4 = Delicious Festival
//          Bit 5 = Speed Festival
//          Bit 6 = Horror Festival
//          Bit 7 = Sports Festival
// $12A3E1: [8 BIT] Festivals Unlocked 2 Bitflags
//          Bit 0 = Dynamic Festival
//          Bit 1 = Dream Festival
//          Bit 2 = Customizing Festival
//          Bit 3 = All Stars (Beat Customizing Festival)
achievement(title = "Opening Festival Winner", description = "Win the Opening Festival. Let the minigames begin!", points = 2,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = bit0(0x12A3E0) == 1 && prev(bit0(0x12A3E0)) == 0 && 
            byte(0x12a24c) == 0xcf && prev(byte(0x12a24c)) != 0x00 //at the festival hall not loading in from menu
)

achievement(title = "Happy Festival Winner", description = "Win the Happy Festival. Are you happy now?", points = 3,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = bit1(0x12A3E0) == 1 && prev(bit1(0x12A3E0)) == 0 && 
            byte(0x12a24c) == 0xcf && prev(byte(0x12a24c)) != 0x00 //at the festival hall not loading in from menu
)

achievement(title = "Pretty Festival Winner", description = "Win the Pretty Festival. Looking good!", points = 4,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = bit2(0x12A3E0) == 1 && prev(bit2(0x12A3E0)) == 0 && 
            byte(0x12a24c) == 0xcf && prev(byte(0x12a24c)) != 0x00 //at the festival hall not loading in from menu
)

achievement(title = "Music Festival Winner", description = "Win the Music Festival. Give yourself to the rhythm!", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = bit3(0x12A3E0) == 1 && prev(bit3(0x12A3E0)) == 0 && 
            byte(0x12a24c) == 0xcf && prev(byte(0x12a24c)) != 0x00 //at the festival hall not loading in from menu
)

achievement(title = "Bizarre Festival Winner", description = "Win the Bizarre Festival. Dr. F is pleased!", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = bit4(0x12A3E0) == 1 && prev(bit4(0x12A3E0)) == 0 && 
            byte(0x12a24c) == 0xcf && prev(byte(0x12a24c)) != 0x00 //at the festival hall not loading in from menu
) 

achievement(title = "Delicious Festival Winner", description = "Win the Delicious Festival. Mmm, delicious points.", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = bit5(0x12A3E0) == 1 && prev(bit5(0x12A3E0)) == 0 && 
            byte(0x12a24c) == 0xcf && prev(byte(0x12a24c)) != 0x00 //at the festival hall not loading in from menu
)

achievement(title = "Speed Festival Winner", description = "Win the Speed Festival. You should be fined for speeding!", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = bit6(0x12A3E0) == 1 && prev(bit6(0x12A3E0)) == 0 && 
            byte(0x12a24c) == 0xcf && prev(byte(0x12a24c)) != 0x00 //at the festival hall, not loading in from menu
)

achievement(title = "Horror Festival Winner", description = "Win the Horror Festival. The 2000's emo crowd is slightly impressed.", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = bit7(0x12A3E0) == 1 && prev(bit7(0x12A3E0)) == 0 && 
            byte(0x12a24c) == 0xcf && prev(byte(0x12a24c)) != 0x00 //at the festival hall, not loading in from menu
)

achievement(title = "Sports Festival Winner", description = "Win the Sports Festival. Why play real sports when you can play esports?", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = bit0(0x12A3E1) == 1 && prev(bit0(0x12A3E1)) == 0 && 
            byte(0x12a24c) == 0xcf && prev(byte(0x12a24c)) != 0x00 //at the festival hall, not loading in from menu
)

achievement(title = "Dynamic Festival Winner", description = "Win the Dynamic Festival. You're a commoner no longer!", points = 10,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = bit1(0x12A3E1) == 1 && prev(bit1(0x12A3E1)) == 0 && 
            byte(0x12a24c) == 0xcf && prev(byte(0x12a24c)) != 0x00 //at the festival hall, not loading in from menu
)

achievement(title = "Dream Festival Winner", description = "Win the Dream Festival. No, you're not dreaming! You're almost there!", points = 10,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = bit2(0x12A3E1) == 1 && prev(bit2(0x12A3E1)) == 0 && 
            byte(0x12a24c) == 0xcf && prev(byte(0x12a24c)) != 0x00 //at the festival hall, not loading in from menu
)

achievement(title = "Customizing Festival Winner", description = "Win the Customizing Festival. Play your favorite games and get points! A win-win scenario!", points = 25,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = bit3(0x12A3E1) == 1 && prev(bit3(0x12A3E1)) == 0 && 
            byte(0x12a24c) == 0xcf && prev(byte(0x12a24c)) != 0x00 //at the festival hall, not loading in from menu
)

achievement(title = "Opening Festival Master", description = "Win the Opening Festival with all CPUs on Powerful without using any cards.", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentFestival() == Opening_Festival && byte(0x12a50a) == festivalTotalMinigames[Opening_Festival] &&
                      byte(0x08b098) == 0x18 && byte(0x0ac797) == 0x4f && //festival finish screen
                      (bit1(0x12a79c) == 1 && bit2(0x12a79c) == 1) && //p2 powerful
                      (bit1(0x12a9e0) == 1 && bit2(0x12a9e0) == 1) && //p3 powerful
                      (bit1(0x12ac24) == 1 && bit2(0x12ac24) == 1) && //p4 powerful
                      byte(0x12a559) == 0x02 && //never used card
                      byte(0x09c891) == 0x00 //1st place on the leaderboard (win)                      
)

achievement(title = "Happy Festival Master", description = "Win the Happy Festival with all CPUs on Powerful without using any cards.", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentFestival() == Happy_Festival && byte(0x12a50a) == festivalTotalMinigames[Happy_Festival] &&
                      byte(0x08b098) == 0x18 && byte(0x0ac797) == 0x4f && //festival finish screen
                      (bit1(0x12a79c) == 1 && bit2(0x12a79c) == 1) && //p2 powerful
                      (bit1(0x12a9e0) == 1 && bit2(0x12a9e0) == 1) && //p3 powerful
                      (bit1(0x12ac24) == 1 && bit2(0x12ac24) == 1) && //p4 powerful
                      byte(0x12a559) == 0x02 && //never used card
                      byte(0x09c891) == 0x00 //1st place on the leaderboard (win)                      
)

achievement(title = "Pretty Festival Master", description = "Win the Pretty Festival with all CPUs on Powerful without using any cards.", points = 10,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentFestival() == Pretty_Festival && byte(0x12a50a) == festivalTotalMinigames[Pretty_Festival] &&
                      byte(0x08b098) == 0x18 && byte(0x0ac797) == 0x4f && //festival finish screen
                      (bit1(0x12a79c) == 1 && bit2(0x12a79c) == 1) && //p2 powerful
                      (bit1(0x12a9e0) == 1 && bit2(0x12a9e0) == 1) && //p3 powerful
                      (bit1(0x12ac24) == 1 && bit2(0x12ac24) == 1) && //p4 powerful
                      byte(0x12a559) == 0x02 && //never used card
                      byte(0x09c891) == 0x00 //1st place on the leaderboard (win)                      
)

achievement(title = "Music Festival Master", description = "Win the Music Festival with all CPUs on Powerful without using any cards.", points = 10,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentFestival() == Music_Festival && byte(0x12a50a) == festivalTotalMinigames[Music_Festival] &&
                      byte(0x08b098) == 0x18 && byte(0x0ac797) == 0x4f && //festival finish screen
                      (bit1(0x12a79c) == 1 && bit2(0x12a79c) == 1) && //p2 powerful
                      (bit1(0x12a9e0) == 1 && bit2(0x12a9e0) == 1) && //p3 powerful
                      (bit1(0x12ac24) == 1 && bit2(0x12ac24) == 1) && //p4 powerful
                      byte(0x12a559) == 0x02 && //never used card
                      byte(0x09c891) == 0x00 //1st place on the leaderboard (win)                      
)

achievement(title = "Bizarre Festival Master", description = "Win the Bizarre Festival with all CPUs on Powerful without using any cards.", points = 10,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentFestival() == Bizarre_Festival && byte(0x12a50a) == festivalTotalMinigames[Bizarre_Festival] &&
                      byte(0x08b098) == 0x18 && byte(0x0ac797) == 0x4f && //festival finish screen
                      (bit1(0x12a79c) == 1 && bit2(0x12a79c) == 1) && //p2 powerful
                      (bit1(0x12a9e0) == 1 && bit2(0x12a9e0) == 1) && //p3 powerful
                      (bit1(0x12ac24) == 1 && bit2(0x12ac24) == 1) && //p4 powerful
                      byte(0x12a559) == 0x02 && //never used card
                      byte(0x09c891) == 0x00 //1st place on the leaderboard (win)                      
)

achievement(title = "Delicious Festival Master", description = "Win the Delicious Festival with all CPUs on Powerful without using any cards.", points = 10,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentFestival() == Delicious_Festival && byte(0x12a50a) == festivalTotalMinigames[Delicious_Festival] &&
                      byte(0x08b098) == 0x18 && byte(0x0ac797) == 0x4f && //festival finish screen
                      (bit1(0x12a79c) == 1 && bit2(0x12a79c) == 1) && //p2 powerful
                      (bit1(0x12a9e0) == 1 && bit2(0x12a9e0) == 1) && //p3 powerful
                      (bit1(0x12ac24) == 1 && bit2(0x12ac24) == 1) && //p4 powerful
                      byte(0x12a559) == 0x02 && //never used card
                      byte(0x09c891) == 0x00 //1st place on the leaderboard (win)                      
)

achievement(title = "Speed Festival Master", description = "Win the Speed Festival with all CPUs on Powerful without using any cards.", points = 10,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentFestival() == Speed_Festival && byte(0x12a50a) == festivalTotalMinigames[Speed_Festival] &&
                      byte(0x08b098) == 0x18 && byte(0x0ac797) == 0x4f && //festival finish screen
                      (bit1(0x12a79c) == 1 && bit2(0x12a79c) == 1) && //p2 powerful
                      (bit1(0x12a9e0) == 1 && bit2(0x12a9e0) == 1) && //p3 powerful
                      (bit1(0x12ac24) == 1 && bit2(0x12ac24) == 1) && //p4 powerful
                      byte(0x12a559) == 0x02 && //never used card
                      byte(0x09c891) == 0x00 //1st place on the leaderboard (win)                      
)

achievement(title = "Horror Festival Master", description = "Win the Horror Festival with all CPUs on Powerful without using any cards.", points = 10,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentFestival() == Horror_Festival && byte(0x12a50a) == festivalTotalMinigames[Horror_Festival] &&
                      byte(0x08b098) == 0x18 && byte(0x0ac797) == 0x4f && //festival finish screen
                      (bit1(0x12a79c) == 1 && bit2(0x12a79c) == 1) && //p2 powerful
                      (bit1(0x12a9e0) == 1 && bit2(0x12a9e0) == 1) && //p3 powerful
                      (bit1(0x12ac24) == 1 && bit2(0x12ac24) == 1) && //p4 powerful
                      byte(0x12a559) == 0x02 && //never used card
                      byte(0x09c891) == 0x00 //1st place on the leaderboard (win)                      
)

achievement(title = "Sports Festival Master", description = "Win the Sports Festival with all CPUs on Powerful without using any cards.", points = 10,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentFestival() == Sports_Festival && byte(0x12a50a) == festivalTotalMinigames[Sports_Festival] &&
                      byte(0x08b098) == 0x18 && byte(0x0ac797) == 0x4f && //festival finish screen
                      (bit1(0x12a79c) == 1 && bit2(0x12a79c) == 1) && //p2 powerful
                      (bit1(0x12a9e0) == 1 && bit2(0x12a9e0) == 1) && //p3 powerful
                      (bit1(0x12ac24) == 1 && bit2(0x12ac24) == 1) && //p4 powerful
                      byte(0x12a559) == 0x02 && //never used card
                      byte(0x09c891) == 0x00 //1st place on the leaderboard (win)                      
)

achievement(title = "Dynamic Festival Master", description = "Win the Dynamic Festival with all CPUs on Powerful without using any cards.", points = 25,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentFestival() == Dynamic_Festival && byte(0x12a50a) == festivalTotalMinigames[Dynamic_Festival] &&
                      byte(0x08b098) == 0x18 && byte(0x0ac797) == 0x4f && //festival finish screen
                      (bit1(0x12a79c) == 1 && bit2(0x12a79c) == 1) && //p2 powerful
                      (bit1(0x12a9e0) == 1 && bit2(0x12a9e0) == 1) && //p3 powerful
                      (bit1(0x12ac24) == 1 && bit2(0x12ac24) == 1) && //p4 powerful
                      byte(0x12a559) == 0x02 && //never used card
                      byte(0x09c891) == 0x00 //1st place on the leaderboard (win)                      
)

achievement(title = "Dream Festival Master", description = "Win the Dream Festival with all CPUs on Powerful without using any cards.", points = 25,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentFestival() == Dream_Festival && byte(0x12a50a) == festivalTotalMinigames[Dream_Festival] &&
                      byte(0x08b098) == 0x18 && byte(0x0ac797) == 0x4f && //festival finish screen
                      (bit1(0x12a79c) == 1 && bit2(0x12a79c) == 1) && //p2 powerful
                      (bit1(0x12a9e0) == 1 && bit2(0x12a9e0) == 1) && //p3 powerful
                      (bit1(0x12ac24) == 1 && bit2(0x12ac24) == 1) && //p4 powerful
                      byte(0x12a559) == 0x02 && //never used card
                      byte(0x09c891) == 0x00 //1st place on the leaderboard (win)                      
)

achievement(title = "Customizing Festival Master", description = "Win the Customizing Festival with all CPUs on Powerful without using any cards.", points = 50,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentFestival() == Customizing_Festival && byte(0x12a50a) == festivalTotalMinigames[Customizing_Festival] &&
                      byte(0x08b098) == 0x18 && byte(0x0ac797) == 0x4f && //festival finish screen
                      (bit1(0x12a79c) == 1 && bit2(0x12a79c) == 1) && //p2 powerful
                      (bit1(0x12a9e0) == 1 && bit2(0x12a9e0) == 1) && //p3 powerful
                      (bit1(0x12ac24) == 1 && bit2(0x12ac24) == 1) && //p4 powerful
                      byte(0x12a559) == 0x02 && //never used card
                      byte(0x09c891) == 0x00 //1st place on the leaderboard (win)                      
)

// $12A50A: [8 BIT] Current Minigame Number During Festival



// $12A56C: [8 BIT] P1 Name First Letter (1)
// $12A56E: [8 BIT]  P1 Name Letter 2
// $12A570: [8 BIT]  P1 Name Letter 3
// $12A572: [8 BIT]  P1 Name Letter 4
// $12A574: [8 BIT]  P1 Name Letter 5
// $12A576: [8 BIT]  P1 Name Letter 6
// $12A578: [8 BIT]  P1 Name Letter 7
// $12A57A: [8 BIT]  P1 Name Letter 8
// $12A57C: [8 BIT]  P1 Name Letter 9
// $12A57E: [8 BIT]  P1 Name Letter 10
// $12A580: [8 BIT]  P1 Name Letter 11
// $12A582: [8 BIT]  P1 Name Letter 12
// $12A584: [8 BIT]  P1 Name Letter 13
// $12A586: [8 BIT]  P1 Name Letter 14
// $12A588: [8 BIT]  P1 Name Letter 15
// $12A58A: [8 BIT]  P1 Name Last Possible Letter (16)

// $12A774: [16 BIT] P1 Festival Score (max 9,999)
// $12A79C: [4 BIT]  P2 Difficulty
// $12A9B8: [16 BIT] P2 Festival Score (max 9,999)
// $12A9E0: [4 BIT] P3 Difficulty
// $12ABFC: [16 BIT] P3 Festival Score (max 9,999)
// $12AC24: [4 BIT] P4 Difficulty
// $12AE40: [16 BIT] P4 Festival Score (max 9,999)


// $12AF98: [32 BIT] Total Overall Score (from all festivals)



// $145216: [8 BIT] P1 Active Balloon Size in Sleeping Sophie
// $14525E: [8 BIT] P2 Active Balloon Size in Sleeping Sophie
// $1452A6: [8 BIT] P3 Active Balloon Size in Sleeping Sophie
// $1452EE: [8 BIT] P4 Active Balloon Size in Sleeping Sophie
achievement(title = "Narcolepsy Be Gone", description = "Win 'Sleeping Sophie' with at least 15 seconds remaining on the timer.", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentMinigameID() == Sleeping_Sophie && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            ( byte(0x09c419) >= 0x02 || (byte(0x09c419) == 0x01 && byte(0x09c445) >= 0x05) ) &&
            trigger_when(byte(0x0ac797) == 0x0b)
)


// $1467E8: [8 BIT]  P1 Active Spaghetti Left in Spaghetti Spin-Off
// $09b834:[8 BIT] Spaghetti Spin-Off Timer Ten's Place State
//0xcb = 30 seconds
//0xca = 29-20 seconds
//0xc9 = 19-10 seconds
achievement(title = "Pasta Lover", description = "In 'Spaghetti Spin-Off', clean your plate with at least 10 seconds remaining on the timer.", points = 5,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = currentMinigameID() == Spaghetti_Spin_Off && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && //Game not paused
            byte(0x0ac797) == 0x3c && //Game Running
            (byte(0x09b834) == 0xcb && byte(0x09b32d) != 0x00 || byte(0x09b834) == 0xca && byte(0x09b32d) != 0x00 || byte(0x09b834) == 0xc9 && byte(0x09b32d) != 0x00)  &&
            trigger_when(byte(0x1467E8) == 0)
)

// $1468B4: [8 BIT]  P1 Active Score in Clap Happy
achievement(title = "Standing Ovation", description = "Score at least 150 points in 'Clap Happy'.", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentMinigameID() == Clap_Happy && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && //Game not paused
            byte(0x0ac797) == 0x64 && //Game Running
            trigger_when(byte(0x1468B4) >= 150)
)

// $146900: [8 BIT]  P1 Active Score in Air-Guitar Star
achievement(title = "Guitar Hero", description = "Score at least 90 points in 'Air-Guitar Star'.", points = 5,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = currentMinigameID() == Air_Guitar_Star && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && //Game not paused
            byte(0x0ac797) == 0x03 && //Game Running
            trigger_when(byte(0x146900) >= 90)
)


// $146AA4: [8 BIT]  P1 Active Score in Soccer Bounce
achievement(title = "EA Sports. It's In The Game", description = "Score 100 points in 'Soccer Bounce' by never missing a bounce.", points = 5,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = currentMinigameID() == Soccer_Bounce && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && //Game not paused
            byte(0x0ac797) == 0x64 && //Game Running
            trigger_when(byte(0x146AA4) >= 100)
)

// $146B0C: [8 BIT]  P1 Active Score in Chemistry Calamity
achievement(title = "The 'F' Stands for 'Achievement'", description = "Score 100 points in 'Chemistry Calamity'.", points = 5,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = currentMinigameID() == Chemistry_Calamity && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && //Game not paused
            byte(0x0ac797) == 0x3c && //Game Running
            trigger_when(byte(0x146B0C) >= 100)
)

// $146B5C: [8 BIT] P1 Active Percentage Dirty in Crystal Clear (0 = Win)
achievement(title = "Clairvoyant Cleanser", description = "Win 'Crystal Clear' with at least 40 seconds remaining on the timer.", points = 5,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = currentMinigameID() == Crystal_Clear && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            byte(0x0ac797) == 0x73 && //Game Running
            byte(0x09C705) >= 0x04 && byte(0x09c6f8) == 0xd9 &&
            trigger_when(byte(0x146B5C) == 0)
)


// $1470D2: [8 BIT] P1 Active Score in Shuffle Cup
achievement(title = "Beating The House", description = "Score 100 points in 'Shuffle Cup' by guessing correctly all 3 times.", points = 3,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = currentMinigameID() == Shuffle_Cup && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            byte(0x0ac797) == 0x3c && //Game Running
            trigger_when(byte(0x1470D2) >= 100)
)




// $147810: [8 BIT] P1 Active Score in Fashion Mogul
achievement(title = "Dolly's Dutiful Designer", description = "Earn at least 70 points in 'Fashion Mogul' without making any mistakes.", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentMinigameID() == Fashion_Mogul && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && //Game not paused
            disable_when( (byte(0x1477f4) == 0x03), until = byte(0x0ac797) != 0x80) &&
            trigger_when(byte(0x147810) >= 70)
)

// $147860: [8 BIT] (GUI) P1 Active Percentage in Signal Search // $09C731: [4 BIT] Minigame Timer Digit 2 in Signal Search if timer >= 10
// $09C705: [4 BIT]
//          P1 Milliseconds Digit 2 Bus! Stop!
//          Minigame Timer in Signal Search + Sim-Fu Showdown + Crystal Clear Digit 1 and Countdown if < 10
achievement(title = "Can You Hear Me Now?", description = "Win 'Signal Search' with at least 10 seconds remaining on the timer.", points = 5,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = currentMinigameID() == Signal_Search && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            byte(0x0ac797) == 0x0b && //Game Running
            byte(0x09c6f8) == 0x78 &&
            trigger_when(byte(0x147860) == 0x64)
)

// $147D34: [8 BIT] Cloth Patch Level (0-2)
//          0x02 = Final Level
// $147D38: [8 BIT] P1 Patches Completed on Current Cloth Pattern
//          0x04 on level 0x02 is win
achievement(title = "Tyler's Tailor in Training", description = "Win 'Clothing Cut-Out' without making any mistakes.", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentMinigameID() == Clothing_Cut_Out && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && //Game not paused
            disable_when( (byte(0x147d40) == 0x01), until = byte(0x0ac797) != 0x80) &&
            trigger_when(byte(0x147D34) == 0x02 && byte(0x147D38) == 0x04)
)


// $147F2A: [8 BIT] P1 Vertical Position in Bumper Boat Battle
//          0x00 = Before moving from the starting line
//          0xff = First movement
//          0x05 = Finish Line (Win)
// $147FBE: [8 BIT] P2 Vertical Position in Bumper Boat Battle
//          0x00 = Before moving from the starting line
//          0xff = First movement
//          0x05 = Finish Line (Win)
// $148052: [8 BIT] P3 Vertical Position in Bumper Boat Battle
//          0x00 = Before moving from the starting line
//          0xff = First movement
//          0x05 = Finish Line (Win)
// $1480E6: [8 BIT] P4 Vertical Position in Bumper Boat Battle
//          0x00 = Before moving from the starting line
//          0xff = First movement
//          0x05 = Finish Line (Win)
achievement(title = "Cautious Captain", description = "Win 'Bumper Boat Battle' without hitting any whirlpools.", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentMinigameID() == Bumper_Boat_Battle && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            disable_when( (byte(0x335646) != 0x00), until = byte(0x0ac797) != 0x80 && byte(0x0ac797) != 0x0b) &&
            trigger_when(byte(0x0ac797) == 0x0b)
)


// $148218: [8 BIT] P1 Active Score in Plane Pop
// $14821C: [8 BIT] P2 Active Score in Plane Pop
// $148220: [8 BIT] P3 Active Score in Plane Pop
// $148224: [8 BIT] P4 Active Score in Plane Pop
achievement(title = "Bloon's Plane Offense", description = "Score at least 90 points in 'Plane Pop'.", points = 5,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = currentMinigameID() == Plane_Pop && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            byte(0x0ac797) == 0x80 && //Game Running
            trigger_when(byte(0x148218) >= 90)
)


// $148374: [8 BIT] P1 Active Percentage (GUI) in Sudsy Salon
//          0x28 = start/end
//          0xcc = max (start washing)
// $148378: [8 BIT] P2 Active Percentage (GUI) in Sudsy Salon
// $14837C: [8 BIT] P3 Active Percentage (GUI) in Sudsy Salon
// $148380: [8 BIT] P4 Active Percentage (GUI) in Sudsy Salon
achievement(title = "Lather Rinse & Repeat", description = "Win 'Sudsy Salon' before any CPUs have finished shampooing.", points = 10,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentMinigameID() == Sudsy_Salon && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && //Game not paused
            disable_when( (byte(0x148378) == 0xcc || byte(0x14837C) == 0xcc || byte(0x148380) == 0xcc), until = byte(0x0ac797) != 0x3c ) &&
            trigger_when( byte(0x148374) == 0x28 && prior(byte(0x148374)) != 0x00)
)

// $148634: [8 BIT]  P1 Active Score in Okay Bouquet
achievement(title = "Poppy's Playtime", description = "Score at least 90 points in 'Okay Bouquet'.", points = 5,
            id = 0, badge = "00000", published = "22/6/2022", modified = "22/6/2022",
            trigger = currentMinigameID() == Okay_Bouquet && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && //Game not paused
            byte(0x0ac797) == 0x3c && //Game Running
            trigger_when(byte(0x148634) >= 90)
)

// $148804: [8 BIT]  P1 Active Score Pass and Check
achievement(title = "Paper Pushin' Bureaucrat", description = "Score 100 points in 'Pass and Check'.", points = 5,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = currentMinigameID() == Pass_and_Check && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            byte(0x0ac797) == 0x0b && //Game Running
            trigger_when(byte(0x148804) >= 100)
)


// $14886C: [4 BIT] P1 Active Number of Stages Won in Fashion Reaction
// $14888C: [4 BIT] P2 Active Number of Stages Won in Fashion Reaction
// $1488AC: [4 BIT] P3 Active Number of Stages Won in Fashion Reaction
// $1488CC: [4 BIT] P4 Active Number of Stages Won in Fashion Reaction
achievement(title = "Runway Model", description = "Win 'Fashion Reaction' without letting the CPUs win any round.", points = 5,
            id = 0, badge = "00000", published = "22/6/2022", modified = "22/6/2022",
            trigger = currentMinigameID() == Fashion_Reaction && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            disable_when( byte(0x14888C) != 0x00 || byte(0x1488AC) != 0x00 || byte(0x1488CC) != 0x00, until = byte(0x0ac797) != 0x3c ) &&
            trigger_when(byte(0x14886C) >= 3)
)

// $148F78: [8 BIT] P1 Active Score in Fortune Finders
// $148F7C: [8 BIT] P2 Active Score in Fortune Finders
// $148F80: [8 BIT] P3 Active Score in Fortune Finders
// $148F84: [8 BIT] P4 Active Score in Fortune Finders
achievement(title = "Gem Of The Day", description = "Find the gem worth 30 points in 'Fortune Finders'.", points = 2,
            id = 0, badge = "00000", published = "7/6/2022", modified = "7/6/2022",
            trigger = currentMinigameID() == Fortune_Finders && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            byte(0x0ac797) == 0x0b && //Game Running
            trigger_when(byte(0x148F78) == (prior(byte(0x148F78)) + 30) )
)

// $149034: [8 BIT] P1 Active Score in My Mix Masters
achievement(title = "DJ Hero", description = "Score 100 points in 'My Mix Masters'.", points = 5,
            id = 0, badge = "00000", published = "7/6/2022", modified = "7/6/2022",
            trigger = currentMinigameID() == My_Mix_Masters && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && //Game not paused
            byte(0x0ac797) == 0x80 && //Game Running
            trigger_when(byte(0x149034) >= 100)
)


// $149183: [8 BIT] P1 Active Score in Soft Service
achievement(title = "Dairy Queen Bee", description = "Score 100 points in 'Soft Service'.", points = 5,
            id = 0, badge = "00000", published = "7/6/2022", modified = "7/6/2022",
            trigger = currentMinigameID() == Soft_Service && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && //Game not paused
            byte(0x0ac797) == 0x64 && //Game Running
            trigger_when(byte(0x149183) >= 100)
)

// $149430: [8 BIT] P1 Active Score in Keys to Success
achievement(title = "Ginny's Personal Locksmith", description = "Win 'Keys to Success' without making any mistakes.", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentMinigameID() == Keys_to_Success && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            disable_when( (byte(0x14941c) == 0x07), until = byte(0x0ac797) != 0x3c && byte(0x0ac797) != 0x0b) &&
            trigger_when(byte(0x0ac797) == 0x0b)
)


// $149B08: [8 BIT] P1 Active Score in Petal Platform Peril
achievement(title = "Spooky Flower Collector", description = "Score at least 75 points in 'Petal Platform Peril'.", points = 5,
            id = 0, badge = "00000", published = "7/6/2022", modified = "7/6/2022",
            trigger = currentMinigameID() == Petal_Platform_Peril && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            byte(0x0ac797) == 0x64 && //Game Running
            trigger_when(byte(0x149B08) >= 75)
)

// $149BF0: [8 BIT] Timer for Yelling at P1 in Skull Finder
achievement(title = "Fossil Fighter", description = "Win 'Skull Finder' without making any mistakes.", points = 3,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentMinigameID() == Skull_Finder && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && //Game not paused
            disable_when( (byte(0x163f78) == 0x02 && byte(0x09fb51) == 0x33), until = byte(0x0ac797) != 0x3c && byte(0x0ac797) != 0x0b) &&
            trigger_when(byte(0x163f60) == 0x01 && byte(0x0ac797) == 0x0b)
)

// $149CBC: [4 BIT] P1 Active Score ( / 5 ) in Hidden Treasures
achievement(title = "Treasure Finder", description = "Win 'Hidden Treasures' with at least 30 seconds remaining on the timer.", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentMinigameID() == Hidden_Treasures && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            (byte(0x09c56c) == 0x78 && byte(0x09c579) >= 0x03 ) &&
            byte(0x0ac797) == 0x73 && //Game Running
            trigger_when(byte(0x149CBC) == 0x05)
)

// $14A09A: [8 BIT] P1 Active Score in Catch the Crook
achievement(title = "Police Cadet", description = "Reach the police station and win 'Catch the Crook' without hitting any obstacles.", points = 5,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = currentMinigameID() == Catch_the_Crook && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            disable_when( byte(0x14a099) == 0x9c || byte(0x14a099) == 0x98 || byte(0x14a099) == 0x18 || byte(0x14a099) == 0x19, until = byte(0x0ac797) != 0x80 &&  byte(0x0ac797) != 0x0b) &&
            trigger_when(byte(0x0ac797) == 0x0b)
)

// $14A1D8: [8 BIT] P1 Active Score in Pretty Pottery
achievement(title = "Pottery Perfectionist", description = "Score 100 points in 'Pretty Pottery' without making any mistakes.", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentMinigameID() == Pretty_Pottery && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            disable_when( (byte(0x09cc48) == 0x05 && byte(0x09c06f) == 0x40), until = byte(0x0ac797) != 0x64) &&
            trigger_when(byte(0x14A1D8) >= 100)
)

// $14A750: [8 BIT] P1 Active Score in Pastry Puzzle
// $14A754: [8 BIT] P2 Active Score in Pastry Puzzle
// $14A758: [8 BIT] P3 Active Score in Pastry Puzzle
// $14A75C: [8 BIT] P4 Active Score in Pastry Puzzle
achievement(title = "Sous Chef", description = "Score 100 points in 'Pastry Puzzle'.", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentMinigameID() == Pastry_Puzzle && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            byte(0x0ac797) == 0x80 &&
            trigger_when(byte(0x14A750) >= 100)
)

// $14A968: [8 BIT] P1 Active Score in Perfect Slot Jackpot
// $14A96C: [8 BIT] P2 Active Score in Perfect Slot Jackpot
// $14A970: [8 BIT] P3 Active Score in Perfect Slot Jackpot
// $14A974: [8 BIT] P4 Active Score in Perfect Slot Jackpot
achievement(title = "If Only Real Slots Were This Slow...", description = "Score at least 400 points in 'Perfect Slot Jackpot'.", points = 5,
            id = 0, badge = "00000", published = "7/6/2022", modified = "7/6/2022",
            trigger = currentMinigameID() == Perfect_Slot_Jackpot && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            byte(0x0ac797) == 0x0b && //Game Running
            trigger_when(word(0x14a968) >= 400)
)


// $14AAFA: [8 BIT] P1 Active Score Hush Hush Library Rush
achievement(title = "Librarian's Pet", description = "Score at least 50 points without pressing the run button in 'Hush Hush Library Rush'", points = 5,
            id = 0, badge = "00000", published = "7/6/2022", modified = "7/6/2022",
            trigger = currentMinigameID() == Hush_Hush_Library_Rush && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && //Game not paused
            disable_when(bit1(0x09f8b4) == 1 && byte(0x0a0095) == 0x11 && prior(byte(0x0a0095)) == 0x19, until= (byte(0x0ac797) != 0x64) )  &&
            trigger_when(byte(0x14AAFA) >= 50)
)

// $14B6E8: [8 BIT] P1 Active Score in Spotting Safari
// $14B6EC: [8 BIT] P2 Active Score in Spotting Safari
// $14B6F0: [8 BIT] P3 Active Score in Spotting Safari
// $14B6F4: [8 BIT] P4 Active Score in Spotting Safari
achievement(title = "Wildlife Conservationist", description = "Earn at least 75 Points in 'Spotting Safari' without making any mistakes.", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentMinigameID() == Spotting_Safari && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            disable_when( (byte(0x14b6fc) == 0x02), until = byte(0x0ac797) != 0x80) &&
            trigger_when(byte(0x14B6E8) >= 75)
)

// $14C0C4: [8 BIT] P1 Active Score in Sim-Fu Showdown
achievement(title = "Untouchable Sim-Fu Sensei", description = "Earn at least 70 Points in 'Sim-Fu Showdown' without getting hit.", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentMinigameID() == Sim_Fu_Showdown && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            disable_when( (byte(0x14c244) != 0x00), until = byte(0x0ac797) != 0x00) &&
            trigger_when(byte(0x14C0C4) >= 70)
)

// $14CA4C: [8 BIT] P1 Active Dishes Served in Vroom Service
//          (0x04 = Win)
//0x09c0a9: Ones Digit (when time >= 10)
//0x09c07d: Tens Digit (when time >= 10), Countdown if < 10.
achievement(title = "40 Seconds or Your Money Back", description = "In 'Vroom Service', win the minigame with at least 20 seconds remaining on the timer.", points = 5,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = currentMinigameID() == Vroom_Service && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            byte(0x0ac797) == 0x64 && //Game Running
            word(0x097470) == 0x9120 && //Check that cutscene isnt running
            ((byte(0x09c07d) >= 0x02) ) &&  //20-60
            byte(0x09c070) == 0x78 && //Not in "Single Digit" Mode
            trigger_when(byte(0x14CA4C) == 0x04)
)

// $150458: [8 BIT]  P1 Active Score in Haunted Hunted
achievement(title = "Professional Ghostbuster", description = "Score 100 points in 'Haunted Hunted'.", points = 5,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = currentMinigameID() == Haunted_Hunted && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            byte(0x0ac797) == 0x73 && //Game Running
            trigger_when(byte(0x150458) >= 100)
)


achievement(title = "The Gambler", description = "Take a risk and use the 'Gamble Card' during a festival.", points = 2,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = byte(0x12a24c) == 0xcf &&//festival hall
            byte(0x0ac797) == 0xd1 && byte(0x16d324) == 0x12
)

achievement(title = "3 OP Amigos", description = "Use the 'Hero Squad Card' during a festival.", points = 3,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = byte(0x12a24c) == 0xcf &&//festival hall
            byte(0x0ac797) == 0xd1 && byte(0x16d324) == 0x15
)

achievement(title = "Full Power Engaged", description = "Use the 'Full Power Card' during a festival.", points = 2,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = byte(0x12a24c) == 0xcf &&//festival hall
            byte(0x0ac797) == 0xd1 && byte(0x16d324) == 0x08
)

achievement(title = "Full Speed Ahead", description = "Use the 'Full Speed Card' during a festival.", points = 2,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = byte(0x12a24c) == 0xcf &&//festival hall
            byte(0x0ac797) == 0xd1 && byte(0x16d324) == 0x09
)

achievement(title = "Full Technique Applied", description = "Use the 'Full Technique Card' during a festival.", points = 2,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = byte(0x12a24c) == 0xcf &&//festival hall
            byte(0x0ac797) == 0xd1 && byte(0x16d324) == 0x0a
)

achievement(title = "Past, Present, and Future Tense", description = "Use the 'Full Tension Card' during a festival.", points = 2,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = byte(0x12a24c) == 0xcf &&//festival hall
            byte(0x0ac797) == 0xd1 && byte(0x16d324) == 0x0b
)

achievement(title = "Can't Touch This", description = "Use the 'All Powerful Card' during a festival.", points = 2,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = byte(0x12a24c) == 0xcf &&//festival hall
            byte(0x0ac797) == 0xd1 && byte(0x16d324) == 0x17
)


// $282ffe: [8 BIT] Soccer Ball Horizontal Position
// $283006: [8 BIT] Soccer Ball Vertical Position
achievement(title = "GOOOOOOAL!!!", description = "Kick the soccer ball into the net in the Downtown Area.", points = 1,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger =  byte(0x12a24c) == 0x01 && byte(0x12a24e) == 0x01 && //In the downtown area
            ( (byte(0x282ffe) == 0xfd && (byte(0x283006) == 0x0b || byte(0x283006) == 0x0c)) || //Left goal flags
              (byte(0x282ffe) == 0x07 && (byte(0x283006) == 0x0b || byte(0x283006) == 0x0c)) //Right goal flags
            )
)


// $12A3F0 - 12A3F5 : [8 BIT] Character Unlock Flags

function locationLookup() => byte(0x12a24c)

locations = {
    0x00 : "the Title Screen",
    0x01 : "the Downtown Main Area",
    0x02 : "the Residential Main Area",
    0x03 : "the Sea Side Main Area",
    0x04 : "the Plains Main Area",
    0x05 : "the Desert Main Area",
    0x2d : "Nicole's Boutique",
    0x2e : "Chef Watanabe's Sushi Restaurant",
    0x2f : "Chef Gino's Italian Restaurant",
    0x30 : "Joseph's House",
    0x31 : "Buddy's Hotel",
    0x32 : "Roxie's Ice Cream Shop",
    0x33 : "Ginny's House",
    0x65 : "Olivia's House",
    0x66 : "Trevor's Theatre",
    0x67 : "Chef Charlie's Cake Shop",
    0x68 : "Helen's House",
    0x69 : "Poppy's Flower Shop",
    0x6a : "Chaz's House",
    0x6b : "Martin's House",
    0x91 : "Ashley's Flower Shop",
    0x92 : "Goth Boy's Manor",
    0x93 : "Marie's Secret Hideout",
    0x94 : "Sophie's Furniture Shop",
    0x95 : "Foster's House",
    0xc8 : "My House",
    0xc9 : "Dolly's Costume Shop",
    0xca : "Club Candy",
    0xcb : "Vic's Card Shop",
    0xcc : "Shirley's Hair Salon",
    0xcd : "Violet's House",
    0xce : "Nicki's House",
    0xcf : "The Festival Hall",
    0xd0 : "The Police Station",
    0xd1 : "Tyler's Clothing Store",
    0xd2 : "Emma's House",
    0xd3 : "the Town Hall",
    0xd4 : "Elmira's Library",
    0xf5 : "Aran's House",
    0xf6 : "Dr.F's Lab",
    0xf7 : "Zoe's House",
    0xf8 : "Tracy's House",
    0xf9 : "Vincent's Museum"
}

function festivalLookup() => byte(0x12a508)

festivals = {
    0x00 : "Opening Festival",
    0x01 : "Happy Festival",
    0x02 : "Pretty Festival",
    0x03 : "Music Festival",
    0x04 : "Bizarre Festival",
    0x05 : "Delicious Festival",
    0x06 : "Speed Festival",
    0x07 : "Horror Festival",
    0x08 : "Sports Festival",
    0x09 : "Dynamic Festival",
    0x0a : "Dream Festival",
    0x0b : "Customizing Festival"
}

function scoreLookup() => word(0x12a774)

function minigameLookup() => byte(0x06bfbc)

minigames = {
    0x01 : "Pass and Check" ,
    0x02 : "Hush Hush Library Rush",
    0x03 : "My Mix Masters",
    0x04 : "Haunted Hunted",
    0x05 : "Sushi Scramble",
    0x06 : "Chemistry Calamity",
    0x07 : "Spaghetti Spin Off",
    0x08 : "Soft Service",
    0x09 : "Vroom Service",
    0x0a : "Skull Finder",
    0x0b : "Clap Happy",
    0x0c : "Air Guitar Star",
    0x0d : "Okay Bouquet",
    0x0e : "Petal Platform Peril",
    0x0f : "Keys to Success",
    0x10 : "Mallet Melee",
    0x11 : "Signal Search",
    0x12 : "Spotlight Please",
    0x13 : "Sim-Fu Showdown",
    0x14 : "Fashion Mogul",
    0x15 : "Crystal Clear",
    0x16 : "Sudsy Salon",
    0x17 : "Skating Scamper",
    0x18 : "Soccer Bounce",
    0x19 : "Bus! Stop!",
    0x1a : "Catch the Crook",
    0x1b : "Clothing Cut Out",
    0x1c : "Pretty Pottery",
    0x1d : "Gone Fishing",
    0x1e : "Hidden Treasures",
    0x1f : "Sleeping Sophie",
    0x20 : "Pastry Puzzle",
    0x21 : "Hang Gliding Hurricane",
    0x22 : "Fortune Finders",
    0x23 : "Shuffle Cup",
    0x24 : "Plane Pop",
    0x25 : "Bumper Boat Battle",
    0x26 : "Fashion Reaction",
    0x27 : "Perfect Slot Jackpot",
    0x28 : "Spotting Safari"
}

letters = {
    0x00 : "",
    0x20 : "",
    0x21 : "!",
    0x22 : "",
    0x23 : "#",
    0x24 : "$",
    0x25 : "％",
    0x26 : "&",
    0x27 : "'",
    0x28 : "(",
    0x29 : ")",
    0x2A : "*",
    0x2B : "+",
    0x2C : ",",
    0x2D : "-",
    0x2E : ".",
    0x2F : "/",
    0x30 : "0",
    0x31 : "1",
    0x32 : "2",
    0x33 : "3",
    0x34 : "4",
    0x35 : "5",
    0x36 : "6",
    0x37 : "7",
    0x38 : "8",
    0x39 : "9",
    0x3A : ":",
    0x3B : ";",
    0x3C : "<",
    0x3D : ":",
    0x3E : ">",
    0x3F : "?",
    0x40 : "@",
    0x41 : "A",
    0x42 : "B",
    0x43 : "C",
    0x44 : "D",
    0x45 : "E",
    0x46 : "F",
    0x47 : "G",
    0x48 : "H",
    0x49 : "I",
    0x4A : "J",
    0x4B : "K",
    0x4C : "L",
    0x4D : "M",
    0x4E : "N",
    0x4F : "O",
    0x50 : "P",
    0x51 : "Q",
    0x52 : "R",
    0x53 : "S",
    0x54 : "T",
    0x55 : "U",
    0x56 : "V",
    0x57 : "W",
    0x58 : "X",
    0x59 : "Y",
    0x5A : "Z",
    0x61 : "a",
    0x62 : "b",
    0x63 : "c",
    0x64 : "d",
    0x65 : "e",
    0x66 : "f",
    0x67 : "g",
    0x68 : "h",
    0x69 : "i",
    0x6A : "j",
    0x6B : "k",
    0x6C : "l",
    0x6D : "m",
    0x6E : "n",
    0x6F : "o",
    0x70 : "p",
    0x71 : "q",
    0x72 : "r",
    0x73 : "s",
    0x74 : "t",
    0x75 : "u",
    0x76 : "v",
    0x77 : "w",
    0x78 : "x",
    0x79 : "y",
    0x7A : "z",
}



rich_presence_conditional_display( byte(0x12a24c) == 0x00 && byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && word(0x12a774) == 0 &&  minigameLookup() != 0,  
                                  "Playing {16} as {0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11}{12}{13}{14}{15} in Minigame Mode",
                                  rich_presence_lookup("Letter1", byte(0x12a56c), letters),
                                  rich_presence_lookup("Letter2", byte(0x12a56e), letters),
                                  rich_presence_lookup("Letter3", byte(0x12a570), letters),
                                  rich_presence_lookup("Letter4", byte(0x12a572), letters),
                                  rich_presence_lookup("Letter5", byte(0x12a574), letters),
                                  rich_presence_lookup("Letter6", byte(0x12a576), letters),
                                  rich_presence_lookup("Letter7", byte(0x12a578), letters),
                                  rich_presence_lookup("Letter8", byte(0x12a57a), letters),
                                  rich_presence_lookup("Letter9", byte(0x12a57c), letters),
                                  rich_presence_lookup("Letter10", byte(0x12a57e), letters),
                                  rich_presence_lookup("Letter11", byte(0x12a580), letters),
                                  rich_presence_lookup("Letter12", byte(0x12a582), letters),
                                  rich_presence_lookup("Letter13", byte(0x12a584), letters),
                                  rich_presence_lookup("Letter14", byte(0x12a586), letters),
                                  rich_presence_lookup("Letter15", byte(0x12a588), letters),
                                  rich_presence_lookup("Letter16", byte(0x12a58a), letters),
                                  rich_presence_lookup("Minigame", minigameLookup(), minigames)
                                  
                                  ) 

rich_presence_conditional_display( byte(0x12a24c) == 0xcf && byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 &&  byte(0x0a009d) != 0x1c && ( byte(0x0ac797) == 0x0b || byte(0x0ac797) == 0x64 
                                    || byte(0x0ac797) == 0x73 || byte(0x0ac797) == 0x80 || byte(0x0ac797) == 0x3c || byte(0x0ac797) == 0x03 || byte(0x0ac797) == 0x00) ,  
                                  "Playing {16} as {0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11}{12}{13}{14}{15} in the {17}",                                  
                                  rich_presence_lookup("Letter1", byte(0x12a56c), letters),
                                  rich_presence_lookup("Letter2", byte(0x12a56e), letters),
                                  rich_presence_lookup("Letter3", byte(0x12a570), letters),
                                  rich_presence_lookup("Letter4", byte(0x12a572), letters),
                                  rich_presence_lookup("Letter5", byte(0x12a574), letters),
                                  rich_presence_lookup("Letter6", byte(0x12a576), letters),
                                  rich_presence_lookup("Letter7", byte(0x12a578), letters),
                                  rich_presence_lookup("Letter8", byte(0x12a57a), letters),
                                  rich_presence_lookup("Letter9", byte(0x12a57c), letters),
                                  rich_presence_lookup("Letter10", byte(0x12a57e), letters),
                                  rich_presence_lookup("Letter11", byte(0x12a580), letters),
                                  rich_presence_lookup("Letter12", byte(0x12a582), letters),
                                  rich_presence_lookup("Letter13", byte(0x12a584), letters),
                                  rich_presence_lookup("Letter14", byte(0x12a586), letters),
                                  rich_presence_lookup("Letter15", byte(0x12a588), letters),
                                  rich_presence_lookup("Letter16", byte(0x12a58a), letters),
                                  rich_presence_lookup("Minigame", minigameLookup(), minigames),
                                  rich_presence_lookup("Festival", festivalLookup(), festivals)
                                  )                                  
                                  
rich_presence_conditional_display( byte(0x12a24c) == 0xcf && word(0x12a774) != 0, 
                                    "Competing in the {16} with {17} points as {0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11}{12}{13}{14}{15}",
                                  rich_presence_lookup("Letter1", byte(0x12a56c), letters),
                                  rich_presence_lookup("Letter2", byte(0x12a56e), letters),
                                  rich_presence_lookup("Letter3", byte(0x12a570), letters),
                                  rich_presence_lookup("Letter4", byte(0x12a572), letters),
                                  rich_presence_lookup("Letter5", byte(0x12a574), letters),
                                  rich_presence_lookup("Letter6", byte(0x12a576), letters),
                                  rich_presence_lookup("Letter7", byte(0x12a578), letters),
                                  rich_presence_lookup("Letter8", byte(0x12a57a), letters),
                                  rich_presence_lookup("Letter9", byte(0x12a57c), letters),
                                  rich_presence_lookup("Letter10", byte(0x12a57e), letters),
                                  rich_presence_lookup("Letter11", byte(0x12a580), letters),
                                  rich_presence_lookup("Letter12", byte(0x12a582), letters),
                                  rich_presence_lookup("Letter13", byte(0x12a584), letters),
                                  rich_presence_lookup("Letter14", byte(0x12a586), letters),
                                  rich_presence_lookup("Letter15", byte(0x12a588), letters),
                                  rich_presence_lookup("Letter16", byte(0x12a58a), letters),
                                  rich_presence_lookup("Festival", festivalLookup(), festivals),
                                  rich_presence_value("Current Score", scoreLookup())
                                  )
                                  
rich_presence_conditional_display( byte(0x12a24c) != 0x00 && byte(0x0ac797) == 0x5a,  "Choosing a Festival as {0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11}{12}{13}{14}{15}",
                                  rich_presence_lookup("Letter1", byte(0x12a56c), letters),
                                  rich_presence_lookup("Letter2", byte(0x12a56e), letters),
                                  rich_presence_lookup("Letter3", byte(0x12a570), letters),
                                  rich_presence_lookup("Letter4", byte(0x12a572), letters),
                                  rich_presence_lookup("Letter5", byte(0x12a574), letters),
                                  rich_presence_lookup("Letter6", byte(0x12a576), letters),
                                  rich_presence_lookup("Letter7", byte(0x12a578), letters),
                                  rich_presence_lookup("Letter8", byte(0x12a57a), letters),
                                  rich_presence_lookup("Letter9", byte(0x12a57c), letters),
                                  rich_presence_lookup("Letter10", byte(0x12a57e), letters),
                                  rich_presence_lookup("Letter11", byte(0x12a580), letters),
                                  rich_presence_lookup("Letter12", byte(0x12a582), letters),
                                  rich_presence_lookup("Letter13", byte(0x12a584), letters),
                                  rich_presence_lookup("Letter14", byte(0x12a586), letters),
                                  rich_presence_lookup("Letter15", byte(0x12a588), letters),
                                  rich_presence_lookup("Letter16", byte(0x12a58a), letters)
                )

rich_presence_conditional_display( byte(0x12a24c) != 0x00 && byte(0x0ac797) == 0xd1 || byte(0x0ac797) == 0x62,  
                                "Starting the {16} playing as {0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11}{12}{13}{14}{15}",
                                  rich_presence_lookup("Letter1", byte(0x12a56c), letters),
                                  rich_presence_lookup("Letter2", byte(0x12a56e), letters),
                                  rich_presence_lookup("Letter3", byte(0x12a570), letters),
                                  rich_presence_lookup("Letter4", byte(0x12a572), letters),
                                  rich_presence_lookup("Letter5", byte(0x12a574), letters),
                                  rich_presence_lookup("Letter6", byte(0x12a576), letters),
                                  rich_presence_lookup("Letter7", byte(0x12a578), letters),
                                  rich_presence_lookup("Letter8", byte(0x12a57a), letters),
                                  rich_presence_lookup("Letter9", byte(0x12a57c), letters),
                                  rich_presence_lookup("Letter10", byte(0x12a57e), letters),
                                  rich_presence_lookup("Letter11", byte(0x12a580), letters),
                                  rich_presence_lookup("Letter12", byte(0x12a582), letters),
                                  rich_presence_lookup("Letter13", byte(0x12a584), letters),
                                  rich_presence_lookup("Letter14", byte(0x12a586), letters),
                                  rich_presence_lookup("Letter15", byte(0x12a588), letters),
                                  rich_presence_lookup("Letter16", byte(0x12a58a), letters),
                                  rich_presence_lookup("Festival", festivalLookup(), festivals)
)
                                  
                                  
rich_presence_conditional_display( byte(0x12a24c) != 0x00,  
                                    "{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11}{12}{13}{14}{15} is exploring {16} with {17} Simoleons | {18} Total Festival Points",
                                  rich_presence_lookup("Letter1", byte(0x12a56c), letters),
                                  rich_presence_lookup("Letter2", byte(0x12a56e), letters),
                                  rich_presence_lookup("Letter3", byte(0x12a570), letters),
                                  rich_presence_lookup("Letter4", byte(0x12a572), letters),
                                  rich_presence_lookup("Letter5", byte(0x12a574), letters),
                                  rich_presence_lookup("Letter6", byte(0x12a576), letters),
                                  rich_presence_lookup("Letter7", byte(0x12a578), letters),
                                  rich_presence_lookup("Letter8", byte(0x12a57a), letters),
                                  rich_presence_lookup("Letter9", byte(0x12a57c), letters),
                                  rich_presence_lookup("Letter10", byte(0x12a57e), letters),
                                  rich_presence_lookup("Letter11", byte(0x12a580), letters),
                                  rich_presence_lookup("Letter12", byte(0x12a582), letters),
                                  rich_presence_lookup("Letter13", byte(0x12a584), letters),
                                  rich_presence_lookup("Letter14", byte(0x12a586), letters),
                                  rich_presence_lookup("Letter15", byte(0x12a588), letters),
                                  rich_presence_lookup("Letter16", byte(0x12a58a), letters),
                                  rich_presence_lookup("Location", locationLookup(), locations),
                                  rich_presence_value( "Simoleons", dword(0x12a154) ),
                                  rich_presence_value("Total Fest Points", dword(0x12af98) )
                                  )
                                  

                                  
                                  
rich_presence_conditional_display( byte(0x12a24c) == 0x00, "Browsing The Menus")
rich_presence_display( "Playing MySims Party") //Basic default catch case                     

function charUnlockCount()
{
    return measured(
           bitcount(0x12A3F0) + bitcount(0x12A3F1) + bitcount(0x12A3F2) + 
           bitcount(0x12A3F3) + bitcount(0x12A3F4) + bit0(0x12A3F5) +
           bit1(0x12A3F5) + bit2(0x12A3F5) == 43
           )
}

function prevCharCount()
{
    return prev(bitcount(0x12A3F0) + bitcount(0x12A3F1) + bitcount(0x12A3F2) + 
           bitcount(0x12A3F3) + bitcount(0x12A3F4) + bit0(0x12A3F5) +
           bit1(0x12A3F5) + bit2(0x12A3F5))
}

achievement(title = "Sociable Sim", description = "Meet every sim and fill out your Sim Notebook", points = 25,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = charUnlockCount() && prevCharCount() == 42 
)

function calculateTimeSMS(SDIGIT1, SDIGIT2, MSDIGIT1, MSDIGIT2)
{
    return byte(SDIGIT1) * 1000 + byte(SDIGIT2) * 100 + byte(MSDIGIT1) * 10 + byte(MSDIGIT2)
}

function minigameScoreLeaderboard(id, name, minigame_id)
{
    if(minigame_id == 3 || minigame_id == 12) //Rhythm games have slightly different bit logic
    {
        leaderboard(name, "Get the High Score in " + name + ".",
        start = currentMinigameID() == minigame_id && isMinigameStarted() && byte(0x0ac48e) == 0x13,
        cancel = byte(0x0a0095) == 0x1e && byte(0x097cf1) == 0x00 && byte(0x09c050) == 0x01, //Check that (1) Pause Menu Opened (2) Minigame is Paused (3) Player Quit Game
        submit = byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && byte(0x0ac48e) == 0x00, //Check that (1) Pause Menu NOT opened (2) Minigame is Not Paused (3) Minigame finished
        value = byte(p1ActiveScoreLocations[minigame_id])
        )
    }
    else
    {
        leaderboard(name, "Get the High Score in " + name + ".",
        start = currentMinigameID() == minigame_id && isMinigameStarted(),
        cancel = byte(0x0a0095) == 0x1e && byte(0x097cf1) == 0x00 && byte(0x09c050) == 0x01, //Check that (1) Pause Menu Opened (2) Minigame is Paused (3) Player Quit Game
        submit = byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && byte(0x0ac48e) == 0x00, //Check that (1) Pause Menu NOT opened (2) Minigame is Not Paused (3) Minigame finished
        value = byte(p1ActiveScoreLocations[minigame_id])
        )
    }
    
}

function minigameTimeLeaderboardGT(id, name, minigame_id)
{
    if(minigame_id == 25)
    {
        leaderboard(name, "Get the High Score in " + name + ".",
        start = currentMinigameID() == minigame_id && isMinigameStarted(),
        cancel = byte(0x0a0095) == 0x1e && byte(0x097cf1) == 0x00 && byte(0x09c050) == 0x01 || //Check that (1) Pause Menu Opened (2) Minigame is Paused (3) Player Quit Game
                (byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && byte(0x0ac48e) == 0x00 && calculateTimeSMS(0x09C655, 0x09C681, 0x09C6D9, 0x09C705) == 0), //Cancel if submission is 00:00
        submit = byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && byte(0x0ac48e) == 0x00 && calculateTimeSMS(0x09C655, 0x09C681, 0x09C6D9, 0x09C705) > 0, //Check that (1) Pause Menu NOT opened (2) Minigame is Not Paused (3) Minigame finished (4) Check that time submission is > 0
        value = calculateTimeSMS(0x09C655, 0x09C681, 0x09C6D9, 0x09C705),
        format = "MILLISECS"
        )
    }
    else if(minigame_id == 18)
    {
        leaderboard(name, "Get the High Score in " + name + ".",
        start = currentMinigameID() == minigame_id && isMinigameStarted(),
        cancel = byte(0x0a0095) == 0x1e && byte(0x097cf1) == 0x00 && byte(0x09c050) == 0x01 || //Check that (1) Pause Menu Opened (2) Minigame is Paused (3) Player Quit Game
                (byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && byte(0x0ac48e) == 0x00 && calculateTimeSMS(0x09c33d, 0x09c369, 0x09c395, 0x09c3c1) == 0), //Cancel if submission is 00:00 too
        submit = byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && byte(0x0ac48e) == 0x00 && calculateTimeSMS(0x09c33d, 0x09c369, 0x09c395, 0x09c3c1) > 0, //Check that (1) Pause Menu NOT opened (2) Minigame is Not Paused (3) Minigame finished (4) Check that time submission is > 0
        value = calculateTimeSMS(0x09c33d, 0x09c369, 0x09c395, 0x09c3c1),
        format = "MILLISECS"
        )
    }
}



function festivalLeaderboard(festivalstring, festivalname)
{
    leaderboard(festivalstring, "Get the High Score in the " + festivalstring + ".",
        start = byte(0x08b098) == 0x08 && byte(0x0ac797) == 0x4f && currentFestival() == festivalname && byte(0x12a50a) == festivalTotalMinigames[festivalname],
        cancel = always_false(),
        submit = byte(0x08b098) == 0x18 && byte(0x0ac797) == 0x4f && currentFestival() == festivalname && byte(0x12a50a) == festivalTotalMinigames[festivalname],
        value = word(0x12a774)
    )
}



//Time-Based Game Leaderboards
    //GT Leaderboards
    minigameTimeLeaderboardGT(0, "Bus! Stop!", Bus_Stop)
    minigameTimeLeaderboardGT(0, "Spotlight Please!", Spotlight_Please)
    

//Score-Based Game Leaderboards                                                                                                                                                                                   
    //Rhythm Games (2)
    minigameScoreLeaderboard(0, "Air-Guitar Star", Air_Guitar_Star)
    minigameScoreLeaderboard(0, "My Mix Masters", My_Mix_Masters)

    //Non-Rhythm Games (22)
    minigameScoreLeaderboard(0, "Pass and Check", Pass_and_Check)
    minigameScoreLeaderboard(0, "Hush Hush Library Rush", Hush_Hush_Library_Rush)
    minigameScoreLeaderboard(0, "Haunted Hunted", Haunted_Hunted)
    minigameScoreLeaderboard(0, "Sushi Scramble", Sushi_Scramble)
    minigameScoreLeaderboard(0, "Chemistry Calamity", Chemistry_Calamity)
    minigameScoreLeaderboard(0, "Soft Service", Soft_Service)
    minigameScoreLeaderboard(0, "Clap Happy", Clap_Happy)
    minigameScoreLeaderboard(0, "Okay Bouquet", Okay_Bouquet)
    minigameScoreLeaderboard(0, "Petal Platform Peril", Petal_Platform_Peril) 
    minigameScoreLeaderboard(0, "Keys to Success", Keys_to_Success)
    minigameScoreLeaderboard(0, "Sim-Fu Showdown", Sim_Fu_Showdown)
    minigameScoreLeaderboard(0, "Fashion Mogul", Fashion_Mogul)
    minigameScoreLeaderboard(0, "Soccer Bounce", Soccer_Bounce)
    minigameScoreLeaderboard(0, "Catch the Crook", Catch_the_Crook)
    minigameScoreLeaderboard(0, "Pretty Pottery", Pretty_Pottery)
    minigameScoreLeaderboard(0, "Gone Fishing", Gone_Fishing) 
    minigameScoreLeaderboard(0, "Pastry Puzzle", Pastry_Puzzle)
    minigameScoreLeaderboard(0, "Fortune Finders", Fortune_Finders)
    minigameScoreLeaderboard(0, "Shuffle Cup", Shuffle_Cup)
    minigameScoreLeaderboard(0, "Plane Pop", Plane_Pop)
    minigameScoreLeaderboard(0, "Perfect Slot Jackpot", Perfect_Slot_Jackpot)
    minigameScoreLeaderboard(0, "Spotting Safari", Spotting_Safari)

    //Festival Score Leaderboards
    festivalLeaderboard("Opening Festival", Opening_Festival)
    festivalLeaderboard("Happy Festival", Happy_Festival)
    festivalLeaderboard("Pretty Festival", Pretty_Festival)
    festivalLeaderboard("Music Festival", Music_Festival)
    festivalLeaderboard("Bizarre Festival", Bizarre_Festival)
    festivalLeaderboard("Delicious Festival", Delicious_Festival)
    festivalLeaderboard("Speed Festival", Speed_Festival)
    festivalLeaderboard("Horror Festival", Horror_Festival)
    festivalLeaderboard("Sports Festival", Sports_Festival)
    festivalLeaderboard("Dynamic Festival", Dynamic_Festival)
    festivalLeaderboard("Dream Festival", Dream_Festival)
    festivalLeaderboard("Customizing Festival", Customizing_Festival)








