(define (problem depotprob4534) (:domain Depot)
(:objects
	depot0 depot1 depot2 - Depot
	distributor0 distributor1 distributor2 - Distributor
	truck0 truck1 truck2 truck3 truck4 truck5 truck6 truck7 - Truck
	pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 pallet8 pallet9 - Pallet
	crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14 crate15 crate16 crate17 crate18 crate19 crate20 crate21 crate22 crate23 crate24 crate25 crate26 crate27 crate28 crate29 crate30 crate31 crate32 crate33 crate34 crate35 crate36 crate37 crate38 crate39 crate40 crate41 crate42 crate43 crate44 crate45 crate46 crate47 crate48 crate49 crate50 crate51 crate52 crate53 crate54 crate55 crate56 crate57 crate58 crate59 crate60 crate61 crate62 crate63 crate64 crate65 crate66 crate67 crate68 crate69 crate70 crate71 crate72 crate73 crate74 crate75 crate76 crate77 crate78 crate79 crate80 crate81 crate82 crate83 crate84 crate85 crate86 crate87 crate88 crate89 crate90 crate91 crate92 crate93 crate94 crate95 crate96 crate97 crate98 crate99 - Crate
	hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 hoist6 hoist7 hoist8 hoist9 hoist10 hoist11 - Hoist)
(:init
	(at pallet0 depot0)
	(clear crate63)
	(at pallet1 depot1)
	(clear crate95)
	(at pallet2 depot2)
	(clear crate99)
	(at pallet3 distributor0)
	(clear crate96)
	(at pallet4 distributor1)
	(clear crate97)
	(at pallet5 distributor2)
	(clear crate98)
	(at pallet6 distributor0)
	(clear crate90)
	(at pallet7 distributor2)
	(clear crate83)
	(at pallet8 depot0)
	(clear crate89)
	(at pallet9 distributor2)
	(clear crate91)
	(at truck0 distributor1)
	(= (speed truck0) 9)
	(at truck1 distributor2)
	(= (speed truck1) 8)
	(at truck2 depot2)
	(= (speed truck2) 10)
	(at truck3 depot2)
	(= (speed truck3) 5)
	(at truck4 depot0)
	(= (speed truck4) 4)
	(at truck5 depot1)
	(= (speed truck5) 2)
	(at truck6 depot0)
	(= (speed truck6) 2)
	(at truck7 depot1)
	(= (speed truck7) 1)
	(at hoist0 depot0)
	(available hoist0)
	(= (power hoist0) 6)
	(at hoist1 depot1)
	(available hoist1)
	(= (power hoist1) 7)
	(at hoist2 depot2)
	(available hoist2)
	(= (power hoist2) 6)
	(at hoist3 distributor0)
	(available hoist3)
	(= (power hoist3) 5)
	(at hoist4 distributor1)
	(available hoist4)
	(= (power hoist4) 9)
	(at hoist5 distributor2)
	(available hoist5)
	(= (power hoist5) 9)
	(at hoist6 distributor0)
	(available hoist6)
	(= (power hoist6) 7)
	(at hoist7 distributor1)
	(available hoist7)
	(= (power hoist7) 6)
	(at hoist8 depot0)
	(available hoist8)
	(= (power hoist8) 2)
	(at hoist9 depot0)
	(available hoist9)
	(= (power hoist9) 2)
	(at hoist10 distributor1)
	(available hoist10)
	(= (power hoist10) 4)
	(at hoist11 depot2)
	(available hoist11)
	(= (power hoist11) 8)
	(at crate0 distributor2)
	(on crate0 pallet7)
	(= (weight crate0) 1)
	(at crate1 distributor1)
	(on crate1 pallet4)
	(= (weight crate1) 1)
	(at crate2 depot0)
	(on crate2 pallet0)
	(= (weight crate2) 1)
	(at crate3 distributor1)
	(on crate3 crate1)
	(= (weight crate3) 1)
	(at crate4 depot0)
	(on crate4 pallet8)
	(= (weight crate4) 1)
	(at crate5 distributor0)
	(on crate5 pallet6)
	(= (weight crate5) 1)
	(at crate6 depot1)
	(on crate6 pallet1)
	(= (weight crate6) 1)
	(at crate7 distributor1)
	(on crate7 crate3)
	(= (weight crate7) 1)
	(at crate8 distributor2)
	(on crate8 pallet5)
	(= (weight crate8) 1)
	(at crate9 distributor2)
	(on crate9 crate0)
	(= (weight crate9) 1)
	(at crate10 depot2)
	(on crate10 pallet2)
	(= (weight crate10) 1)
	(at crate11 depot0)
	(on crate11 crate2)
	(= (weight crate11) 1)
	(at crate12 depot0)
	(on crate12 crate4)
	(= (weight crate12) 1)
	(at crate13 distributor1)
	(on crate13 crate7)
	(= (weight crate13) 1)
	(at crate14 distributor2)
	(on crate14 crate8)
	(= (weight crate14) 1)
	(at crate15 depot2)
	(on crate15 crate10)
	(= (weight crate15) 1)
	(at crate16 distributor2)
	(on crate16 pallet9)
	(= (weight crate16) 1)
	(at crate17 distributor1)
	(on crate17 crate13)
	(= (weight crate17) 1)
	(at crate18 distributor2)
	(on crate18 crate16)
	(= (weight crate18) 1)
	(at crate19 depot0)
	(on crate19 crate12)
	(= (weight crate19) 1)
	(at crate20 depot0)
	(on crate20 crate11)
	(= (weight crate20) 1)
	(at crate21 depot2)
	(on crate21 crate15)
	(= (weight crate21) 1)
	(at crate22 depot2)
	(on crate22 crate21)
	(= (weight crate22) 1)
	(at crate23 distributor0)
	(on crate23 crate5)
	(= (weight crate23) 1)
	(at crate24 distributor1)
	(on crate24 crate17)
	(= (weight crate24) 1)
	(at crate25 depot0)
	(on crate25 crate20)
	(= (weight crate25) 1)
	(at crate26 distributor2)
	(on crate26 crate14)
	(= (weight crate26) 1)
	(at crate27 distributor1)
	(on crate27 crate24)
	(= (weight crate27) 1)
	(at crate28 distributor2)
	(on crate28 crate26)
	(= (weight crate28) 1)
	(at crate29 depot0)
	(on crate29 crate25)
	(= (weight crate29) 1)
	(at crate30 depot2)
	(on crate30 crate22)
	(= (weight crate30) 1)
	(at crate31 distributor1)
	(on crate31 crate27)
	(= (weight crate31) 1)
	(at crate32 distributor2)
	(on crate32 crate18)
	(= (weight crate32) 1)
	(at crate33 depot0)
	(on crate33 crate29)
	(= (weight crate33) 1)
	(at crate34 depot0)
	(on crate34 crate19)
	(= (weight crate34) 1)
	(at crate35 distributor2)
	(on crate35 crate9)
	(= (weight crate35) 1)
	(at crate36 distributor0)
	(on crate36 pallet3)
	(= (weight crate36) 1)
	(at crate37 depot2)
	(on crate37 crate30)
	(= (weight crate37) 1)
	(at crate38 distributor0)
	(on crate38 crate23)
	(= (weight crate38) 1)
	(at crate39 distributor0)
	(on crate39 crate36)
	(= (weight crate39) 1)
	(at crate40 depot2)
	(on crate40 crate37)
	(= (weight crate40) 1)
	(at crate41 distributor2)
	(on crate41 crate35)
	(= (weight crate41) 1)
	(at crate42 distributor1)
	(on crate42 crate31)
	(= (weight crate42) 1)
	(at crate43 depot1)
	(on crate43 crate6)
	(= (weight crate43) 1)
	(at crate44 distributor2)
	(on crate44 crate32)
	(= (weight crate44) 1)
	(at crate45 depot1)
	(on crate45 crate43)
	(= (weight crate45) 1)
	(at crate46 distributor2)
	(on crate46 crate28)
	(= (weight crate46) 1)
	(at crate47 distributor0)
	(on crate47 crate39)
	(= (weight crate47) 1)
	(at crate48 distributor0)
	(on crate48 crate38)
	(= (weight crate48) 1)
	(at crate49 distributor1)
	(on crate49 crate42)
	(= (weight crate49) 1)
	(at crate50 depot2)
	(on crate50 crate40)
	(= (weight crate50) 1)
	(at crate51 distributor1)
	(on crate51 crate49)
	(= (weight crate51) 1)
	(at crate52 depot2)
	(on crate52 crate50)
	(= (weight crate52) 1)
	(at crate53 depot1)
	(on crate53 crate45)
	(= (weight crate53) 1)
	(at crate54 distributor2)
	(on crate54 crate46)
	(= (weight crate54) 1)
	(at crate55 depot0)
	(on crate55 crate33)
	(= (weight crate55) 1)
	(at crate56 distributor2)
	(on crate56 crate41)
	(= (weight crate56) 1)
	(at crate57 distributor0)
	(on crate57 crate48)
	(= (weight crate57) 1)
	(at crate58 distributor2)
	(on crate58 crate44)
	(= (weight crate58) 1)
	(at crate59 depot2)
	(on crate59 crate52)
	(= (weight crate59) 1)
	(at crate60 depot0)
	(on crate60 crate55)
	(= (weight crate60) 1)
	(at crate61 depot1)
	(on crate61 crate53)
	(= (weight crate61) 1)
	(at crate62 depot0)
	(on crate62 crate60)
	(= (weight crate62) 1)
	(at crate63 depot0)
	(on crate63 crate62)
	(= (weight crate63) 1)
	(at crate64 distributor2)
	(on crate64 crate56)
	(= (weight crate64) 1)
	(at crate65 depot1)
	(on crate65 crate61)
	(= (weight crate65) 1)
	(at crate66 distributor0)
	(on crate66 crate57)
	(= (weight crate66) 1)
	(at crate67 distributor2)
	(on crate67 crate54)
	(= (weight crate67) 1)
	(at crate68 distributor0)
	(on crate68 crate47)
	(= (weight crate68) 1)
	(at crate69 depot0)
	(on crate69 crate34)
	(= (weight crate69) 1)
	(at crate70 depot1)
	(on crate70 crate65)
	(= (weight crate70) 1)
	(at crate71 distributor2)
	(on crate71 crate64)
	(= (weight crate71) 1)
	(at crate72 distributor2)
	(on crate72 crate71)
	(= (weight crate72) 1)
	(at crate73 depot1)
	(on crate73 crate70)
	(= (weight crate73) 1)
	(at crate74 depot1)
	(on crate74 crate73)
	(= (weight crate74) 1)
	(at crate75 distributor2)
	(on crate75 crate67)
	(= (weight crate75) 1)
	(at crate76 distributor2)
	(on crate76 crate72)
	(= (weight crate76) 1)
	(at crate77 distributor2)
	(on crate77 crate76)
	(= (weight crate77) 1)
	(at crate78 depot1)
	(on crate78 crate74)
	(= (weight crate78) 1)
	(at crate79 distributor1)
	(on crate79 crate51)
	(= (weight crate79) 1)
	(at crate80 depot1)
	(on crate80 crate78)
	(= (weight crate80) 1)
	(at crate81 depot0)
	(on crate81 crate69)
	(= (weight crate81) 1)
	(at crate82 depot2)
	(on crate82 crate59)
	(= (weight crate82) 1)
	(at crate83 distributor2)
	(on crate83 crate77)
	(= (weight crate83) 1)
	(at crate84 depot1)
	(on crate84 crate80)
	(= (weight crate84) 1)
	(at crate85 distributor2)
	(on crate85 crate75)
	(= (weight crate85) 1)
	(at crate86 distributor2)
	(on crate86 crate85)
	(= (weight crate86) 1)
	(at crate87 depot2)
	(on crate87 crate82)
	(= (weight crate87) 1)
	(at crate88 distributor2)
	(on crate88 crate86)
	(= (weight crate88) 1)
	(at crate89 depot0)
	(on crate89 crate81)
	(= (weight crate89) 1)
	(at crate90 distributor0)
	(on crate90 crate66)
	(= (weight crate90) 1)
	(at crate91 distributor2)
	(on crate91 crate58)
	(= (weight crate91) 1)
	(at crate92 depot1)
	(on crate92 crate84)
	(= (weight crate92) 1)
	(at crate93 depot1)
	(on crate93 crate92)
	(= (weight crate93) 1)
	(at crate94 distributor0)
	(on crate94 crate68)
	(= (weight crate94) 1)
	(at crate95 depot1)
	(on crate95 crate93)
	(= (weight crate95) 1)
	(at crate96 distributor0)
	(on crate96 crate94)
	(= (weight crate96) 1)
	(at crate97 distributor1)
	(on crate97 crate79)
	(= (weight crate97) 1)
	(at crate98 distributor2)
	(on crate98 crate88)
	(= (weight crate98) 1)
	(at crate99 depot2)
	(on crate99 crate87)
	(= (weight crate99) 1)
	(= (distance depot0 depot0) 0)
	(= (distance depot0 depot1) 4)
	(= (distance depot0 depot2) 2)
	(= (distance depot0 distributor0) 9)
	(= (distance depot0 distributor1) 9)
	(= (distance depot0 distributor2) 7)
	(= (distance depot1 depot0) 9)
	(= (distance depot1 depot1) 0)
	(= (distance depot1 depot2) 1)
	(= (distance depot1 distributor0) 4)
	(= (distance depot1 distributor1) 9)
	(= (distance depot1 distributor2) 6)
	(= (distance depot2 depot0) 6)
	(= (distance depot2 depot1) 3)
	(= (distance depot2 depot2) 0)
	(= (distance depot2 distributor0) 5)
	(= (distance depot2 distributor1) 5)
	(= (distance depot2 distributor2) 8)
	(= (distance distributor0 depot0) 3)
	(= (distance distributor0 depot1) 10)
	(= (distance distributor0 depot2) 2)
	(= (distance distributor0 distributor0) 0)
	(= (distance distributor0 distributor1) 8)
	(= (distance distributor0 distributor2) 8)
	(= (distance distributor1 depot0) 1)
	(= (distance distributor1 depot1) 10)
	(= (distance distributor1 depot2) 2)
	(= (distance distributor1 distributor0) 7)
	(= (distance distributor1 distributor1) 0)
	(= (distance distributor1 distributor2) 1)
	(= (distance distributor2 depot0) 10)
	(= (distance distributor2 depot1) 4)
	(= (distance distributor2 depot2) 5)
	(= (distance distributor2 distributor0) 1)
	(= (distance distributor2 distributor1) 2)
	(= (distance distributor2 distributor2) 0)
)

(:goal (and
		(on crate0 crate21)
		(on crate1 crate6)
		(on crate2 crate40)
		(on crate3 crate32)
		(on crate4 crate27)
		(on crate5 crate73)
		(on crate6 crate14)
		(on crate7 crate64)
		(on crate8 crate62)
		(on crate11 crate81)
		(on crate12 crate11)
		(on crate13 crate68)
		(on crate14 crate71)
		(on crate15 crate77)
		(on crate16 crate47)
		(on crate18 crate19)
		(on crate19 crate56)
		(on crate20 pallet9)
		(on crate21 crate59)
		(on crate22 crate87)
		(on crate23 pallet5)
		(on crate24 crate72)
		(on crate26 crate29)
		(on crate27 crate84)
		(on crate28 crate53)
		(on crate29 crate28)
		(on crate31 crate5)
		(on crate32 crate89)
		(on crate33 crate24)
		(on crate34 crate78)
		(on crate35 crate70)
		(on crate36 crate92)
		(on crate37 crate50)
		(on crate38 crate42)
		(on crate39 crate99)
		(on crate40 crate31)
		(on crate41 pallet2)
		(on crate42 pallet6)
		(on crate43 crate8)
		(on crate44 crate18)
		(on crate45 crate34)
		(on crate46 pallet3)
		(on crate47 crate22)
		(on crate48 crate2)
		(on crate49 crate44)
		(on crate50 crate35)
		(on crate51 crate95)
		(on crate53 crate60)
		(on crate54 crate75)
		(on crate55 crate45)
		(on crate56 crate1)
		(on crate58 crate46)
		(on crate59 crate23)
		(on crate60 crate0)
		(on crate61 crate20)
		(on crate62 crate65)
		(on crate63 crate67)
		(on crate64 crate33)
		(on crate65 crate76)
		(on crate67 crate51)
		(on crate68 crate98)
		(on crate69 crate54)
		(on crate70 crate7)
		(on crate71 pallet8)
		(on crate72 pallet1)
		(on crate73 crate61)
		(on crate75 pallet4)
		(on crate76 pallet7)
		(on crate77 crate80)
		(on crate78 pallet0)
		(on crate79 crate69)
		(on crate80 crate93)
		(on crate81 crate97)
		(on crate82 crate91)
		(on crate83 crate55)
		(on crate84 crate79)
		(on crate85 crate43)
		(on crate86 crate88)
		(on crate87 crate38)
		(on crate88 crate13)
		(on crate89 crate94)
		(on crate90 crate48)
		(on crate91 crate58)
		(on crate92 crate16)
		(on crate93 crate26)
		(on crate94 crate63)
		(on crate95 crate85)
		(on crate96 crate36)
		(on crate97 crate4)
		(on crate98 crate41)
		(on crate99 crate37)
	)
)

(:metric minimize (total-time)))
