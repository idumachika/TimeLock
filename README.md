TimeFund

Version: 2.1.0

Summary

TimeFund is a smart contract that enables multiple participants to pool their STX tokens with time-based release conditions, milestone tracking, and democratic governance. It includes:

Weighted voting

Validator verification system

Emergency recovery mechanisms

Features

Time-Locked Fund Management: Participants deposit STX tokens with a predefined lock period.

Milestone-Based Releases: Funds are unlocked based on milestone completions.

Democratic Governance: Participants vote on fund release using weighted voting.

Emergency Recovery: A mechanism to halt fund release in case of issues.

Installation & Deployment

Prerequisites

Ensure you have the following installed:

Clarinet (for smart contract development)

Stacks CLI

Deploy the Contract

Clone the repository:

git clone https://github.com/your-username/timefund.git
cd timefund

Start a Clarinet project (if not already initialized):

clarinet check

Deploy the contract to a local testnet:

clarinet test

Usage

Deposit Funds

(deposit (amount uint))

Participants deposit STX tokens to the contract.

Withdraw Funds

(withdraw (amount uint))

Withdraws funds if release conditions are met.

Vote for Fund Release

(vote-for-release)

Participants vote for releasing funds.

Add Milestone

(add-milestone (description (string-ascii 256)) (required-votes uint))

Validators add milestones that require participant votes.

Initiate Emergency Recovery

(initiate-emergency)

Participants with sufficient stake can trigger emergency recovery.

Smart Contract Design

Constants

Minimum Lock Period: 10 days (1440 blocks)

Vote Threshold: 75% required for approval

Minimum Deposit: 1 STX (1,000,000 uSTX)

Emergency Threshold: 90% approval required for recovery

Data Structures

Participants: Stores details of each participant (amount, voting power, join time).

Milestones: Tracks fund release milestones and required votes.

Validators: Authorized accounts that manage milestones