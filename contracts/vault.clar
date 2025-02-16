;; title: TimeFund
;; version: 2.1.0
;; summary: A time-locked collaborative fund management system
;; description: A smart contract that enables multiple participants to pool their STX tokens
;;             with time-based release conditions, milestone tracking, and democratic governance.
;;             Includes weighted voting, validator verification systems, and emergency recovery.


;; token definitions
(define-fungible-token fund-token)

;; constants
(define-constant CONTRACT_OWNER tx-sender)
(define-constant MIN_LOCK_PERIOD u1440)  ;; approximately 10 days at 10 min/block
(define-constant VOTE_THRESHOLD u75)      ;; 75% majority required
(define-constant MIN_DEPOSIT u1000000)    ;; 1 STX = 1000000 uSTX
(define-constant ERR-NOT-AUTHORIZED (err u1))
(define-constant ERR-INVALID-AMOUNT (err u2))
(define-constant ERR-MILESTONE-NOT-FOUND (err u3))
(define-constant ERR-LOCK-PERIOD-NOT-MET (err u4))
(define-constant ERR-ALREADY-VOTED (err u5))
(define-constant ERR-NO-PARTICIPANT (err u6))
(define-constant ERR-NO-EMERGENCY (err u7))
(define-constant ERR-INSUFFICIENT-VOTES (err u8))

;; data vars
(define-data-var total-pool uint u0)
(define-data-var participant-count uint u0)
(define-data-var release-votes uint u0)
(define-data-var last-milestone-id uint u0)
(define-data-var emergency-state bool false)
(define-data-var emergency-votes uint u0)
(define-data-var emergency-threshold uint u90) ;; 90% needed for emergency


;; data maps
(define-map participants 
    {participant: principal}  
    {amount: uint,            
     join-time: uint,         
     voting-power: uint,      
     has-voted: bool})       

(define-map milestones
    {milestone-id: uint}     
    {description: (string-ascii 256),  
     required-votes: uint,             
     completed: bool,                  
     completion-time: (optional uint)})

(define-map validators
    {validator: principal}
    {active: bool})


