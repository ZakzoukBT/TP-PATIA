(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	instrument4 - instrument
	instrument5 - instrument
	satellite2 - satellite
	instrument6 - instrument
	satellite3 - satellite
	instrument7 - instrument
	satellite4 - satellite
	instrument8 - instrument
	instrument9 - instrument
	satellite5 - satellite
	instrument10 - instrument
	instrument11 - instrument
	satellite6 - satellite
	instrument12 - instrument
	instrument13 - instrument
	satellite7 - satellite
	instrument14 - instrument
	instrument15 - instrument
	satellite8 - satellite
	instrument16 - instrument
	instrument17 - instrument
	satellite9 - satellite
	instrument18 - instrument
	instrument19 - instrument
	instrument20 - instrument
	satellite10 - satellite
	instrument21 - instrument
	satellite11 - satellite
	instrument22 - instrument
	satellite12 - satellite
	instrument23 - instrument
	instrument24 - instrument
	satellite13 - satellite
	instrument25 - instrument
	instrument26 - instrument
	satellite14 - satellite
	instrument27 - instrument
	instrument28 - instrument
	instrument29 - instrument
	infrared3 - mode
	infrared1 - mode
	infrared0 - mode
	spectrograph4 - mode
	thermograph2 - mode
	Star4 - direction
	Star0 - direction
	Star2 - direction
	GroundStation1 - direction
	Star3 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Planet8 - direction
	Star9 - direction
	Planet10 - direction
	Planet11 - direction
	Star12 - direction
	Phenomenon13 - direction
	Star14 - direction
	Star15 - direction
	Planet16 - direction
	Phenomenon17 - direction
	Star18 - direction
	Star19 - direction
	Planet20 - direction
	Phenomenon21 - direction
	Star22 - direction
	Star23 - direction
	Phenomenon24 - direction
	Star25 - direction
	Star26 - direction
	Star27 - direction
	Phenomenon28 - direction
	Star29 - direction
	Planet30 - direction
	Planet31 - direction
	Planet32 - direction
	Star33 - direction
	Star34 - direction
	Star35 - direction
	Star36 - direction
	Phenomenon37 - direction
	Phenomenon38 - direction
	Planet39 - direction
	Planet40 - direction
	Star41 - direction
	Planet42 - direction
	Phenomenon43 - direction
	Phenomenon44 - direction
	Phenomenon45 - direction
	Phenomenon46 - direction
	Planet47 - direction
	Phenomenon48 - direction
	Planet49 - direction
	Phenomenon50 - direction
	Star51 - direction
	Star52 - direction
	Planet53 - direction
	Phenomenon54 - direction
	Star55 - direction
	Phenomenon56 - direction
	Phenomenon57 - direction
	Planet58 - direction
	Planet59 - direction
	Planet60 - direction
	Phenomenon61 - direction
	Planet62 - direction
	Star63 - direction
	Star64 - direction
	Planet65 - direction
	Phenomenon66 - direction
	Star67 - direction
	Star68 - direction
	Star69 - direction
	Star70 - direction
	Star71 - direction
	Planet72 - direction
	Phenomenon73 - direction
	Planet74 - direction
	Star75 - direction
	Star76 - direction
	Planet77 - direction
	Star78 - direction
	Phenomenon79 - direction
	Star80 - direction
	Star81 - direction
	Star82 - direction
	Star83 - direction
	Planet84 - direction
	Star85 - direction
	Planet86 - direction
	Star87 - direction
	Phenomenon88 - direction
	Star89 - direction
	Phenomenon90 - direction
	Planet91 - direction
	Phenomenon92 - direction
	Planet93 - direction
	Phenomenon94 - direction
	Star95 - direction
	Star96 - direction
	Planet97 - direction
	Phenomenon98 - direction
	Phenomenon99 - direction
	Phenomenon100 - direction
	Star101 - direction
	Phenomenon102 - direction
	Planet103 - direction
	Phenomenon104 - direction
	Phenomenon105 - direction
	Phenomenon106 - direction
	Star107 - direction
	Phenomenon108 - direction
	Planet109 - direction
	Star110 - direction
	Phenomenon111 - direction
	Star112 - direction
	Star113 - direction
	Phenomenon114 - direction
	Phenomenon115 - direction
	Star116 - direction
	Star117 - direction
	Star118 - direction
	Phenomenon119 - direction
	Planet120 - direction
	Phenomenon121 - direction
	Phenomenon122 - direction
	Phenomenon123 - direction
	Star124 - direction
	Phenomenon125 - direction
	Phenomenon126 - direction
	Phenomenon127 - direction
	Planet128 - direction
	Planet129 - direction
	Planet130 - direction
	Phenomenon131 - direction
	Planet132 - direction
	Planet133 - direction
	Planet134 - direction
	Planet135 - direction
	Planet136 - direction
	Star137 - direction
	Star138 - direction
	Star139 - direction
	Planet140 - direction
	Planet141 - direction
	Star142 - direction
	Phenomenon143 - direction
	Phenomenon144 - direction
	Planet145 - direction
	Planet146 - direction
	Planet147 - direction
	Phenomenon148 - direction
	Star149 - direction
	Phenomenon150 - direction
	Planet151 - direction
	Phenomenon152 - direction
	Star153 - direction
	Star154 - direction
	Planet155 - direction
	Star156 - direction
	Star157 - direction
	Planet158 - direction
	Planet159 - direction
	Planet160 - direction
	Star161 - direction
	Planet162 - direction
	Planet163 - direction
	Star164 - direction
	Phenomenon165 - direction
	Phenomenon166 - direction
	Star167 - direction
	Star168 - direction
	Star169 - direction
	Star170 - direction
	Planet171 - direction
	Planet172 - direction
	Planet173 - direction
	Phenomenon174 - direction
	Planet175 - direction
	Phenomenon176 - direction
	Phenomenon177 - direction
	Phenomenon178 - direction
	Star179 - direction
	Planet180 - direction
	Planet181 - direction
	Phenomenon182 - direction
	Planet183 - direction
	Planet184 - direction
	Phenomenon185 - direction
	Phenomenon186 - direction
	Phenomenon187 - direction
	Planet188 - direction
	Planet189 - direction
	Planet190 - direction
	Phenomenon191 - direction
	Phenomenon192 - direction
	Star193 - direction
	Planet194 - direction
	Star195 - direction
	Planet196 - direction
	Phenomenon197 - direction
	Phenomenon198 - direction
	Planet199 - direction
	Phenomenon200 - direction
	Phenomenon201 - direction
	Planet202 - direction
	Phenomenon203 - direction
	Star204 - direction
)
(:init
	(supports instrument0 spectrograph4)
	(supports instrument0 infrared0)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 spectrograph4)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 Star0)
	(supports instrument2 infrared0)
	(supports instrument2 infrared3)
	(supports instrument2 spectrograph4)
	(calibration_target instrument2 Star4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon143)
	(supports instrument3 infrared0)
	(calibration_target instrument3 Star4)
	(supports instrument4 spectrograph4)
	(supports instrument4 infrared0)
	(calibration_target instrument4 Star4)
	(supports instrument5 spectrograph4)
	(calibration_target instrument5 GroundStation1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon38)
	(supports instrument6 infrared3)
	(supports instrument6 thermograph2)
	(calibration_target instrument6 Star4)
	(on_board instrument6 satellite2)
	(power_avail satellite2)
	(pointing satellite2 Phenomenon56)
	(supports instrument7 infrared0)
	(supports instrument7 infrared1)
	(calibration_target instrument7 Star2)
	(on_board instrument7 satellite3)
	(power_avail satellite3)
	(pointing satellite3 Star142)
	(supports instrument8 thermograph2)
	(calibration_target instrument8 Star0)
	(supports instrument9 infrared0)
	(supports instrument9 thermograph2)
	(supports instrument9 spectrograph4)
	(calibration_target instrument9 Star4)
	(on_board instrument8 satellite4)
	(on_board instrument9 satellite4)
	(power_avail satellite4)
	(pointing satellite4 Phenomenon197)
	(supports instrument10 spectrograph4)
	(calibration_target instrument10 Star3)
	(supports instrument11 infrared3)
	(supports instrument11 infrared0)
	(calibration_target instrument11 GroundStation1)
	(on_board instrument10 satellite5)
	(on_board instrument11 satellite5)
	(power_avail satellite5)
	(pointing satellite5 Planet39)
	(supports instrument12 infrared0)
	(calibration_target instrument12 Star4)
	(supports instrument13 spectrograph4)
	(calibration_target instrument13 Star2)
	(on_board instrument12 satellite6)
	(on_board instrument13 satellite6)
	(power_avail satellite6)
	(pointing satellite6 Star0)
	(supports instrument14 spectrograph4)
	(calibration_target instrument14 Star2)
	(supports instrument15 infrared1)
	(supports instrument15 infrared0)
	(supports instrument15 spectrograph4)
	(calibration_target instrument15 Star2)
	(on_board instrument14 satellite7)
	(on_board instrument15 satellite7)
	(power_avail satellite7)
	(pointing satellite7 Phenomenon105)
	(supports instrument16 infrared0)
	(supports instrument16 infrared1)
	(supports instrument16 thermograph2)
	(calibration_target instrument16 Star0)
	(supports instrument17 spectrograph4)
	(supports instrument17 thermograph2)
	(calibration_target instrument17 Star0)
	(on_board instrument16 satellite8)
	(on_board instrument17 satellite8)
	(power_avail satellite8)
	(pointing satellite8 Planet60)
	(supports instrument18 infrared1)
	(calibration_target instrument18 Star2)
	(supports instrument19 infrared0)
	(supports instrument19 thermograph2)
	(supports instrument19 infrared1)
	(calibration_target instrument19 Star0)
	(supports instrument20 infrared1)
	(calibration_target instrument20 GroundStation1)
	(on_board instrument18 satellite9)
	(on_board instrument19 satellite9)
	(on_board instrument20 satellite9)
	(power_avail satellite9)
	(pointing satellite9 Star107)
	(supports instrument21 spectrograph4)
	(calibration_target instrument21 Star4)
	(on_board instrument21 satellite10)
	(power_avail satellite10)
	(pointing satellite10 Planet159)
	(supports instrument22 infrared1)
	(supports instrument22 thermograph2)
	(calibration_target instrument22 Star3)
	(on_board instrument22 satellite11)
	(power_avail satellite11)
	(pointing satellite11 Star12)
	(supports instrument23 infrared3)
	(supports instrument23 infrared1)
	(calibration_target instrument23 Star3)
	(supports instrument24 infrared0)
	(calibration_target instrument24 Star0)
	(on_board instrument23 satellite12)
	(on_board instrument24 satellite12)
	(power_avail satellite12)
	(pointing satellite12 Phenomenon57)
	(supports instrument25 infrared3)
	(supports instrument25 infrared0)
	(supports instrument25 infrared1)
	(calibration_target instrument25 Star0)
	(supports instrument26 infrared0)
	(calibration_target instrument26 Star3)
	(on_board instrument25 satellite13)
	(on_board instrument26 satellite13)
	(power_avail satellite13)
	(pointing satellite13 Planet84)
	(supports instrument27 thermograph2)
	(supports instrument27 spectrograph4)
	(supports instrument27 infrared1)
	(calibration_target instrument27 Star2)
	(supports instrument28 infrared0)
	(calibration_target instrument28 GroundStation1)
	(supports instrument29 thermograph2)
	(supports instrument29 spectrograph4)
	(calibration_target instrument29 Star3)
	(on_board instrument27 satellite14)
	(on_board instrument28 satellite14)
	(on_board instrument29 satellite14)
	(power_avail satellite14)
	(pointing satellite14 Phenomenon197)
)
(:goal (and
	(pointing satellite1 Star68)
	(pointing satellite2 Star149)
	(pointing satellite9 Phenomenon37)
	(pointing satellite13 Phenomenon57)
	(have_image Planet5 infrared0)
	(have_image Phenomenon6 spectrograph4)
	(have_image Star7 infrared0)
	(have_image Planet8 infrared1)
	(have_image Star9 spectrograph4)
	(have_image Planet10 thermograph2)
	(have_image Planet11 infrared3)
	(have_image Phenomenon13 spectrograph4)
	(have_image Star14 thermograph2)
	(have_image Star15 infrared3)
	(have_image Planet16 infrared1)
	(have_image Phenomenon17 spectrograph4)
	(have_image Star18 spectrograph4)
	(have_image Star19 thermograph2)
	(have_image Planet20 thermograph2)
	(have_image Phenomenon21 thermograph2)
	(have_image Star22 infrared1)
	(have_image Star23 spectrograph4)
	(have_image Phenomenon24 infrared0)
	(have_image Star25 infrared3)
	(have_image Star26 infrared0)
	(have_image Star27 infrared1)
	(have_image Phenomenon28 spectrograph4)
	(have_image Star29 infrared1)
	(have_image Planet30 infrared1)
	(have_image Planet31 infrared0)
	(have_image Planet32 thermograph2)
	(have_image Star33 infrared3)
	(have_image Star34 infrared1)
	(have_image Star35 infrared1)
	(have_image Phenomenon37 infrared0)
	(have_image Phenomenon38 thermograph2)
	(have_image Planet39 thermograph2)
	(have_image Planet40 spectrograph4)
	(have_image Star41 infrared0)
	(have_image Planet42 spectrograph4)
	(have_image Phenomenon43 spectrograph4)
	(have_image Phenomenon45 spectrograph4)
	(have_image Phenomenon46 thermograph2)
	(have_image Planet47 infrared0)
	(have_image Phenomenon48 infrared1)
	(have_image Planet49 infrared0)
	(have_image Phenomenon50 infrared0)
	(have_image Star51 infrared1)
	(have_image Star52 infrared3)
	(have_image Planet53 infrared0)
	(have_image Star55 infrared1)
	(have_image Phenomenon56 infrared3)
	(have_image Phenomenon57 spectrograph4)
	(have_image Planet59 infrared0)
	(have_image Planet60 thermograph2)
	(have_image Phenomenon61 infrared0)
	(have_image Planet62 infrared3)
	(have_image Star63 infrared0)
	(have_image Star64 infrared0)
	(have_image Planet65 infrared3)
	(have_image Star67 thermograph2)
	(have_image Star68 infrared1)
	(have_image Star69 spectrograph4)
	(have_image Star70 infrared1)
	(have_image Star71 infrared1)
	(have_image Planet72 spectrograph4)
	(have_image Planet74 infrared1)
	(have_image Star75 infrared0)
	(have_image Star76 infrared0)
	(have_image Planet77 thermograph2)
	(have_image Star78 infrared0)
	(have_image Phenomenon79 infrared3)
	(have_image Star80 infrared0)
	(have_image Star81 infrared0)
	(have_image Star83 infrared0)
	(have_image Planet84 thermograph2)
	(have_image Planet86 infrared1)
	(have_image Star87 infrared3)
	(have_image Phenomenon88 infrared1)
	(have_image Star89 infrared3)
	(have_image Phenomenon90 infrared0)
	(have_image Planet91 spectrograph4)
	(have_image Phenomenon92 spectrograph4)
	(have_image Planet93 infrared1)
	(have_image Phenomenon94 infrared3)
	(have_image Star96 infrared3)
	(have_image Planet97 spectrograph4)
	(have_image Phenomenon98 infrared1)
	(have_image Phenomenon99 infrared3)
	(have_image Phenomenon100 thermograph2)
	(have_image Phenomenon102 spectrograph4)
	(have_image Planet103 infrared3)
	(have_image Phenomenon104 infrared1)
	(have_image Phenomenon106 thermograph2)
	(have_image Phenomenon108 infrared1)
	(have_image Planet109 infrared3)
	(have_image Star110 thermograph2)
	(have_image Phenomenon111 spectrograph4)
	(have_image Star113 spectrograph4)
	(have_image Phenomenon114 infrared0)
	(have_image Phenomenon115 infrared1)
	(have_image Star116 thermograph2)
	(have_image Star117 infrared1)
	(have_image Star118 infrared1)
	(have_image Phenomenon119 infrared1)
	(have_image Planet120 infrared0)
	(have_image Phenomenon121 spectrograph4)
	(have_image Phenomenon122 infrared1)
	(have_image Phenomenon123 infrared1)
	(have_image Star124 infrared3)
	(have_image Phenomenon125 spectrograph4)
	(have_image Phenomenon126 spectrograph4)
	(have_image Phenomenon127 infrared0)
	(have_image Planet128 infrared1)
	(have_image Planet129 thermograph2)
	(have_image Planet130 infrared3)
	(have_image Phenomenon131 infrared3)
	(have_image Planet134 spectrograph4)
	(have_image Planet135 spectrograph4)
	(have_image Planet136 thermograph2)
	(have_image Star137 spectrograph4)
	(have_image Star138 thermograph2)
	(have_image Star139 infrared3)
	(have_image Planet140 infrared0)
	(have_image Planet141 infrared3)
	(have_image Star142 thermograph2)
	(have_image Phenomenon144 infrared0)
	(have_image Planet145 infrared1)
	(have_image Planet146 infrared1)
	(have_image Planet147 infrared3)
	(have_image Star149 infrared3)
	(have_image Phenomenon150 thermograph2)
	(have_image Planet151 infrared0)
	(have_image Phenomenon152 infrared3)
	(have_image Star153 infrared3)
	(have_image Star154 infrared1)
	(have_image Planet155 thermograph2)
	(have_image Star156 infrared0)
	(have_image Star157 thermograph2)
	(have_image Planet158 infrared0)
	(have_image Planet159 thermograph2)
	(have_image Planet160 infrared0)
	(have_image Star161 infrared1)
	(have_image Planet162 thermograph2)
	(have_image Planet163 infrared0)
	(have_image Star164 infrared0)
	(have_image Phenomenon165 infrared3)
	(have_image Phenomenon166 infrared0)
	(have_image Star167 infrared3)
	(have_image Star168 infrared0)
	(have_image Star169 infrared0)
	(have_image Star170 spectrograph4)
	(have_image Planet171 infrared3)
	(have_image Planet172 thermograph2)
	(have_image Phenomenon174 thermograph2)
	(have_image Planet175 thermograph2)
	(have_image Phenomenon176 spectrograph4)
	(have_image Phenomenon177 infrared1)
	(have_image Phenomenon178 infrared1)
	(have_image Star179 spectrograph4)
	(have_image Planet180 spectrograph4)
	(have_image Planet181 spectrograph4)
	(have_image Planet183 infrared1)
	(have_image Planet184 thermograph2)
	(have_image Phenomenon185 infrared1)
	(have_image Phenomenon186 infrared3)
	(have_image Phenomenon187 spectrograph4)
	(have_image Planet188 infrared0)
	(have_image Planet189 thermograph2)
	(have_image Planet190 spectrograph4)
	(have_image Phenomenon191 infrared1)
	(have_image Phenomenon192 infrared1)
	(have_image Star193 infrared3)
	(have_image Planet194 infrared3)
	(have_image Star195 spectrograph4)
	(have_image Planet196 spectrograph4)
	(have_image Phenomenon197 thermograph2)
	(have_image Phenomenon198 infrared1)
	(have_image Planet199 thermograph2)
	(have_image Phenomenon201 spectrograph4)
	(have_image Phenomenon203 infrared0)
	(have_image Star204 thermograph2)
))

)
