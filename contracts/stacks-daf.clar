;; title: Decentralized Autonomous Fund (DAF) Contract
;; summary: A smart contract for managing a decentralized autonomous fund with functionalities for deposits, withdrawals, proposals, and voting.
;; description: 
;; This contract implements a Decentralized Autonomous Fund (DAF) on the Stacks blockchain. It allows users to deposit STX tokens, create and vote on proposals, and execute approved proposals. The contract includes mechanisms for minting and burning tokens, tracking balances, and ensuring secure and authorized operations. Key features include:
;; - Deposit and withdrawal of STX tokens with a lock period.
;; - Creation of proposals with specified amounts, targets, and durations.
;; - Voting on proposals with weighted voting power based on token holdings.
;; - Execution of approved proposals after the voting period.
;; - Read-only functions to query balances, total supply, proposals, and deposit information.


;; Constants
(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-initialized (err u101))
(define-constant err-already-initialized (err u102))
(define-constant err-insufficient-balance (err u103))
(define-constant err-invalid-amount (err u104))
(define-constant err-unauthorized (err u105))
(define-constant err-proposal-not-found (err u106))
(define-constant err-proposal-expired (err u107))
(define-constant err-already-voted (err u108))
(define-constant err-below-minimum (err u109))
(define-constant err-locked-period (err u110))
(define-constant err-transfer-failed (err u111))