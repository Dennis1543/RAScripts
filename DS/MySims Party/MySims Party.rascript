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
// $09C35C: [8 BIT] P1 Bottom Screen Location (Left/Right) in Hang Gliding Hurricane
//          0x00 = cutscene
//          0x08 = start
//          0xdf = finish
// $09C369: [4 BIT] P1 Active Seconds Digit 2 in Spotlight Please!
// $09C388: [8 BIT] P2 Bottom Screen Location (Left/Right) in Hang Gliding Hurricane
//          0x00 = cutscene
//          0x08 = start
//          0xdf = finish
// $09C395: [4 BIT] P1 Active Milliseconds Digit 1 in Spotlight Please!
// $09C3B4: [8 BIT] P3 Bottom Screen Location (Left/Right) in Hang Gliding Hurricane
//          0x00 = cutscene
//          0x08 = start
//          0xdf = finish
// $09C3C1: [4 BIT] P1 Active Milliseconds Digit 2 in Spotlight Please!
achievement(title = "All Eyes On Me", description = "In 'Spotlight Please!', give Trevor at least 10 seconds of spotlight time.", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentMinigameID() == Spotlight_Please && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && //Game not paused
            byte(0x0ac797) == 0x64 && //Game Running
            trigger_when(byte(0x09C33D) >= 0x01)
)

// $09C3E0: [8 BIT] P4 Bottom Screen Location (Left/Right) in Hang Gliding Hurricane
//          0x00 = cutscene
//          0x08 = start
//          0xdf = finish
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




// $12A258: [8 BIT] Power Card Quantity
//          ff = Not Discovered
// $12A259: [8 BIT] Speed Card Quantity
//          ff = Not Discovered
// $12A25A: [8 BIT] Technique Card Quantity
//          ff = Not Discovered
// $12A25B: [8 BIT] Tension Card Quantity
//          ff = Not Discovered
// $12A25C: [8 BIT] Hi-Power Card Quantity
//          ff = Not Discovered
// $12A25D: [8 BIT] Hi-Speed Card Quantity
//          ff = Not Discovered
// $12A25E: [8 BIT] Hi-Technique Card Quantity
//          ff = Not Discovered
// $12A25F: [8 BIT] Hi-Tension Card Quantity
//          ff = Not Discovered
// $12A260: [8 BIT] Full Power Card Quantity
//          ff = Not Discovered
// $12A261: [8 BIT] Full Speed Card Quantity
//          ff = Not Discovered
// $12A262: [8 BIT] Full Technique Card Quantity
//          ff = Not Discovered
// $12A263: [8 BIT] Full Tension Card Quantity
//          ff = Not Discovered
// $12A264: [8 BIT] Stamina Card Quantity
//          ff = Not Discovered
// $12A265: [8 BIT] Recovery Card Quantity
//          ff = Not Discovered
// $12A266: [8 BIT] Hi Recovery Card Quantity
//          ff = Not Discovered
// $12A267: [8 BIT] Full Recovery Card Quantity
//          ff = Not Discovered
// $12A268: [8 BIT] Medical Card Quantity
//          ff = Not Discovered
// $12A269: [8 BIT] Hospital Card Quantity
//          ff = Not Discovered
// $12A26A: [8 BIT] Gamble Card Quantity
//          ff = Not Discovered
// $12A26B: [8 BIT] Hero Card Quantity
//          ff = Not Discovered
// $12A26C: [8 BIT] Super Hero Card Quantity
//          ff = Not Discovered
// $12A26D: [8 BIT] Hero Squad Card Quantity
//          ff = Not Discovered
// $12A26E: [8 BIT] Invincible Card Quantity
//          ff = Not Discovered
// $12A26F: [8 BIT] All Powerful Card Quantity
//          ff = Not Discovered
// $12A270: [8 BIT] Seal Card Quantity
//          ff = Not Discovered
// $12A271: [8 BIT] Random Sim Card Quantity
//          ff = Not Discovered
// $12A272: [8 BIT] Seal All Card Quantity
//          ff = Not Discovered
// $12A273: [8 BIT] All Random Sims Card Quantity
//          ff = Not Discovered
// $12A274: [8 BIT] Out of Breath Card Quantity
//          ff = Not Discovered
// $12A275: [8 BIT] Capture Card Quantity
//          ff = Not Discovered
// $12A276: [8 BIT] Capture All Card Quantity
//          ff = Not Discovered
// $12A277: [8 BIT] Replacement Card Quantity
//          ff = Not Discovered
// $12A278: [8 BIT] Weakling Card Quantity
//          ff = Not Discovered
// $12A279: [8 BIT] Crybaby Card Quantity
//          ff = Not Discovered
// $12A27A: [8 BIT] Lightning Card Quantity
//          ff = Not Discovered
// $12A27B: [8 BIT] Accident Card Quantity
//          ff = Not Discovered
// $12A27C: [8 BIT] Sleep Card Quantity
//          ff = Not Discovered
// $12A27D: [8 BIT] Hibernation Card Quantity
//          ff = Not Discovered
// $12A27E: [8 BIT] Repeat Sim Card Quantity
//          ff = Not Discovered
// $12A27F: [8 BIT] Destiny Card Quantity
//          ff = Not Discovered
// $12A280: [8 BIT] Powerful Card Quantity
//          ff = Not Discovered
// $12A281: [8 BIT] Speedy Card Quantity
//          ff = Not Discovered
// $12A282: [8 BIT] Technical Card Quantity
//          ff = Not Discovered
// $12A283: [8 BIT] Barrier Card Quantity
//          ff = Not Discovered
// $12A284: [8 BIT] Counter Card Quantity
//          ff = Not Discovered
// $12A285: [8 BIT] Support Card Quantity
//          ff = Not Discovered
// $12A286: [8 BIT] Never Tired Card Quantity
//          ff = Not Discovered
// $12A287: [8 BIT] Fickle Card Quantity
//          ff = Not Discovered
// $12A288: [8 BIT] Handicap Card Quantity
//          ff = Not Discovered
// $12A289: [8 BIT] Hi-Handicap Card Quantity
//          ff = Not Discovered
// $12A28A: [8 BIT] Lucky Card Quantity
//          ff = Not Discovered
// $12A28B: [8 BIT] Let Me See Card Quantity
//          ff = Not Discovered

// $12A296: [8 BIT] Layered Black Hair Quantity
//          DEFAULT UNLOCKED
// $12A297: [8 BIT] Layered Brown Hair Quantity
//          DEFAULT UNLOCKED
// $12A298: [8 BIT] Layered Blonde Hair Quantity
//          DEFAULT UNLOCKED
// $12A299: [8 BIT] Short Black Hair Quantity
//          ff = Not Discovered
// $12A29A: [8 BIT] Short Brown Hair Quantity
//          ff = Not Discovered
// $12A29B: [8 BIT] Short Blonde Hair Quantity
//          ff = Not Discovered
// $12A29C: [8 BIT] Medium Black Hair Quantity
//          ff = Not Discovered
// $12A29D: [8 BIT] Medium Blonde Hair Quantity
//          ff = Not Discovered
// $12A29E: [8 BIT] Short Black Perm Quantity
//          ff = Not Discovered
// $12A29F: [8 BIT] Short Blonde Perm Quantity
//          ff = Not Discovered
// $12A2A0: [8 BIT] Parted Brown Hair Quantity
//          ff = Not Discovered
// $12A2A1: [8 BIT] Parted Blonde Hair Quantity
//          ff = Not Discovered
// $12A2A2: [8 BIT] Wavy Red Hair Quantity
//          ff = Not Discovered
// $12A2A3: [8 BIT] Wavy Blue Hair Quantity
//          ff = Not Discovered
// $12A2A4: [8 BIT] Wavy Green Hair Quantity
//          ff = Not Discovered
// $12A2A5: [8 BIT] Matted Blonde Hair Quantity
//          ff = Not Discovered
// $12A2A6: [8 BIT] Matted Blue Hair Quantity
//          ff = Not Discovered
// $12A2A7: [8 BIT] Flat Top Quantity
//          ff = Not Discovered
// $12A2A8: [8 BIT] Blonde Curls Quantity
//          ff = Not Discovered
// $12A2A9: [8 BIT] Goth Hair Quantity
//          ff = Not Discovered
// $12A2AA: [8 BIT] Short Spiky Hair Quantity
//          ff = Not Discovered
// $12A2AB: [8 BIT] Ranger Hat Quantity
//          ff = Not Discovered
// $12A2AC: [8 BIT] Grey Parted Hair Quantity
//          ff = Not Discovered
// $12A2AD: [8 BIT] Black Bangs Quantity
//          DEFAULT UNLOCKED
// $12A2AE: [8 BIT] Brown Bangs Quantity
//          DEFAULT UNLOCKED
// $12A2AF: [8 BIT] Blonde Bangs Quantity
//          DEFAULT UNLOCKED
// $12A2B0: [8 BIT] Semi-Long Black Quantity
//          DEFAULT UNLOCKED
// $12A2B1: [8 BIT] Semi-Long Brown Quantity
//          DEFAULT UNLOCKED
// $12A2B2: [8 BIT] Semi-Long Blonde Quantity
//          DEFAULT UNLOCKED
// $12A2B3: [8 BIT] Black Pigtail Quantity
//          ff = Not Discovered
// $12A2B4: [8 BIT] Brown Pigtail Quantity
//          ff = Not Discovered
// $12A2B5: [8 BIT] Blonde Pigtail Quantity
//          ff = Not Discovered
// $12A2B6: [8 BIT] Even Brown Hair Quantity
//          ff = Not Discovered
// $12A2B7: [8 BIT] Even Blond Hair Quantity
//          ff = Not Discovered
// $12A2B8: [8 BIT] Long Black Hair Quantity
//          ff = Not Discovered
// $12A2B9: [8 BIT] Long Brown Hair Quantity
//          ff = Not Discovered
// $12A2BA: [8 BIT] Long Blonde Hair Quantity
//          ff = Not Discovered
// $12A2BB: [8 BIT] Red Extensions Quantity
//          ff = Not Discovered
// $12A2BC: [8 BIT] Blue Extensions Quantity
//          ff = Not Discovered
// $12A2BD: [8 BIT] Green Extensions Quantity
//          ff = Not Discovered
// $12A2BE: [8 BIT] Brown Ponytail Quantity
//          ff = Not Discovered
// $12A2BF: [8 BIT] Blonde Ponytail Quantity
//          ff = Not Discovered
// $12A2C0: [8 BIT] Wavy Red Perm Quantity
//          ff = Not Discovered
// $12A2C1: [8 BIT] Wavy Green Perm Quantity
//          ff = Not Discovered
// $12A2C2: [8 BIT] Black Bun Quantity
//          ff = Not Discovered
// $12A2C3: [8 BIT] Brown Bun Quantity
//          ff = Not Discovered
// $12A2C4: [8 BIT] Red Side Buns Quantity
//          ff = Not Discovered
// $12A2C5: [8 BIT] Blue Side Buns Quantity
//          ff = Not Discovered
// $12A2C6: [8 BIT] Ribbon Pig Tails Quantity
//          ff = Not Discovered
// $12A2C7: [8 BIT] Librarian Hair Quantity
//          ff = Not Discovered
// $12A2C8: [8 BIT] Beehive Quantity
//          ff = Not Discovered
// $12A2C9: [8 BIT] Long Brown Bangs Quantity
//          ff = Not Discovered
// $12A2CA: [8 BIT] Flower Pig Tails Quantity
//          ff = Not Discovered
// $12A2CB: [8 BIT] Natural Black Hair Quantity
//          DEFAULT UNLOCKED
// $12A2CC: [8 BIT] Natural Brown Hair Quantity
//          DEFAULT UNLOCKED
// $12A2CD: [8 BIT] Natural Blonde Hair Quantity
//          DEFAULT UNLOCKED
// $12A2CE: [8 BIT] Brown Afro Quantity
//          ff = Not Discovered
// $12A2CF: [8 BIT] Blonde Duck Tail Quantity
//          ff = Not Discovered
// $12A2D0: [8 BIT] Blonde Mohawk Quantity
//          ff = Not Discovered
// $12A2D1: [8 BIT] Bald Quantity
//          ff = Not Discovered
// $12A2D2: [8 BIT] Samurai Hair Quantity
//          ff = Not Discovered
// $12A2D3: [8 BIT] Short Orange Hair Quantity
//          ff = Not Discovered
// $12A2D4: [8 BIT] Baseball Cap Quantity
//          DEFAULT UNLOCKED
// $12A2D5: [8 BIT] Newsboy Quantity
//          ff = Not Discovered
// $12A2D6: [8 BIT] Graduation Hat Quantity
//          ff = Not Discovered
// $12A2D7: [8 BIT] Ten-Gallon Hat Quantity
//          ff = Not Discovered
// $12A2D8: [8 BIT] Pirate's Cap Quantity
//          ff = Not Discovered
// $12A2D9: [8 BIT] Knitted Cap Quantity
//          ff = Not Discovered
// $12A2DA: [8 BIT] DJ Headphones Quantity
//          ff = Not Discovered
// $12A2DB: [8 BIT] Flight Goggles Quantity
//          ff = Not Discovered
// $12A2DC: [8 BIT] Doggie Hat Quantity
//          ff = Not Discovered
// $12A2DD: [8 BIT] Chef's Hat Quantity
//          ff = Not Discovered
// $12A2DE: [8 BIT] Sushi Hat Quantity
//          ff = Not Discovered
// $12A2DF: [8 BIT] Big Ribbon Quantity
//          ff = Not Discovered
// $12A2E0: [8 BIT] Straw Hat Quantity
//          ff = Not Discovered
// $12A2E1: [8 BIT] Yellow Stripe Shirt Quantity
//          DEFAULT UNLOCKED
// $12A2E2: [8 BIT] Green Stripe Shirt Quantity
//          ff = Not Discovered
// $12A2E3: [8 BIT] Blue Stripe Shirt Quantity
//          ff = Not Discovered
// $12A2E4: [8 BIT] Red V-Neck Quantity
//          DEFAULT UNLOCKED
// $12A2E5: [8 BIT] White V-Neck Quantity
//          ff = Not Discovered
// $12A2E6: [8 BIT] Black V-Neck Quantity
//          ff = Not Discovered
// $12A2E7: [8 BIT] White Tank Top Quantity
//          DEFAULT UNLOCKED
// $12A2E8: [8 BIT] Brown Tank Top Quantity
//          ff = Not Discovered
// $12A2E9: [8 BIT] Gray Tank Top Quantity
//          ff = Not Discovered
// $12A2EA: [8 BIT] Yellow Hawaiian Quantity
//          ff = Not Discovered
// $12A2EB: [8 BIT] Blue Hawaiian Quantity
//          ff = Not Discovered
// $12A2EC: [8 BIT] Red Hawaiian Quantity
//          ff = Not Discovered
// $12A2ED: [8 BIT] Brown Checkered Quantity
//          ff = Not Discovered
// $12A2EE: [8 BIT] Blue Checkered Quantity
//          ff = Not Discovered
// $12A2EF: [8 BIT] Green Checkered Quantity
//          ff = Not Discovered
// $12A2F0: [8 BIT] Blue Bolero Quantity
//          DEFAULT UNLOCKED
// $12A2F1: [8 BIT] Pink Bolero Quantity
//          ff = Not Discovered
// $12A2F2: [8 BIT] Green Bolero Quantity
//          ff = Not Discovered
// $12A2F3: [8 BIT] Black Frill Shirt Quantity
//          DEFAULT UNLOCKED
// $12A2F4: [8 BIT] White Frill Shirt Quantity
//          ff = Not Discovered
// $12A2F5: [8 BIT] Red Frill Shirt Quantity
//          ff = Not Discovered
// $12A2F6: [8 BIT] Yellow Top Quantity
//          DEFAULT UNLOCKED
// $12A2F7: [8 BIT] Pink Top Quantity
//          ff = Not Discovered
// $12A2F8: [8 BIT] Blue Top Quantity
//          ff = Not Discovered
// $12A2F9: [8 BIT] Black Cool Sweater Quantity
//          ff = Not Discovered
// $12A2FA: [8 BIT] Yellow Cool Sweater Quantity
//          ff = Not Discovered
// $12A2FB: [8 BIT] Blue Cool Sweater Quantity
//          ff = Not Discovered
// $12A2FC: [8 BIT] Blue Denim Jacket Quantity
//          ff = Not Discovered
// $12A2FD: [8 BIT] Black Denim Jacket Quantity
//          ff = Not Discovered
// $12A2FE: [8 BIT] Purple Camisole Quantity
//          ff = Not Discovered
// $12A2FF: [8 BIT] Red Camisole Quantity
//          ff = Not Discovered
// $12A300: [8 BIT] White T-Shirt Quantity
//          DEFAULT UNLOCKED
// $12A301: [8 BIT] Black T-Shirt Quantity
//          ff = Not Discovered
// $12A302: [8 BIT] Blue T-Shirt Quantity
//          ff = Not Discovered
// $12A303: [8 BIT] Red T-Shirt Quantity
//          ff = Not Discovered
// $12A304: [8 BIT] Orange Hoodie Quantity
//          DEFAULT UNLOCKED
// $12A305: [8 BIT] Pink Hoodie Quantity
//          ff = Not Discovered
// $12A306: [8 BIT] Blue Trainer Quantity
//          ff = Not Discovered
// $12A307: [8 BIT] Red "Trainter" Quantity
//          ff = Not Discovered
// $12A308: [8 BIT] Black Jersey Quantity
//          ff = Not Discovered
// $12A309: [8 BIT] Blue Jersey Quantity
//          ff = Not Discovered
// $12A30A: [8 BIT] Green Camoflage Quantity
//          ff = Not Discovered
// $12A30B: [8 BIT] Yellow Camoflage Quantity
//          ff = Not Discovered
// $12A30C: [8 BIT] Red Japan Print Quantity
//          ff = Not Discovered
// $12A30D: [8 BIT] Blue Japan Print Quantity
//          ff = Not Discovered
// $12A30E: [8 BIT] Yellow Japan Print Quantity
//          ff = Not Discovered
// $12A30F: [8 BIT] Blue Button Down Quantity
//          ff = Not Discovered
// $12A310: [8 BIT] Red Button Down Quantity
//          ff = Not Discovered
// $12A311: [8 BIT] Black Check Sweater Quantity
//          ff = Not Discovered
// $12A312: [8 BIT] White Check Sweater Quantity
//          ff = Not Discovered
// $12A313: [8 BIT] Shirt and Tie Quantity
//          ff = Not Discovered
// $12A314: [8 BIT] Sporty Hoodie Quantity
//          ff = Not Discovered
// $12A315: [8 BIT] Graduation Gown Quantity
//          ff = Not Discovered
// $12A316: [8 BIT] Pirate's Outfit Quantity
//          ff = Not Discovered
// $12A317: [8 BIT] Netted Shirt Quantity
//          ff = Not Discovered
// $12A318: [8 BIT] Printed T-Shirt Quantity
//          ff = Not Discovered
// $12A319: [8 BIT] Green Work Pants Quantity
//          DEFAULT UNLOCKED
// $12A31A: [8 BIT] Brown Work Pants Quantity
//          ff = Not Discovered
// $12A31B: [8 BIT] Brown Checkered Quantity
//          DEFAULT UNLOCKED
// $12A31C: [8 BIT] White Checkered Quantity
//          ff = Not Discovered
// $12A31D: [8 BIT] Black Capri Pants Quantity
//          DEFAULT UNLOCKED
// $12A31E: [8 BIT] Blue Capri Pants Quantity
//          ff = Not Discovered
// $12A31F: [8 BIT] Red Capri Pants Quantity
//          ff = Not Discovered
// $12A320: [8 BIT] Green Camoflage Quantity
//          ff = Not Discovered
// $12A321: [8 BIT] Yellow Camoflage Quantity
//          ff = Not Discovered
// $12A322: [8 BIT] Surfer Shorts Quantity
//          ff = Not Discovered
// $12A323: [8 BIT] Printed Pants Quantity
//          ff = Not Discovered
// $12A324: [8 BIT] Blue Shorts Quantity
//          ff = Not Discovered
// $12A325: [8 BIT] Green Shorts Quantity
//          ff = Not Discovered
// $12A326: [8 BIT] Black Pants and Belt Quantity
//          ff = Not Discovered
// $12A327: [8 BIT] Blue Pants and Belt Quantity
//          ff = Not Discovered
// $12A328: [8 BIT] Blue Check Skirt Quantity
//          DEFAULT UNLOCKED
// $12A329: [8 BIT] Purple Check Skirt Quantity
//          ff = Not Discovered
// $12A32A: [8 BIT] Black Pleated Skirt Quantity
//          DEFAULT UNLOCKED
// $12A32B: [8 BIT] White Pleated Skirt Quantity
//          ff = Not Discovered
// $12A32C: [8 BIT] Blue Jean Shorts Quantity
//          DEFAULT UNLOCKED
// $12A32D: [8 BIT] Black Jean Shorts Quantity
//          ff = Not Discovered
// $12A32E: [8 BIT] Black Long Skirt Quantity
//          ff = Not Discovered
// $12A32F: [8 BIT] Blue Long Skirt Quantity
//          ff = Not Discovered
// $12A330: [8 BIT] Purple Short Skirt Quantity
//          ff = Not Discovered
// $12A331: [8 BIT] Black Short Skirt Quantity
//          ff = Not Discovered
// $12A332: [8 BIT] Blue Hot Pants Quantity
//          ff = Not Discovered
// $12A333: [8 BIT] Pink Hot Pants Quantity
//          ff = Not Discovered
// $12A334: [8 BIT] Brown Check Shirt Quantity
//          ff = Not Discovered
// $12A335: [8 BIT] Green Check Shirt Quantity
//          ff = Not Discovered
// $12A336: [8 BIT] Frilly Skirt Quantity
//          ff = Not Discovered
// $12A337: [8 BIT] Bohemian Skirt Quantity
//          ff = Not Discovered
// $12A338: [8 BIT] Black Denim Jeans Quantity
//          DEFAULT UNLOCKED
// $12A339: [8 BIT] Blue Denim Jeans Quantity
//          ff = Not Discovered
// $12A33A: [8 BIT] White Denim Jeans Quantity
//          ff = Not Discovered
// $12A33B: [8 BIT] Black Jeans Quantity
//          DEFAULT UNLOCKED
// $12A33C: [8 BIT] Black Jersey Pants Quantity
//          ff = Not Discovered
// $12A33D: [8 BIT] Blue Jersey Pants Quantity
//          ff = Not Discovered
// $12A33E: [8 BIT] Brown Short Pants Quantity
//          ff = Not Discovered
// $12A33F: [8 BIT] Blue Short Pants Quantity
//          ff = Not Discovered
// $12A340: [8 BIT] Suspenders Quantity
//          ff = Not Discovered
// $12A341: [8 BIT] Blue Jean Quantity
//          DEFAULT UNLOCKED
// $12A342: [8 BIT] Black Suit Quantity
//          ff = Not Discovered
// $12A343: [8 BIT] White Suit Quantity
//          ff = Not Discovered
// $12A344: [8 BIT] School Outfit Quantity
//          ff = Not Discovered
// $12A345: [8 BIT] Brown Two Piece Quantity
//          DEFAULT UNLOCKED
// $12A346: [8 BIT] White Two Piece Quantity
//          ff = Not Discovered
// $12A347: [8 BIT] China Outfit Quantity
//          ff = Not Discovered
// $12A348: [8 BIT] Summer Kimono Quantity
//          ff = Not Discovered
// $12A349: [8 BIT] Baseball Uniform Quantity
//          ff = Not Discovered
// $12A34A: [8 BIT] Tuxedo Quantity
//          ff = Not Discovered
// $12A34B: [8 BIT] Bellhop Uniform Quantity
//          ff = Not Discovered
// $12A34C: [8 BIT] Brown Suit Quantity
//          ff = Not Discovered
// $12A34D: [8 BIT] Blue One-Piece Quantity
//          DEFAULT UNLOCKED
// $12A34E: [8 BIT] Green One-Piece Quantity
//          ff = Not Discovered
// $12A34F: [8 BIT] White One-Piece Quantity
//          ff = Not Discovered
// $12A350: [8 BIT] Red Dress Quantity
//          ff = Not Discovered
// $12A351: [8 BIT] Blue Dress Quantity
//          ff = Not Discovered
// $12A352: [8 BIT] Bee Stripe Quantity
//          ff = Not Discovered
// $12A353: [8 BIT] Black Long Dress Quantity
//          ff = Not Discovered
// $12A354: [8 BIT] Long Dress Quantity
//          ff = Not Discovered
// $12A355: [8 BIT] Fortune Teller Quantity
//          ff = Not Discovered
// $12A356: [8 BIT] Mayor's Suit Quantity
//          ff = Not Discovered
// $12A357: [8 BIT] Blue Overalls Quantity
//          DEFAULT UNLOCKED
// $12A358: [8 BIT] Red Overalls Quantity
//          ff = Not Discovered
// $12A359: [8 BIT] Green Overalls Quantity
//          ff = Not Discovered
// $12A35A: [8 BIT] Leather Suit Quantity
//          ff = Not Discovered
// $12A35B: [8 BIT] Soccer Uniform Quantity
//          ff = Not Discovered
// $12A35C: [8 BIT] Trainer Quantity
//          ff = Not Discovered
// $12A35D: [8 BIT] Jump Suit Quantity
//          ff = Not Discovered
// $12A35E: [8 BIT] Ninja Outfit Quantity
//          ff = Not Discovered
// $12A35F: [8 BIT] Blazer Quantity
//          ff = Not Discovered
// $12A360: [8 BIT] Nurse Uniform Quantity
//          ff = Not Discovered
// $12A361: [8 BIT] Black Sailor Suit Quantity
//          ff = Not Discovered
// $12A362: [8 BIT] Police Uniform Quantity
//          ff = Not Discovered
// $12A363: [8 BIT] Chef's Apron Quantity
//          ff = Not Discovered
// $12A364: [8 BIT] Black Round Glasses Quantity
//          DEFAULT UNLOCKED
// $12A365: [8 BIT] Blue Round Glasses Quantity
//          ff = Not Discovered
// $12A366: [8 BIT] Red Round Glasses Quantity
//          ff = Not Discovered
// $12A367: [8 BIT] Silver Round Glasses Quantity
//          ff = Not Discovered
// $12A368: [8 BIT] Black Square Glasses Quantity
//          DEFAULT UNLOCKED
// $12A369: [8 BIT] Blue Square Glasses Quantity
//          ff = Not Discovered
// $12A36A: [8 BIT] Red Square Glasses Quantity
//          ff = Not Discovered
// $12A36B: [8 BIT] Gold Square Glasses Quantity
//          ff = Not Discovered
// $12A36C: [8 BIT] Black Sunglasses Quantity
//          ff = Not Discovered
// $12A36D: [8 BIT] Green Sunglasses Quantity
//          ff = Not Discovered
// $12A36E: [8 BIT] Red Sunglasses Quantity
//          ff = Not Discovered
// $12A36F: [8 BIT] Thick Glasses Quantity
//          ff = Not Discovered
// $12A370: [8 BIT] Giant "Suglasses" Quantity
//          ff = Not Discovered
// $12A371: [8 BIT] Monocle Quantity
//          ff = Not Discovered
// $12A372: [8 BIT] Party Mask Quantity
//          ff = Not Discovered
// $12A373: [8 BIT] Joke Glasses Quantity
//          ff = Not Discovered
// $12A374: [8 BIT] Fake Moustache Quantity
//          ff = Not Discovered
// $12A375: [8 BIT] Fake Pig Nose Quantity
//          ff = Not Discovered
// $12A376: [8 BIT] Clown Nose Quantity
//          ff = Not Discovered
// $12A377: [8 BIT] Heart Earrings Quantity
//          ff = Not Discovered
// $12A378: [8 BIT] Star Earrings Quantity
//          ff = Not Discovered
// $12A379: [8 BIT] Cool Sunglasses Quantity
//          ff = Not Discovered
// $12A37A: [8 BIT] Crown Quantity
//          ff = Not Discovered
// $12A37B: [8 BIT] King Outfit Quantity
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
achievement(title = "Opening Festival Winner", description = "Win the Opening Festival. Let the minigames begin!", points = 1,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = bit0(0x12A3E0) == 1 && prev(bit0(0x12A3E0)) == 0 && 
            byte(0x12a24c) == 0xcf && prev(byte(0x12a24c)) != 0x00 //at the festival hall not loading in from menu
)

achievement(title = "Happy Festival Winner", description = "Win the Happy Festival. Are you happy now?", points = 2,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = bit1(0x12A3E0) == 1 && prev(bit1(0x12A3E0)) == 0 && 
            byte(0x12a24c) == 0xcf && prev(byte(0x12a24c)) != 0x00 //at the festival hall not loading in from menu
)

achievement(title = "Pretty Festival Winner", description = "Win the Pretty Festival. Looking good!", points = 2,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = bit2(0x12A3E0) == 1 && prev(bit2(0x12A3E0)) == 0 && 
            byte(0x12a24c) == 0xcf && prev(byte(0x12a24c)) != 0x00 //at the festival hall not loading in from menu
)

achievement(title = "Music Festival Winner", description = "Win the Music Festival. Give yourself to the rhythm!", points = 3,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = bit3(0x12A3E0) == 1 && prev(bit3(0x12A3E0)) == 0 && 
            byte(0x12a24c) == 0xcf && prev(byte(0x12a24c)) != 0x00 //at the festival hall not loading in from menu
)

achievement(title = "Bizarre Festival Winner", description = "Win the Bizarre Festival. Dr. F is pleased!", points = 3,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = bit4(0x12A3E0) == 1 && prev(bit4(0x12A3E0)) == 0 && 
            byte(0x12a24c) == 0xcf && prev(byte(0x12a24c)) != 0x00 //at the festival hall not loading in from menu
) 

achievement(title = "Delicious Festival Winner", description = "Win the Delicious Festival. Mmm, delicious points.", points = 4,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = bit5(0x12A3E0) == 1 && prev(bit5(0x12A3E0)) == 0 && 
            byte(0x12a24c) == 0xcf && prev(byte(0x12a24c)) != 0x00 //at the festival hall not loading in from menu
)

achievement(title = "Speed Festival Winner", description = "Win the Speed Festival. You should be fined for speeding!", points = 4,
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

achievement(title = "Customizing Festival Winner", description = "Win the Customizing Festival. Play your favorite games and get points! A win-win scenario!", points = 10,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = bit3(0x12A3E1) == 1 && prev(bit3(0x12A3E1)) == 0 && 
            byte(0x12a24c) == 0xcf && prev(byte(0x12a24c)) != 0x00 //at the festival hall, not loading in from menu
)

// $12A3F0: [8 BIT] Character Unlock Flags 1
//          Bit 0 = Rosalyn
//          Bit 1 = Elmira
//          Bit 2 = DJ Candy
//          Bit 3 = Goth Boy
//          Bit 4 = Watanabe
//          Bit 5 = Dr. F
//          Bit 6 = Gino
//          Bit 7 = Roxie
// $12A3F1: [8 BIT] Character Unlock Flags 2
//          Bit 0 = Buddy
//          Bit 1 = Vincent
//          Bit 2 = Nicole
//          Bit 3 = Odin
//          Bit 4 = Poppy
//          Bit 5 = Violet
//          Bit 6 = Ginny
//          Bit 7 = Vic
// $12A3F2: [8 BIT] Character Unlock Flags 3
//          Bit 0 = Travis
//          Bit 1 = Trevor
//          Bit 2 = Aran
//          Bit 3 = Dolly
//          Bit 4 = Zoe
//          Bit 5 = Shirley
//          Bit 6 = Chaz
//          Bit 7 = Tim
// $12A3F3: [8 BIT] Character Unlock Flags 4
//          Bit 0 = Helen
//          Bit 1 = Ewan
//          Bit 2 = Tyler
//          Bit 3 = Ashley
//          Bit 4 = Joseph
//          Bit 5 = Olivia
//          Bit 6 = Sophie
//          Bit 7 = Charlie
// $12A3F4: [8 BIT] Character Unlock Flags 5
//          Bit 0 = Marie
//          Bit 1 = Tracy
//          Bit 2 = Hawk
//          Bit 3 = Martin
//          Bit 4 = Nicki
//          Bit 5 = Elizabeth
//          Bit 6 = Emma
//          Bit 7 = Foster
// $12A3F5: [8 BIT] Character Unlock Flags 6
//          Bit 0 = King Roland
//          Bit 1 = MC Emi
//          Bit 2 = Mitch
// $12A433: [8 BIT] Minigame Unlock Flags (Festival Mode)
//          Bit 0 = Pass and Check
//          Bit 1 = Hush Hush Library Rush
//          Bit 2 = My Mix Masters
//          Bit 3 = Haunted Hunted
//          Bit 4 = Sushi Scramble
//          Bit 5 = Chemistry Calamity
//          Bit 6 = Spaghetti Spin-Off
//          Bit 7 = Soft Service
// $12A434: [8 BIT] Minigame Unlock Flags (Festival Mode) 2
//          Bit 0 = Vroom Service
//          Bit 1 = Skull Finder
//          Bit 2 = Clap Happy
//          Bit 3 = Air-Guitar Star
//          Bit 4 = Okay Bouquet
//          Bit 5 = Petal Platform Peril
//          Bit 6 = Keys to Success
//          Bit 7 = Mallet Melee
// $12A435: [8 BIT] Minigame Unlock Flags (Festival Mode) 3
//          Bit 0 = Signal Search
//          Bit 1 = Spotlight Please!
//          Bit 2 = Sim-Fu Showdown
//          Bit 3 = Fashion Mogul
//          Bit 4 = Crystal Clear
//          Bit 5 = Sudsy Salon
//          Bit 6 = Skating Scamper
//          Bit 7 = Soccer Bounce
// $12A436: [8 BIT] Minigame Unlock Flags (Festival Mode) 4
//          Bit 0 = Bus! Stop!
//          Bit 1 = Catch the Crook
//          Bit 2 = Clothing Cut-Out
//          Bit 3 = Pretty Pottery
//          Bit 4 = Gone Fishing
//          Bit 5 = Hidden Treasures
//          Bit 6 = Sleeping Sophie
//          Bit 7 = Pastry Puzzle
// $12A437: [8 BIT] Minigame Unlock Flags (Festival Mode) 5
//          Bit 0 = Hang Gliding Hurricane
//          Bit 1 = Fortune Finders
//          Bit 2 = Shuffle Cup
//          Bit 3 = Plane Pop
//          Bit 4 = Bumper Boat Battle
//          Bit 5 = Fashion Reaction
//          Bit 6 = Perfect Slot Jackpot
//          Bit 7 = Spotting Safari
// $12A50A: [8 BIT] Current Minigame Number During Festival
// $12A533: [8 BIT] Minigame Unlock (Minigame Mode) BitFlags
//          Bit 1 = Pass and Check
//          Bit 2 = Hush Hush Library Rush
//          Bit 3 = My Mix Masters
//          Bit 4 = Haunted Hunted
//          Bit 5 = Sushi Scramble
//          Bit 6 = Chemistry Calamity
//          Bit 7 = Spaghetti Spin-Off
// $12A534: [8 BIT] Minigame Unlock (Minigame Mode) BitFlags 2
//          Bit 0 = Soft Service
//          Bit 1 = Vroom Service
//          Bit 2 = Skull Finder
//          Bit 3 = Clap Happy
//          Bit 4 = Air-Guitar Star
//          Bit 5 = Okay Bouquet
//          Bit 6 = Petal Platform Peril
//          Bit 7 = Keys to Success
// $12A535: [8 BIT] Minigame Unlock (Minigame Mode) BitFlags 3
//          Bit 0 = Mallet Melee
//          Bit 1 = Signal Search
//          Bit 2 = Spotlight Please!
//          Bit 3 = Sim-Fu Showdown
//          Bit 4 = Fashion Mogul
//          Bit 5 = Crystal Clear
//          Bit 6 = Sudsy Salon
//          Bit 7 = Skating Scamper
// $12A536: [8 BIT] Minigame Unlock (Minigame Mode) BitFlags 4
//          Bit 0 = Soccer Bounce
//          Bit 1 = Bus! Stop!
//          Bit 2 = Catch the Crook
//          Bit 3 = Clothing Cut-Out
//          Bit 4 = Pretty Pottery
//          Bit 5 = Gone Fishing
//          Bit 6 = Hidden Treasures
//          Bit 7 = Sleeping Sophie
// $12A537: [8 BIT] Minigame Unlock (Minigame Mode) BitFlags 5
//          Bit 0 = Pastry Puzzle
//          Bit 1 = Hang Gliding Hurricane
//          Bit 2 = Fortune Finders
//          Bit 3 = Shuffle Cup
//          Bit 4 = Plane Pop
//          Bit 5 = Bumper Boat Battle
//          Bit 6 = Fashion Reaction
//          Bit 7 = Perfect Slot Jackpot
// $12A538: [4 BIT] Minigame Unlock (Minigame Mode) BitFlags 6
//          Bit 0 = Spotting Safari
// $12A56C: [8 BIT] P1 Name First Letter (1)
//          Letter Index:
//          [if in letter space, end of name] 0x00=
//          [Space IN NAME] 0x20=
//          0x21=!
//          0x22=""
//          0x23=_
//          0x24=$
//          0x25=％
//          0x26=&
//          0x27='
//          0x28=(
//          0x29=)
//          0x2A=*
//          0x2B=+
//          0x2C=,
//          0x2D=-
//          0x2E=.
//          0x2F=/
//          0x30=0
//          0x31=1
//          0x32=2
//          0x33=3
//          0x34=4
//          0x35=5
//          0x36=6
//          0x37=7
//          0x38=8
//          0x39=9
//          0x3A=:
//          0x3B=;
//          0x3C=<
//          0x3D==
//          0x3E=>
//          0x3F=?
//          0x40=@
//          0x41=A
//          0x42=B
//          0x43=C
//          0x44=D
//          0x45=E
//          0x46=F
//          0x47=G
//          0x48=H
//          0x49=I
//          0x4A=J
//          0x4B=K
//          0x4C=L
//          0x4D=M
//          0x4E=N
//          0x4F=O
//          0x50=P
//          0x51=Q
//          0x52=R
//          0x53=S
//          0x54=T
//          0x55=U
//          0x56=V
//          0x57=W
//          0x58=X
//          0x59=Y
//          0x5A=Z
//          0x5B=[
//          0x5C=\
//          0x5D=]
//          0x5E=^
//          0x5F=_
//          0x60=`
//          0x61=a
//          0x62=b
//          0x63=c
//          0x64=d
//          0x65=e
//          0x66=f
//          0x67=g
//          0x68=h
//          0x69=i
//          0x6A=j
//          0x6B=k
//          0x6C=l
//          0x6D=m
//          0x6E=n
//          0x6F=o
//          0x70=p
//          0x71=q
//          0x72=r
//          0x73=s
//          0x74=t
//          0x75=u
//          0x76=v
//          0x77=w
//          0x78=x
//          0x79=y
//          0x7A=z
//          0x7B={
//          0x7C=|
//          0x7D=}
//          0x7E=~
//          0xA0=
//          0xA1=¡
//          0xA2=¢
//          0xA3=£
//          0xA4=¤
//          0xA5=¥
//          0xA6=¦
//          0xA7=§
//          0xA8=¨
//          0xA9=©
//          0xAA=ª
//          0xAB=«
//          0xAC=¬
//          0xAD=­
//          0xAE=®
//          0xAF=¯
//          0xB0=°
//          0xB1=±
//          0xB2=²
//          0xB3=³
//          0xB4=´
//          0xB5=µ
//          0xB6=¶
//          0xB7=·
//          0xB8=¸
//          0xB9=¹
//          0xBA=º
//          0xBB=»
//          0xBC=¼
//          0xBD=½
//          0xBE=¾
//          0xBF=¿
//          0xC0=À
//          0xC1=Á
//          0xC2=Â
//          0xC3=Ã
//          0xC4=Ä
//          0xC5=Å
//          0xC6=Æ
//          0xC7=Ç
//          0xC8=È
//          0xC9=É
//          0xCA=Ê
//          0xCB=Ë
//          0xCC=Ì
//          0xCD=Í
//          0xCE=Î
//          0xCF=Ï
//          0xD0=Ð
//          0xD1=Ñ
//          0xD2=Ò
//          0xD3=Ó
//          0xD4=Ô
//          0xD5=Õ
//          0xD6=Ö
//          0xD7=×
//          0xD8=Ø
//          0xD9=Ù
//          0xDA=Ú
//          0xDB=Û
//          0xDC=Ü
//          0xDD=Ý
//          0xDE=Þ
//          0xDF=ß
//          0xE0=à
//          0xE1=á
//          0xE2=â
//          0xE3=ã
//          0xE4=ä
//          0xE5=å
//          0xE6=æ
//          0xE7=ç
//          0xE8=è
//          0xE9=é
//          0xEA=ê
//          0xEB=ë
//          0xEC=ì
//          0xED=í
//          0xEE=î
//          0xEF=ï
//          0xF0=ð
//          0xF1=ñ
//          0xF2=ò
//          0xF3=ó
//          0xF4=ô
//          0xF5=õ
//          0xF6=ö
//          0xF7=÷
//          0xF8=ø
//          0xF9=ù
//          0xFA=ú
//          0xFB=û
//          0xFC=ü
//          0xFD=ý
//          0xFE=þ
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
//          0x1 = Weak
//          0x3 = Normal
//          0x5 = Strong
//          0x7 = Powerful
// $12A9B8: [16 BIT] P2 Festival Score (max 9,999)
// $12A9E0: [4 BIT] P3 Difficulty
//          0x1 = Weak
//          0x3 = Normal
//          0x5 = Strong
//          0x7 = Powerful
// $12ABFC: [16 BIT] P3 Festival Score (max 9,999)
// $12AC24: [4 BIT] P4 Difficulty
//          0x9 = Weak
//          0xb = Normal
//          0xd = Strong
//          0xf = Powerful
// $12AE40: [16 BIT] P4 Festival Score (max 9,999)
// $12AF98: [32 BIT] Total Overall Score (from all festivals)
// $12E464: [16 BIT] Pass and Check Highscore Record
// $12E572: [16 BIT] Hush Hush Library Rush Highscore Record
// $12E680: [16 BIT] My Mix Masters Highscore Record
// $12E78E: [16 BIT] Haunted Hunted Highscore Record
// $12E89C: [16 BIT] Sushi Scramble Highscore Record
// $12E9AA: [16 BIT] Chemistry Calamity Highscore Record
// $12EAB8: [16 BIT] Spaghetti Spin-Off Highscore Record
// $12EBC6: [16 BIT] Soft Service Highscore Record
// $12ECD4: [16 BIT] Vroom Service Highscore Record
// $12FDB4: [16 BIT] Bus Stop Highscore Record 
// $145216: [8 BIT] P1 Active Balloon Size in Sleeping Sophie
// $14525E: [8 BIT] P2 Active Balloon Size in Sleeping Sophie
// $1452A6: [8 BIT] P3 Active Balloon Size in Sleeping Sophie
// $1452EE: [8 BIT] P4 Active Balloon Size in Sleeping Sophie



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
// $1470D2: [8 BIT] P1 Active Score in Shuffle Cup
// $1470EA: [8 BIT] P2 Active Score in Fortune Finders
// $147102: [8 BIT] P3 Active Score in Fortune Finders
// $14711A: [8 BIT] P4 Active Score in Fortune Finders
// $147202: [8 BIT] P1 Active Score in Sushi Scramble
// $147810: [8 BIT] P1 Active Score in Fashion Mogul
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

// $147F28: [8 BIT]  P1 Active Score in Gone Fishing


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
// $148218: [8 BIT] P1 Active Score in Plane Pop
// $14821C: [8 BIT] P2 Active Score in Plane Pop
// $148220: [8 BIT] P3 Active Score in Plane Pop
// $148224: [8 BIT] P4 Active Score in Plane Pop
// $148374: [8 BIT] P1 Active Percentage (GUI) in Sudsy Salon
//          0x28 = start/end
//          0xcc = max (start washing)
// $148378: [8 BIT] P2 Active Percentage (GUI) in Sudsy Salon
// $14837C: [8 BIT] P3 Active Percentage (GUI) in Sudsy Salon
// $148380: [8 BIT] P4 Active Percentage (GUI) in Sudsy Salon
// $148634: [8 BIT]  P1 Active Score in Okay Bouquet
// $148804: [8 BIT]  P1 Active Score Pass and Check
achievement(title = "Paper Pushin' Bureaucrat", description = "Score 100 points in 'Pass and Check'.", points = 5,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger = currentMinigameID() == Pass_and_Check && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf3) == 0x00 && //Game not paused
            byte(0x0ac797) == 0x0b && //Game Running
            trigger_when(byte(0x148804) >= 100)
)

// $14880C: Interaction Disabled?
// $14886C: [4 BIT] P1 Active Number of Stages Won in Fashion Reaction
// $14888C: [4 BIT] P2 Active Number of Stages Won in Fashion Reaction
// $1488AC: [4 BIT] P3 Active Number of Stages Won in Fashion Reaction
// $1488CC: [4 BIT] P4 Active Number of Stages Won in Fashion Reaction
// $148F78: [8 BIT] P1 Active Score in Fortune Finders
// $148F7C: [8 BIT] P2 Active Score in Fortune Finders
// $148F80: [8 BIT] P3 Active Score in Fortune Finders
// $148F84: [8 BIT] P4 Active Score in Fortune Finders


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
// $149B08: [8 BIT] P1 Active Score in Petal Platform Peril
// $149BF0: [8 BIT] Timer for Yelling at P1 in Skull Finder
achievement(title = "Fossil Fighter", description = "Win 'Skull Finder' without making any mistakes.", points = 5,
            id = 0, badge = "00000", published = "15/6/2022", modified = "15/6/2022",
            trigger = currentMinigameID() == Skull_Finder && //Minigame Selected
            byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && //Game not paused
            byte(0x0ac797) == 0x3c  //Game Running
            
)

// $149CBC: [4 BIT] P1 Active Score ( / 5 ) in Hidden Treasures
// $14A09A: [8 BIT] P1 Active Score in Catch the Crook
// $14A1D8: [8 BIT] P1 Active Score in Pretty Pottery
// $14A750: [8 BIT] P1 Active Score in Pastry Puzzle
// $14A754: [8 BIT] P2 Active Score in Pastry Puzzle
// $14A758: [8 BIT] P3 Active Score in Pastry Puzzle
// $14A75C: [8 BIT] P4 Active Score in Pastry Puzzle
// $14A968: [8 BIT] P1 Active Score in Perfect Slot Jackpot
// $14A96C: [8 BIT] P2 Active Score in Perfect Slot Jackpot
// $14A970: [8 BIT] P3 Active Score in Perfect Slot Jackpot
// $14A974: [8 BIT] P4 Active Score in Perfect Slot Jackpot


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
// $14C0C4: [8 BIT] P1 Active Score in Sim-Fu Showdown

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
// $154268: [8 BIT] Collected Sims in Sim Notebook (ONLY IN SIM NOTEBOOK - Number you can scroll)
// $15426C: [4 BIT] Highlight position in Sim Notebook (0-4)
// $163F60: [8 BIT] P1 Active Percentage in Skull Finder








// $282ffe: [8 BIT] Soccer Ball Horizontal Position
// $283006: [8 BIT] Soccer Ball Vertical Position
achievement(title = "GOOOOOOAL!!!", description = "Kick the soccer ball into the net in the Downtown Area.", points = 1,
            id = 0, badge = "00000", published = "8/6/2022", modified = "8/6/2022",
            trigger =  byte(0x12a24c) == 0x01 && byte(0x12a24e) == 0x01 && //In the downtown area
            ( (byte(0x282ffe) == 0xfd && (byte(0x283006) == 0x0b || byte(0x283006) == 0x0c)) || //Left goal flags
              (byte(0x282ffe) == 0x07 && (byte(0x283006) == 0x0b || byte(0x283006) == 0x0c)) //Right goal flags
            )
)


// $12A3F0: [8 BIT] Character Unlock Flags 1
//          Bit 0 = Rosalyn
//          Bit 1 = Elmira
//          Bit 2 = DJ Candy
//          Bit 3 = Goth Boy
//          Bit 4 = Watanabe
//          Bit 5 = Dr. F
//          Bit 6 = Gino
//          Bit 7 = Roxie
// $12A3F1: [8 BIT] Character Unlock Flags 2
//          Bit 0 = Buddy
//          Bit 1 = Vincent
//          Bit 2 = Nicole
//          Bit 3 = Odin
//          Bit 4 = Poppy
//          Bit 5 = Violet
//          Bit 6 = Ginny
//          Bit 7 = Vic
// $12A3F2: [8 BIT] Character Unlock Flags 3
//          Bit 0 = Travis
//          Bit 1 = Trevor
//          Bit 2 = Aran
//          Bit 3 = Dolly
//          Bit 4 = Zoe
//          Bit 5 = Shirley
//          Bit 6 = Chaz
//          Bit 7 = Tim
// $12A3F3: [8 BIT] Character Unlock Flags 4
//          Bit 0 = Helen
//          Bit 1 = Ewan
//          Bit 2 = Tyler
//          Bit 3 = Ashley
//          Bit 4 = Joseph
//          Bit 5 = Olivia
//          Bit 6 = Sophie
//          Bit 7 = Charlie
// $12A3F4: [8 BIT] Character Unlock Flags 5
//          Bit 0 = Marie
//          Bit 1 = Tracy
//          Bit 2 = Hawk
//          Bit 3 = Martin
//          Bit 4 = Nicki
//          Bit 5 = Elizabeth
//          Bit 6 = Emma
//          Bit 7 = Foster
// $12A3F5: [8 BIT] Character Unlock Flags 6
//          Bit 0 = King Roland
//          Bit 1 = MC Emi
//          Bit 2 = Mitch


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

function minigameTimeLeaderboardLT()
{
   leaderboard(name, "Get the High Score in " + name + ".",
        start = currentMinigameID() == minigame_id && isMinigameStarted(),
        cancel = byte(0x0a0095) == 0x1e && byte(0x097cf1) == 0x00 && byte(0x09c050) == 0x01, //Check that (1) Pause Menu Opened (2) Minigame is Paused (3) Player Quit Game
        submit = byte(0x0a0095) != 0x1e && byte(0x097cf1) == 0x01 && byte(0x0ac48e) == 0x00, //Check that (1) Pause Menu NOT opened (2) Minigame is Not Paused (3) Minigame finished (4) Check that time submission is > 0
        value = 60,
        format = "FRAMES"
   )
}


//Time-Based Game Leaderboards
    //GT Leaderboards
    minigameTimeLeaderboardGT(0, "Bus! Stop!", Bus_Stop)
    minigameTimeLeaderboardGT(0, "Spotlight Please!", Spotlight_Please)
    
    //LT Leaderboards Consider adding a frame check to add timers to other games without 'timers'
    

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


