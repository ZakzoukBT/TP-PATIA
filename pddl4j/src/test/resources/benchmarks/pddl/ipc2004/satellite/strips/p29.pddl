(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	satellite2 - satellite
	instrument4 - instrument
	satellite3 - satellite
	instrument5 - instrument
	satellite4 - satellite
	instrument6 - instrument
	instrument7 - instrument
	satellite5 - satellite
	instrument8 - instrument
	instrument9 - instrument
	instrument10 - instrument
	satellite6 - satellite
	instrument11 - instrument
	instrument12 - instrument
	satellite7 - satellite
	instrument13 - instrument
	satellite8 - satellite
	instrument14 - instrument
	satellite9 - satellite
	instrument15 - instrument
	instrument16 - instrument
	satellite10 - satellite
	instrument17 - instrument
	instrument18 - instrument
	instrument19 - instrument
	satellite11 - satellite
	instrument20 - instrument
	instrument21 - instrument
	instrument22 - instrument
	satellite12 - satellite
	instrument23 - instrument
	satellite13 - satellite
	instrument24 - instrument
	instrument25 - instrument
	instrument26 - instrument
	satellite14 - satellite
	instrument27 - instrument
	image2 - mode
	image4 - mode
	infrared1 - mode
	spectrograph0 - mode
	image3 - mode
	Star0 - direction
	Star2 - direction
	GroundStation1 - direction
	Star3 - direction
	Star4 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Planet10 - direction
	Planet11 - direction
	Phenomenon12 - direction
	Phenomenon13 - direction
	Star14 - direction
	Star15 - direction
	Star16 - direction
	Planet17 - direction
	Star18 - direction
	Planet19 - direction
	Phenomenon20 - direction
	Phenomenon21 - direction
	Star22 - direction
	Planet23 - direction
	Star24 - direction
	Star25 - direction
	Planet26 - direction
	Star27 - direction
	Planet28 - direction
	Phenomenon29 - direction
	Planet30 - direction
	Planet31 - direction
	Planet32 - direction
	Star33 - direction
	Star34 - direction
	Star35 - direction
	Phenomenon36 - direction
	Planet37 - direction
	Planet38 - direction
	Star39 - direction
	Planet40 - direction
	Phenomenon41 - direction
	Planet42 - direction
	Star43 - direction
	Phenomenon44 - direction
	Phenomenon45 - direction
	Phenomenon46 - direction
	Planet47 - direction
	Phenomenon48 - direction
	Phenomenon49 - direction
	Star50 - direction
	Phenomenon51 - direction
	Star52 - direction
	Star53 - direction
	Star54 - direction
	Planet55 - direction
	Phenomenon56 - direction
	Phenomenon57 - direction
	Star58 - direction
	Star59 - direction
	Planet60 - direction
	Planet61 - direction
	Star62 - direction
	Phenomenon63 - direction
	Star64 - direction
	Star65 - direction
	Planet66 - direction
	Planet67 - direction
	Planet68 - direction
	Planet69 - direction
	Phenomenon70 - direction
	Star71 - direction
	Star72 - direction
	Planet73 - direction
	Star74 - direction
	Star75 - direction
	Phenomenon76 - direction
	Star77 - direction
	Star78 - direction
	Star79 - direction
	Planet80 - direction
	Planet81 - direction
	Star82 - direction
	Star83 - direction
	Star84 - direction
	Star85 - direction
	Star86 - direction
	Planet87 - direction
	Star88 - direction
	Phenomenon89 - direction
	Phenomenon90 - direction
	Planet91 - direction
	Phenomenon92 - direction
	Planet93 - direction
	Phenomenon94 - direction
	Star95 - direction
	Star96 - direction
	Star97 - direction
	Planet98 - direction
	Planet99 - direction
	Phenomenon100 - direction
	Planet101 - direction
	Planet102 - direction
	Phenomenon103 - direction
	Planet104 - direction
)
(:init
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star2)
	(supports instrument1 image4)
	(calibration_target instrument1 Star0)
	(supports instrument2 image2)
	(calibration_target instrument2 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star58)
	(supports instrument3 image4)
	(calibration_target instrument3 Star2)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet87)
	(supports instrument4 spectrograph0)
	(calibration_target instrument4 Star3)
	(on_board instrument4 satellite2)
	(power_avail satellite2)
	(pointing satellite2 Phenomenon45)
	(supports instrument5 image4)
	(calibration_target instrument5 GroundStation1)
	(on_board instrument5 satellite3)
	(power_avail satellite3)
	(pointing satellite3 Planet5)
	(supports instrument6 image2)
	(calibration_target instrument6 GroundStation1)
	(supports instrument7 image3)
	(calibration_target instrument7 Star0)
	(on_board instrument6 satellite4)
	(on_board instrument7 satellite4)
	(power_avail satellite4)
	(pointing satellite4 Planet17)
	(supports instrument8 image3)
	(calibration_target instrument8 Star4)
	(supports instrument9 infrared1)
	(supports instrument9 image2)
	(supports instrument9 spectrograph0)
	(calibration_target instrument9 GroundStation1)
	(supports instrument10 infrared1)
	(supports instrument10 spectrograph0)
	(calibration_target instrument10 Star4)
	(on_board instrument8 satellite5)
	(on_board instrument9 satellite5)
	(on_board instrument10 satellite5)
	(power_avail satellite5)
	(pointing satellite5 Phenomenon36)
	(supports instrument11 image4)
	(supports instrument11 image3)
	(calibration_target instrument11 GroundStation1)
	(supports instrument12 image3)
	(supports instrument12 image4)
	(calibration_target instrument12 Star0)
	(on_board instrument11 satellite6)
	(on_board instrument12 satellite6)
	(power_avail satellite6)
	(pointing satellite6 Planet98)
	(supports instrument13 image3)
	(supports instrument13 spectrograph0)
	(calibration_target instrument13 Star4)
	(on_board instrument13 satellite7)
	(power_avail satellite7)
	(pointing satellite7 Phenomenon20)
	(supports instrument14 image4)
	(supports instrument14 image2)
	(calibration_target instrument14 Star3)
	(on_board instrument14 satellite8)
	(power_avail satellite8)
	(pointing satellite8 Planet17)
	(supports instrument15 infrared1)
	(supports instrument15 spectrograph0)
	(calibration_target instrument15 GroundStation1)
	(supports instrument16 spectrograph0)
	(supports instrument16 infrared1)
	(supports instrument16 image3)
	(calibration_target instrument16 GroundStation1)
	(on_board instrument15 satellite9)
	(on_board instrument16 satellite9)
	(power_avail satellite9)
	(pointing satellite9 Phenomenon8)
	(supports instrument17 image4)
	(supports instrument17 spectrograph0)
	(calibration_target instrument17 Star2)
	(supports instrument18 infrared1)
	(supports instrument18 image4)
	(supports instrument18 image2)
	(calibration_target instrument18 Star3)
	(supports instrument19 image2)
	(supports instrument19 image4)
	(supports instrument19 spectrograph0)
	(calibration_target instrument19 Star4)
	(on_board instrument17 satellite10)
	(on_board instrument18 satellite10)
	(on_board instrument19 satellite10)
	(power_avail satellite10)
	(pointing satellite10 Phenomenon45)
	(supports instrument20 infrared1)
	(supports instrument20 image2)
	(supports instrument20 spectrograph0)
	(calibration_target instrument20 Star0)
	(supports instrument21 image4)
	(supports instrument21 spectrograph0)
	(supports instrument21 infrared1)
	(calibration_target instrument21 Star2)
	(supports instrument22 spectrograph0)
	(supports instrument22 image2)
	(calibration_target instrument22 GroundStation1)
	(on_board instrument20 satellite11)
	(on_board instrument21 satellite11)
	(on_board instrument22 satellite11)
	(power_avail satellite11)
	(pointing satellite11 Planet60)
	(supports instrument23 infrared1)
	(calibration_target instrument23 GroundStation1)
	(on_board instrument23 satellite12)
	(power_avail satellite12)
	(pointing satellite12 Planet47)
	(supports instrument24 image4)
	(calibration_target instrument24 Star3)
	(supports instrument25 infrared1)
	(supports instrument25 image3)
	(calibration_target instrument25 Star4)
	(supports instrument26 spectrograph0)
	(supports instrument26 infrared1)
	(calibration_target instrument26 Star4)
	(on_board instrument24 satellite13)
	(on_board instrument25 satellite13)
	(on_board instrument26 satellite13)
	(power_avail satellite13)
	(pointing satellite13 Star83)
	(supports instrument27 image3)
	(calibration_target instrument27 Star4)
	(on_board instrument27 satellite14)
	(power_avail satellite14)
	(pointing satellite14 Star9)
)
(:goal (and
	(pointing satellite1 Star88)
	(pointing satellite3 Planet87)
	(pointing satellite4 Star82)
	(pointing satellite6 Star24)
	(pointing satellite8 Phenomenon48)
	(pointing satellite12 Planet67)
	(have_image Planet5 image2)
	(have_image Phenomenon6 image3)
	(have_image Phenomenon7 infrared1)
	(have_image Phenomenon8 image2)
	(have_image Star9 image3)
	(have_image Planet10 image4)
	(have_image Planet11 spectrograph0)
	(have_image Phenomenon12 image3)
	(have_image Phenomenon13 spectrograph0)
	(have_image Star14 image4)
	(have_image Star15 image4)
	(have_image Planet17 image3)
	(have_image Star18 image4)
	(have_image Planet19 image4)
	(have_image Phenomenon20 image2)
	(have_image Phenomenon21 image2)
	(have_image Star22 infrared1)
	(have_image Planet23 infrared1)
	(have_image Star24 spectrograph0)
	(have_image Star25 infrared1)
	(have_image Planet26 image2)
	(have_image Star27 image3)
	(have_image Planet28 image4)
	(have_image Planet30 infrared1)
	(have_image Planet31 infrared1)
	(have_image Planet32 image2)
	(have_image Star33 image4)
	(have_image Star34 image4)
	(have_image Star35 spectrograph0)
	(have_image Phenomenon36 infrared1)
	(have_image Planet38 infrared1)
	(have_image Planet40 image2)
	(have_image Phenomenon41 image3)
	(have_image Planet42 image3)
	(have_image Star43 image2)
	(have_image Phenomenon44 image2)
	(have_image Phenomenon45 image4)
	(have_image Planet47 spectrograph0)
	(have_image Phenomenon48 image4)
	(have_image Phenomenon49 infrared1)
	(have_image Star50 infrared1)
	(have_image Star53 spectrograph0)
	(have_image Star54 image3)
	(have_image Planet55 image4)
	(have_image Phenomenon56 infrared1)
	(have_image Phenomenon57 spectrograph0)
	(have_image Star58 image2)
	(have_image Star59 image4)
	(have_image Planet60 image2)
	(have_image Planet61 image3)
	(have_image Star62 image3)
	(have_image Phenomenon63 infrared1)
	(have_image Star64 spectrograph0)
	(have_image Star65 image2)
	(have_image Planet66 infrared1)
	(have_image Planet68 image4)
	(have_image Planet69 image2)
	(have_image Phenomenon70 image4)
	(have_image Star71 image3)
	(have_image Star72 image2)
	(have_image Planet73 image3)
	(have_image Star74 image2)
	(have_image Star75 infrared1)
	(have_image Phenomenon76 spectrograph0)
	(have_image Star77 image4)
	(have_image Star78 image4)
	(have_image Star79 infrared1)
	(have_image Star82 image3)
	(have_image Star83 image4)
	(have_image Star85 spectrograph0)
	(have_image Star86 infrared1)
	(have_image Planet87 image3)
	(have_image Star88 spectrograph0)
	(have_image Phenomenon89 image2)
	(have_image Phenomenon90 image3)
	(have_image Planet91 image4)
	(have_image Phenomenon92 image4)
	(have_image Planet93 image4)
	(have_image Star95 spectrograph0)
	(have_image Star96 spectrograph0)
	(have_image Star97 spectrograph0)
	(have_image Planet99 image4)
	(have_image Phenomenon100 image3)
	(have_image Planet101 image3)
	(have_image Planet102 image2)
	(have_image Phenomenon103 infrared1)
	(have_image Planet104 infrared1)
))

)
