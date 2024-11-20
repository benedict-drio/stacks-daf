# Decentralized Autonomous Fund (DAF) Smart Contract

## Overview

The Decentralized Autonomous Fund (DAF) is a smart contract implemented on the Stacks blockchain that enables collective fund management through a decentralized governance system. The contract allows users to deposit STX tokens, create proposals, vote on them, and execute approved funding decisions.

## Features

- **Token Management**

  - Deposit STX tokens with minimum deposit requirements
  - Automatic token minting based on deposits
  - Token burning mechanism for withdrawals
  - Locked deposit periods for fund stability

- **Proposal System**

  - Create funding proposals with customizable parameters
  - Set proposal duration (1-14 days)
  - Include detailed proposal descriptions
  - Specify funding amounts and target recipients

- **Voting Mechanism**

  - Token-weighted voting system
  - One vote per address per proposal
  - Automatic vote tallying
  - Prevention of double voting

- **Execution System**
  - Automated proposal execution after voting period
  - Security checks for proposal validity
  - Automatic fund distribution to approved targets

## Technical Specifications

### Constants

- Minimum deposit: 1,000,000 microSTX
- Lock period: 1,440 blocks (~10 days)
- Minimum proposal duration: 144 blocks (~1 day)
- Maximum proposal duration: 20,160 blocks (~14 days)

### Error Codes

```
u100 - Owner only operation
u101 - Contract not initialized
u102 - Already initialized
u103 - Insufficient balance
u104 - Invalid amount
u105 - Unauthorized operation
u106 - Proposal not found
u107 - Proposal expired
u108 - Already voted
u109 - Below minimum deposit
u110 - Locked period active
u111 - Transfer failed
u112 - Invalid duration
u113 - Zero amount
u114 - Invalid target
u115 - Invalid description
```

## Usage

### Initialization

The contract must be initialized by the contract owner before any operations can be performed:

```clarity
(contract-call? .daf-contract initialize)
```

### Depositing Funds

Users can deposit STX tokens to participate in the fund:

```clarity
(contract-call? .daf-contract deposit amount)
```

Requirements:

- Amount must be ≥ minimum deposit (1,000,000 microSTX)
- Deposits are locked for 1,440 blocks

### Creating Proposals

Token holders can create funding proposals:

```clarity
(contract-call? .daf-contract create-proposal description amount target duration)
```

Parameters:

- `description`: ASCII string (max 256 chars)
- `amount`: Amount in microSTX
- `target`: Recipient principal
- `duration`: Blocks until proposal expires (144-20,160)

Requirements:

- Proposer must hold tokens
- Amount must be > 0
- Target cannot be the contract itself
- Description cannot be empty

### Voting

Token holders can vote on active proposals:

```clarity
(contract-call? .daf-contract vote proposal-id vote-for)
```

Requirements:

- Voter must hold tokens
- Proposal must not be expired
- One vote per address per proposal
- Voting power is proportional to token balance

### Executing Proposals

Approved proposals can be executed after the voting period:

```clarity
(contract-call? .daf-contract execute-proposal proposal-id)
```

Requirements:

- Proposal must be expired
- More YES votes than NO votes
- Proposal not already executed

## Query Functions

### Get Balance

```clarity
(contract-call? .daf-contract get-balance account)
```

### Get Total Supply

```clarity
(contract-call? .daf-contract get-total-supply)
```

### Get Proposal Details

```clarity
(contract-call? .daf-contract get-proposal proposal-id)
```

### Get Deposit Information

```clarity
(contract-call? .daf-contract get-deposit-info account)
```

## Security Considerations

1. **Lock Period**

   - Deposits are locked for ~10 days to prevent market manipulation
   - Prevents immediate withdrawal after voting

2. **Proposal Safeguards**

   - Minimum and maximum duration limits
   - Prevention of self-targeting
   - Required token holding for proposal creation

3. **Voting Protection**

   - Single vote per address per proposal
   - Token-weighted voting power
   - Automatic expiration enforcement

4. **Execution Safety**
   - Mandatory voting period completion
   - Majority vote requirement
   - Single execution prevention

## Development and Testing

To interact with this contract, ensure you have:

1. A Stacks blockchain development environment
2. Clarity CLI tools installed
3. Access to STX tokens for testing

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

We welcome contributions to DAF Smart Contract! Please see our [Guide](CONTRIBUTING.md) for details on how to get started.
