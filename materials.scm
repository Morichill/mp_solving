;------------------------------------------------------------------
; silicon nitride (Si3N4) from H. R. Philipp, J. Electrochemical Society, Vol. 120, pp. 295-300, 1973
; ref: https://refractiveindex.info/?shelf=main&book=Si3N4&page=Philipp
; wavelength range: 0.207 - 1.24 um

(define Si3N4-VISNIR-frq1 (/ (* 0.13967 um-scale)))
(define Si3N4-VISNIR-gam1 0)
(define Si3N4-VISNIR-sig1 2.8939)

(define Si3N4-VISNIR (make medium (epsilon 1.0)
 (E-susceptibilities 
  (make lorentzian-susceptibility
    (frequency Si3N4-VISNIR-frq1) (gamma Si3N4-VISNIR-gam1) (sigma Si3N4-VISNIR-sig1)))))

;------------------------------------------------------------------
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
; elemental metals from A.D. Rakic et al., Applied Optics, Vol. 37, No. 22, pp. 5271-83, 1998
; wavelength range: 0.2 - 12.4 um

;------------------------------------------------------------------
; aluminum (Al)

(define Al-plasma-frq (* 14.98 eV-um-scale))

(define Al-f0 0.523)
(define Al-frq0 1e-10)
(define Al-gam0 (* 0.047 eV-um-scale))
(define Al-sig0 (/ (* Al-f0 (sqr Al-plasma-frq)) (sqr Al-frq0)))

(define Al-f1 0.227)
(define Al-frq1 (* 0.162 eV-um-scale)) ; 7.654 um
(define Al-gam1 (* 0.333 eV-um-scale))
(define Al-sig1 (/ (* Al-f1 (sqr Al-plasma-frq)) (sqr Al-frq1)))

(define Al-f2 0.050)
(define Al-frq2 (* 1.544 eV-um-scale)) ; 0.803 um
(define Al-gam2 (* 0.312 eV-um-scale))
(define Al-sig2 (/ (* Al-f2 (sqr Al-plasma-frq)) (sqr Al-frq2)))

(define Al-f3 0.166)
(define Al-frq3 (* 1.808 eV-um-scale)) ; 0.686 um
(define Al-gam3 (* 1.351 eV-um-scale))
(define Al-sig3 (/ (* Al-f3 (sqr Al-plasma-frq)) (sqr Al-frq3)))

(define Al-f4 0.030)
(define Al-frq4 (* 3.473 eV-um-scale)) ; 0.357 um
(define Al-gam4 (* 3.382 eV-um-scale))
(define Al-sig4 (/ (* Al-f4 (sqr Al-plasma-frq)) (sqr Al-frq4)))

(define Al (make medium (epsilon 1.0)
  (E-susceptibilities
     (make drude-susceptibility
       (frequency Al-frq0) (gamma Al-gam0) (sigma Al-sig0))
     (make lorentzian-susceptibility
       (frequency Al-frq1) (gamma Al-gam1) (sigma Al-sig1))
     (make lorentzian-susceptibility
       (frequency Al-frq2) (gamma Al-gam2) (sigma Al-sig2))
     (make lorentzian-susceptibility
       (frequency Al-frq3) (gamma Al-gam3) (sigma Al-sig3))
     (make lorentzian-susceptibility
       (frequency Al-frq4) (gamma Al-gam4) (sigma Al-sig4)))))

;------------------------------------------------------------------
;------------------------------------------------------------------
; nickel (Ni)

(define Ni-plasma-frq (* 15.92 eV-um-scale))

(define Ni-f0 0.096)
(define Ni-frq0 1e-10)
(define Ni-gam0 (* 0.048 eV-um-scale))
(define Ni-sig0 (/ (* Ni-f0 (sqr Ni-plasma-frq)) (sqr Ni-frq0)))

(define Ni-f1 0.100)
(define Ni-frq1 (* 0.174 eV-um-scale)) ; 7.126 um
(define Ni-gam1 (* 4.511 eV-um-scale))
(define Ni-sig1 (/ (* Ni-f1 (sqr Ni-plasma-frq)) (sqr Ni-frq1)))

(define Ni-f2 0.135)
(define Ni-frq2 (* 0.582 eV-um-scale)) ; 2.130 um
(define Ni-gam2 (* 1.334 eV-um-scale))
(define Ni-sig2 (/ (* Ni-f2 (sqr Ni-plasma-frq)) (sqr Ni-frq2)))

(define Ni-f3 0.106)
(define Ni-frq3 (* 1.597 eV-um-scale)) ; 0.776 um
(define Ni-gam3 (* 2.178 eV-um-scale))
(define Ni-sig3 (/ (* Ni-f3 (sqr Ni-plasma-frq)) (sqr Ni-frq3)))

(define Ni-f4 0.729)
(define Ni-frq4 (* 6.089 eV-um-scale)) ; 0.204 um
(define Ni-gam4 (* 6.292 eV-um-scale))
(define Ni-sig4 (/ (* Ni-f4 (sqr Ni-plasma-frq)) (sqr Ni-frq4)))

(define Ni (make medium (epsilon 1.0)
  (E-susceptibilities
     (make drude-susceptibility
       (frequency Ni-frq0) (gamma Ni-gam0) (sigma Ni-sig0))
     (make lorentzian-susceptibility
       (frequency Ni-frq1) (gamma Ni-gam1) (sigma Ni-sig1))
     (make lorentzian-susceptibility
       (frequency Ni-frq2) (gamma Ni-gam2) (sigma Ni-sig2))
     (make lorentzian-susceptibility
       (frequency Ni-frq3) (gamma Ni-gam3) (sigma Ni-sig3))
     (make lorentzian-susceptibility
       (frequency Ni-frq4) (gamma Ni-gam4) (sigma Ni-sig4)))))

;------------------------------------------------------------------
;------------------------------------------------------------------
; platinum (Pt)

(define Pt-plasma-frq (* 9.59 eV-um-scale))

(define Pt-f0 0.333)
(define Pt-frq0 1e-10)
(define Pt-gam0 (* 0.080 eV-um-scale))
(define Pt-sig0 (/ (* Pt-f0 (sqr Pt-plasma-frq)) (sqr Pt-frq0)))

(define Pt-f1 0.191)
(define Pt-frq1 (* 0.780 eV-um-scale)) ; 1.590 um
(define Pt-gam1 (* 0.517 eV-um-scale))
(define Pt-sig1 (/ (* Pt-f1 (sqr Pt-plasma-frq)) (sqr Pt-frq1)))

(define Pt-f2 0.659)
(define Pt-frq2 (* 1.314 eV-um-scale)) ; 0.944 um
(define Pt-gam2 (* 1.838 eV-um-scale))
(define Pt-sig2 (/ (* Pt-f2 (sqr Pt-plasma-frq)) (sqr Pt-frq2)))

(define Pt-f3 0.547)
(define Pt-frq3 (* 3.141 eV-um-scale)) ; 0.395 um
(define Pt-gam3 (* 3.668 eV-um-scale))
(define Pt-sig3 (/ (* Pt-f3 (sqr Pt-plasma-frq)) (sqr Pt-frq3)))

(define Pt-f4 3.576)
(define Pt-frq4 (* 9.249 eV-um-scale)) ; 0.134 um
(define Pt-gam4 (* 8.517 eV-um-scale))
(define Pt-sig4 (/ (* Pt-f4 (sqr Pt-plasma-frq)) (sqr Pt-frq4)))

(define Pt (make medium (epsilon 1.0)
  (E-susceptibilities
     (make drude-susceptibility
       (frequency Pt-frq0) (gamma Pt-gam0) (sigma Pt-sig0))
     (make lorentzian-susceptibility
       (frequency Pt-frq1) (gamma Pt-gam1) (sigma Pt-sig1))
     (make lorentzian-susceptibility
       (frequency Pt-frq2) (gamma Pt-gam2) (sigma Pt-sig2))
     (make lorentzian-susceptibility
       (frequency Pt-frq3) (gamma Pt-gam3) (sigma Pt-sig3))
     (make lorentzian-susceptibility
       (frequency Pt-frq4) (gamma Pt-gam4) (sigma Pt-sig4)))))

;------------------------------------------------------------------
;------------------------------------------------------------------
; silicon dioxide (SiO2) from Horiba Technical Note 08: Lorentz Dispersion Model
; ref: http://www.horiba.com/fileadmin/uploads/Scientific/Downloads/OpticalSchool_CN/TN/ellipsometer/Lorentz_Dispersion_Model.pdf
; wavelength range: 0.25 - 1.77 um

(define SiO2-frq1 (/ (* 0.103320160833333 um-scale)))
(define SiO2-gam1 (/ (* 12.3984193000000 um-scale)))
(define SiO2-sig1 1.12)

(define SiO2 (make medium (epsilon 1.0)
 (E-susceptibilities 
  (make lorentzian-susceptibility
    (frequency SiO2-frq1) (gamma SiO2-gam1) (sigma SiO2-sig1)))))

;------------------------------------------------------------------
;------------------------------------------------------------------
; germanium (Ge) from N. P. Barnes and M. S. Piltch, J. Optical Society America, Vol. 69, pp. 178-180, 1979
; ref: https://refractiveindex.info/?shelf=main&book=Ge&page=Icenogle
; wavelength range: 2.5 - 12 um

(define Ge-frq1 (/ (* 0.6641159 um-scale)))
(define Ge-gam1 0)
(define Ge-sig1 6.7288)

(define Ge-frq2 (/ (* 62.210127 um-scale)))
(define Ge-gam2 0)
(define Ge-sig2 0.21307)

(define Ge (make medium (epsilon 9.28156)
 (E-susceptibilities 
  (make lorentzian-susceptibility
    (frequency Ge-frq1) (gamma Ge-gam1) (sigma Ge-sig1))
  (make lorentzian-susceptibility
    (frequency Ge-frq2) (gamma Ge-gam2) (sigma Ge-sig2)))))

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

;------------------------------------------------------------------
; gallium nitride (GaN), alpha phase (wurtzite), from A.S. Barker Jr. and M. Ilegems, Physical Review B, Vol. 7, pp. 743-50, 1973
; ref: https://refractiveindex.info/?shelf=main&book=GaN&page=Barker-o
; ref: https://refractiveindex.info/?shelf=main&book=GaN&page=Barker-e
; wavelength range: 0.35 - 10 um

;; NOTE: ordinary (o) axes in X and Y, extraordinary (e) axis in Z

(define GaN-frq1 (/ (* 0.256 um-scale)))
(define GaN-gam1 0)
(define GaN-sig1 1.75)

(define GaN-frq2 (/ (* 17.86 um-scale)))
(define GaN-gam2 0)
(define GaN-sig2 4.1)

(define GaN-susc-o
  (list
   (make lorentzian-susceptibility
     (frequency GaN-frq1) (gamma GaN-gam1) (sigma-diag (vector3* GaN-sig1 (vector3 1 1 0))))
   (make lorentzian-susceptibility
     (frequency GaN-frq2) (gamma GaN-gam2) (sigma-diag (vector3* GaN-sig2 (vector3 1 1 0))))))

(define GaN-frq1 (/ (* 18.76 um-scale)))
(define GaN-gam1 0)
(define GaN-sig1 5.08)

(define GaN-susc-e
  (list
   (make lorentzian-susceptibility
     (frequency GaN-frq1) (gamma GaN-gam1) (sigma-diag (vector3* GaN-sig1 (vector3 0 0 1))))))

(define GaN (make medium
	      (epsilon-diag 3.6 3.6 5.35)
	      (E-susceptibilities (append GaN-susc-o GaN-susc-e))))

;------------------------------------------------------------------
; aluminum nitride (AlN) from J. Pastrnak and L. Roskovcova, Physica Status Solidi, Vol. 14, K5-8, 1966
; ref: https://refractiveindex.info/?shelf=main&book=AlN&page=Pastrnak-o
; ref: https://refractiveindex.info/?shelf=main&book=AlN&page=Pastrnak-e
; wavelength range: 0.22 - 5 um

;; NOTE: ordinary (o) axes in X and Y, extraordinary (e) axis in Z

(define AlN-frq1 (/ (* 0.1715 um-scale)))
(define AlN-gam1 0)
(define AlN-sig1 1.3786)

(define AlN-frq2 (/ (* 15.03 um-scale)))
(define AlN-gam2 0)
(define AlN-sig2 3.861)

(define AlN-susc-o
  (list
   (make lorentzian-susceptibility
     (frequency AlN-frq1) (gamma AlN-gam1) (sigma-diag (vector3* AlN-sig1 (vector3 1 1 0))))
   (make lorentzian-susceptibility
     (frequency AlN-frq2) (gamma AlN-gam2) (sigma-diag (vector3* AlN-sig2 (vector3 1 1 0))))))

(define AlN-frq1 (/ (* 0.1746 um-scale)))
(define AlN-gam1 0)
(define AlN-sig1 1.6173)

(define AlN-frq2 (/ (* 15.03 um-scale)))
(define AlN-gam2 0)
(define AlN-sig2 4.139)

(define AlN-susc-e
  (list
   (make lorentzian-susceptibility
     (frequency AlN-frq1) (gamma AlN-gam1) (sigma-diag (vector3* AlN-sig1 (vector3 0 0 1))))
   (make lorentzian-susceptibility
     (frequency AlN-frq2) (gamma AlN-gam2) (sigma-diag (vector3* AlN-sig2 (vector3 0 0 1))))))

(define AlN-aniso (make medium
		     (epsilon-diag 3.1399 3.1399 3.0729)
		     (E-susceptibilities (append AlN-susc-o AlN-susc-e))))

;------------------------------------------------------------------
; silicon carbide (SiC) from S. Singh, J. R. Potopowicz, L. G. Van Uitert and S. H. Wemple.  Appl. Phys. Lett. 19, 53 1971
; ref: https://refractiveindex.info/?shelf=main&book=SiC&page=Singh-o
; α-SiC; 
;wavelength range: 0.488-1.064 µm

(define SiC-frq1 (/ (* 0.026945 um-scale)))
(define SiC-gam1 0)	
(define SiC-sig1 5.5394)	

(define A-SiC (make medium (epsilon 9.28156)
 (E-susceptibilities 
  (make lorentzian-susceptibility
    (frequency Si-frq1) (gamma Si-gam1) (sigma Si-sig1)))))	
	
;------------------------------------------------------------------
