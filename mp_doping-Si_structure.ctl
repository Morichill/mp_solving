;----------------------------materials-------------------------------
; silicon nitride (Si3N4) from K. Luke, et. al., Optics Letters, Vol. 40, pp. 4823-4826, 2015
; ref: https://refractiveindex.info/?shelf=main&book=Si3N4&page=Luke
; wavelength range: 0.310 - 5.504 um

(define Si3N4-NIR-frq1 (/ (* 0.1353406 um-scale)))
(define Si3N4-NIR-gam1 0)
(define Si3N4-NIR-sig1 3.0249)
(define Si3N4-NIR-frq2 (/ (* 1239.842 um-scale)))
(define Si3N4-NIR-gam2 0)
(define Si3N4-NIR-sig2 40314)

(define Si3N4-NIR (make medium (epsilon 1.0)
 (E-susceptibilities 
  (make lorentzian-susceptibility
    (frequency Si3N4-NIR-frq1) (gamma Si3N4-NIR-gam1) (sigma Si3N4-NIR-sig1))
  (make lorentzian-susceptibility
    (frequency Si3N4-NIR-frq2) (gamma Si3N4-NIR-gam2) (sigma Si3N4-NIR-sig2)))))

;------------------------------------------------------------------
; silicon (Si) from C. D. Salzberg and J. J. Villa, , J. Optical Society America, Vol. 47, pp. 244-246, 1957
; ref: https://refractiveindex.info/?shelf=main&book=Si&page=Salzberg
; wavelength range: 1.36 - 11 um

(define Si-frq1 (/ (* 0.301516485 um-scale)))
(define Si-gam1 0)
(define Si-sig1 10.6684293)

(define Si-frq2 (/ (* 1.13475115 um-scale)))
(define Si-gam2 0)
(define Si-sig2 0.0030434748)

(define Si-frq3 (/ (* 1104 um-scale)))
(define Si-gam3 0)
(define Si-sig3 1.54133408)

(define Si (make medium (epsilon 9.28156)
 (E-susceptibilities 
  (make lorentzian-susceptibility
    (frequency Si-frq1) (gamma Si-gam1) (sigma Si-sig1))
  (make lorentzian-susceptibility
    (frequency Si-frq2) (gamma Si-gam2) (sigma Si-sig2))
  (make lorentzian-susceptibility
    (frequency Si-frq3) (gamma Si-gam3) (sigma Si-sig3)))))
;------------------------------------------------------------------
; silicon dioxide (SiO2) from G. Ghosh, Optics Communication, Vol. 163, pp. 95-102, 1999
; ref: https://refractiveindex.info/?shelf=main&book=SiO2&page=Ghosh-o
; ref: https://refractiveindex.info/?shelf=main&book=SiO2&page=Ghosh-e
; wavelength range: 0.198 - 2.0531 um

;; NOTE: ordinary (o) axes in X and Y, extraordinary (e) axis in Z

(define SiO2-frq1 (/ (* 0.10029257051247614 um-scale)))
(define SiO2-gam1 0)
(define SiO2-sig1 1.07044083)

(define SiO2-frq2 (/ (* 10 um-scale)))
(define SiO2-gam2 0)
(define SiO2-sig2 1.10202242)

(define SiO2-susc-o
  (list
   (make lorentzian-susceptibility
     (frequency SiO2-frq1) (gamma SiO2-gam1) (sigma-diag (vector3* SiO2-sig1 (vector3 1 1 0))))
   (make lorentzian-susceptibility
     (frequency SiO2-frq2) (gamma SiO2-gam2) (sigma-diag (vector3* SiO2-sig2 (vector3 1 1 0))))))

(define SiO2-frq1 (/ (* 0.10104546699382412 um-scale)))
(define SiO2-gam1 0)
(define SiO2-sig1 1.09509924)

(define SiO2-frq2 (/ (* 10 um-scale)))
(define SiO2-gam2 0)
(define SiO2-sig2 1.15662475)

(define SiO2-susc-e
  (list
   (make lorentzian-susceptibility
     (frequency SiO2-frq1) (gamma SiO2-gam1) (sigma-diag (vector3* SiO2-sig1 (vector3 0 0 1))))
   (make lorentzian-susceptibility
     (frequency SiO2-frq2) (gamma SiO2-gam2) (sigma-diag (vector3* SiO2-sig2 (vector3 0 0 1))))))

(define SiO2-aniso (make medium
		     (epsilon-diag 1.28604141 1.28604141 1.28851804)
		     (E-susceptibilities (append SiO2-susc-o SiO2-susc-e))))

;----------------------------structure---------------------------------
(define-param dpml 0.2)                  ; thickness of PML layers
(define-param fcen 0.3)                  ; pulse center frequency
(define-param df 0.3)                    ; turn-on bandwidth
(define-param nfreq 20)
(define-param sample 10)
(define-param decayby 1e-8)

(define-param sx 16)                     ; size of cell in X direction
(define-param sy 16)                     ; size of cell in Y direction
(define-param sz 22)                     ; size of cell in Z direction

(define sx0 (+ sx (* 2 dpml)))           ; refer to the powerpoint slide
(define sy0 (+ sy (* 2 dpml)))           ; refer to the powerpoint slide
(define sz0 (+ sz (* 2 dpml)))           ; refer to the powerpoint slide


(define a 1e-6)                                                                                  ;length unit used in simulation = 1 micron
(set! resolution 40)                                                                             ;pixels/μm
(set! geometry-lattice (make lattice (size sx sy sz)))                                               
(set! geometry (list
         (make block (center 0 0 0) (size sx sy 0.6) 
		        (material SiO2-aniso) )                                                              ; SiO2-lib
		 (make block (center 0 0 -0.4) (size sx sy 0.4)
        		(material Si3N4-NIR) )                                                               ; Si3N4-NIR-lib
		 (make block (center 0 0 -10.4) (size sx sy 10) 
		        (material Si) )                                                                      ; substrate-Si-lib
		 (make block (center -8 -8 0.6) (size 3 3 1) 
		        (material (make dielectric (epsilon 12))) )                                          ; Atention! Make  material - doping Si
		 (make block (center 0 -8 0.6) (size 3 3 1) 
		        (material (make dielectric (epsilon 12))) )                                          ; Atention! Make  material - doping Si
		 (make block (center -8 0 0.6) (size 3 3 1) 
		        (material (make dielectric (epsilon 12))) )                                          ; Atention! Make  material - doping Si
		 (make block (center 0 0 0.6) (size 3 3 1) 
		        (material (make dielectric (epsilon 12))) )                                          ; Atention! Make  material - doping Si
)

(set! sources (list 
        (make source 
		  (src (make gaussian-src (frequency fcen) (fwidth df)))
                  (component Hz) 
		  (center 0 0 10)
		  (size sx sy))))

(set! pml-layers (list 
       (make pml (thickness dpml) (direction X))
       (make pml (thickness dpml) (direction Y))
       (make pml (thickness dpml) (direction Z)))) 
       
; Define a monitor half the size
(define monitor-xy
   (volume 
   (center 0 0 0)(size sx sy 0)))

(define monitor-xz
   (volume 
   (center 0 0 0)(size sx 0 sz)))
   
(if (not structure?)
(define incident; transmitted flux  for calculating source power                                              
      (add-flux fcen df nfreq
                    (make flux-region
                    (center 0 0 -0.7) (size sx sy 0) ))))

(define left                                       
      (add-flux fcen df nfreq
                    (make flux-region
                    (center -8  0 0) (size 0 sy sz) )))

(define right                                                
      (add-flux fcen df nfreq
                    (make flux-region
                    (center  8  0 0) (size 0 sy sz) )))

(define bottom                                                
      (add-flux fcen df nfreq
                    (make flux-region
                    (center 0 0 -2) (size sx sy 0) )))

(define top                                                
      (add-flux fcen df nfreq
                    (make flux-region
                    (center 0 0 12) (size  sx  sy 0) )))

(define back                                                
      (add-flux fcen df nfreq
                    (make flux-region
                    (center 0 0 -12) (size sx  sy 0) )))


(define front                                                
      (add-flux fcen df nfreq
                    (make flux-region
                    (center 0 0 12 ) (size sx  sy 0) )))
   

if scattering?
;if scattering? is true, do the following
(list 
	(if structure? 
		(list 
		(load-minus-flux "left_flux" left) 
		(load-minus-flux "right_flux" right) 
		(load-minus-flux "top_flux" top) 
		(load-minus-flux "bottom_flux" bottom) 
		(load-minus-flux "front_flux" front) 
		(load-minus-flux "back_flux" back))
	)
	
	(if (not structure?)
		(run-sources+	(stop-when-fields-decayed 1 Ex (vector3 0 sy 0) decayby)
			(in-volume monitor-xz (to-appended "bEx_xz" (at-every (/ 1 (+ fcen (* 0.5 df)) sample) output-efield-x)))
			(in-volume monitor-xz (to-appended "bEy_xz" (at-every (/ 1 (+ fcen (* 0.5 df)) sample) output-efield-y)))
			(in-volume monitor-xz (to-appended "bEz_xz" (at-every (/ 1 (+ fcen (* 0.5 df)) sample) output-efield-z)))
			
			(in-volume monitor-xy (to-appended "bEx_xy" (at-every (/ 1 (+ fcen (* 0.5 df)) sample) output-efield-x)))
			(in-volume monitor-xy (to-appended "bEy_xy" (at-every (/ 1 (+ fcen (* 0.5 df)) sample) output-efield-y)))
			(in-volume monitor-xy (to-appended "bEz_xy" (at-every (/ 1 (+ fcen (* 0.5 df)) sample) output-efield-z)))

		)	
	)

	(if structure?
	(run-sources+	(stop-when-fields-decayed 1 Ex (vector3 0 sy 0) decayby)
	)
	)
	
	(if (not structure?) 
		(list 
			(save-flux "left_flux" left) 
			(save-flux "right_flux" right)
			(save-flux "top_flux" top)
			(save-flux "bottom_flux" bottom) 
			(save-flux "front_flux" front)
			(save-flux "back_flux" back)) 
	)

	(if (not structure?) (display-fluxes incident))

	(if structure? (display-fluxes left right bottom top back front))
)
;if scattering? is false, do the following
(list 
	(run-sources+	(stop-when-fields-decayed 1 Ex (vector3 0 sy 0) decayby)
		(in-volume monitor-xy (at-beginning output-epsilon))
		(in-volume monitor-xz (to-appended "sEx_xz" (at-every (/ 1 (+ fcen (* 0.5 df)) sample) output-efield-x)))
		(in-volume monitor-xz (to-appended "sEy_xz" (at-every (/ 1 (+ fcen (* 0.5 df)) sample) output-efield-y)))
		(in-volume monitor-xz (to-appended "sEz_xz" (at-every (/ 1 (+ fcen (* 0.5 df)) sample) output-efield-z)))

		(in-volume monitor-xz (at-beginning output-epsilon))
		(in-volume monitor-xy (to-appended "sEx_xy" (at-every (/ 1 (+ fcen (* 0.5 df)) sample) output-efield-x)))
		(in-volume monitor-xy (to-appended "sEy_xy" (at-every (/ 1 (+ fcen (* 0.5 df)) sample) output-efield-y)))
		(in-volume monitor-xy (to-appended "sEz_xy" (at-every (/ 1 (+ fcen (* 0.5 df)) sample) output-efield-z)))
	)
	(if structure? (display-fluxes left right bottom top back front))
	)

)


;(run-until 200
;(in-volume monitor (to-appended "Ex" (at-every (/ 1 (+ fcen (* 0.5 df)) sample) output-efield-x)))
;)
