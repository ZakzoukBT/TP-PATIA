


(define (problem turnandopen-4-12-42)
(:domain turnandopen-strips)
(:objects robot1 robot2 robot3 robot4 - robot
rgripper1 lgripper1 rgripper2 lgripper2 rgripper3 lgripper3 rgripper4 lgripper4 - gripper
room1 room2 room3 room4 room5 room6 room7 room8 room9 room10 room11 room12 - room
door1 door2 door3 door4 door5 door6 door7 door8 door9 door10 door11 - door
ball1 ball2 ball3 ball4 ball5 ball6 ball7 ball8 ball9 ball10 ball11 ball12 ball13 ball14 ball15 ball16 ball17 ball18 ball19 ball20 ball21 ball22 ball23 ball24 ball25 ball26 ball27 ball28 ball29 ball30 ball31 ball32 ball33 ball34 ball35 ball36 ball37 ball38 ball39 ball40 ball41 ball42 - object)
(:init
(closed door1)
(closed door2)
(closed door3)
(closed door4)
(closed door5)
(closed door6)
(closed door7)
(closed door8)
(closed door9)
(closed door10)
(closed door11)
(connected room1 room2 door1)
(connected room2 room1 door1)
(connected room2 room3 door2)
(connected room3 room2 door2)
(connected room3 room4 door3)
(connected room4 room3 door3)
(connected room4 room5 door4)
(connected room5 room4 door4)
(connected room5 room6 door5)
(connected room6 room5 door5)
(connected room6 room7 door6)
(connected room7 room6 door6)
(connected room7 room8 door7)
(connected room8 room7 door7)
(connected room8 room9 door8)
(connected room9 room8 door8)
(connected room9 room10 door9)
(connected room10 room9 door9)
(connected room10 room11 door10)
(connected room11 room10 door10)
(connected room11 room12 door11)
(connected room12 room11 door11)
(at-robby robot1 room6)
(free robot1 rgripper1)
(free robot1 lgripper1)
(at-robby robot2 room1)
(free robot2 rgripper2)
(free robot2 lgripper2)
(at-robby robot3 room10)
(free robot3 rgripper3)
(free robot3 lgripper3)
(at-robby robot4 room4)
(free robot4 rgripper4)
(free robot4 lgripper4)
(at ball1 room10)
(at ball2 room1)
(at ball3 room2)
(at ball4 room6)
(at ball5 room7)
(at ball6 room12)
(at ball7 room6)
(at ball8 room10)
(at ball9 room2)
(at ball10 room9)
(at ball11 room2)
(at ball12 room6)
(at ball13 room9)
(at ball14 room12)
(at ball15 room8)
(at ball16 room10)
(at ball17 room3)
(at ball18 room10)
(at ball19 room8)
(at ball20 room7)
(at ball21 room2)
(at ball22 room11)
(at ball23 room1)
(at ball24 room2)
(at ball25 room12)
(at ball26 room4)
(at ball27 room5)
(at ball28 room6)
(at ball29 room4)
(at ball30 room2)
(at ball31 room9)
(at ball32 room2)
(at ball33 room2)
(at ball34 room11)
(at ball35 room7)
(at ball36 room9)
(at ball37 room11)
(at ball38 room12)
(at ball39 room6)
(at ball40 room12)
(at ball41 room9)
(at ball42 room8)
)
(:goal
(and
(at ball1 room5)
(at ball2 room6)
(at ball3 room8)
(at ball4 room1)
(at ball5 room3)
(at ball6 room11)
(at ball7 room10)
(at ball8 room10)
(at ball9 room5)
(at ball10 room11)
(at ball11 room9)
(at ball12 room5)
(at ball13 room1)
(at ball14 room9)
(at ball15 room8)
(at ball16 room5)
(at ball17 room2)
(at ball18 room12)
(at ball19 room6)
(at ball20 room11)
(at ball21 room2)
(at ball22 room8)
(at ball23 room9)
(at ball24 room8)
(at ball25 room5)
(at ball26 room7)
(at ball27 room8)
(at ball28 room11)
(at ball29 room7)
(at ball30 room4)
(at ball31 room6)
(at ball32 room11)
(at ball33 room9)
(at ball34 room2)
(at ball35 room11)
(at ball36 room11)
(at ball37 room12)
(at ball38 room9)
(at ball39 room9)
(at ball40 room5)
(at ball41 room8)
(at ball42 room6)
)
)
(:metric minimize (total-time))

)


