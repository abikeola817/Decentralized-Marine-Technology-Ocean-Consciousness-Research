# Decentralized Marine Technology Ocean Consciousness Research

A blockchain-based platform for validating, recording, and coordinating ocean consciousness research using Clarity smart contracts on the Stacks blockchain.

## Overview

This project creates a decentralized ecosystem for marine technology research focused on ocean consciousness studies. It provides transparent, verifiable, and collaborative tools for researchers, institutions, and conservation organizations.

## Smart Contracts

### 1. Research Institution Verification (`research-institution-verification.clar`)
- **Purpose**: Validates and manages ocean consciousness research institutions
- **Key Functions**:
    - `register-institution`: Register new research institutions
    - `verify-institution`: Verify institutions (owner only)
    - `get-institution`: Retrieve institution details
    - `is-institution-verified`: Check verification status

### 2. Research Protocol (`research-protocol.clar`)
- **Purpose**: Records ocean consciousness research methodologies
- **Key Functions**:
    - `create-protocol`: Create new research protocols
    - `update-protocol-status`: Update protocol status
    - `add-peer-review`: Add peer review to protocols
    - `get-protocol`: Retrieve protocol details

### 3. Data Collection (`data-collection.clar`)
- **Purpose**: Manages ocean consciousness research data
- **Key Functions**:
    - `record-data`: Record new research data
    - `verify-data`: Verify data entries
    - `get-data-entry`: Retrieve data entries
    - `get-protocol-data-count`: Count data entries by protocol

### 4. Communication Framework (`communication-framework.clar`)
- **Purpose**: Facilitates researcher interaction and collaboration
- **Key Functions**:
    - `send-message`: Send messages between researchers
    - `request-collaboration`: Request research collaboration
    - `mark-message-read`: Mark messages as read
    - `get-message`: Retrieve messages

### 5. Conservation Integration (`conservation-integration.clar`)
- **Purpose**: Connects research with ocean protection initiatives
- **Key Functions**:
    - `create-conservation-project`: Create conservation projects
    - `link-research-to-conservation`: Link research to conservation efforts
    - `record-impact`: Record research impact on conservation
    - `fund-project`: Fund conservation projects

## Features

- **Institutional Verification**: Ensures only verified institutions can conduct research
- **Protocol Management**: Standardized research methodology recording
- **Data Integrity**: Verifiable data collection and peer review
- **Collaboration Tools**: Messaging and collaboration request system
- **Conservation Impact**: Direct linking of research to conservation outcomes
- **Transparent Funding**: Trackable funding for conservation projects

## Getting Started

### Prerequisites
- Stacks blockchain node or testnet access
- Clarity CLI tools
- Node.js for testing

### Installation

1. Clone the repository
2. Deploy contracts to Stacks testnet or mainnet
3. Run tests using Vitest

### Usage

1. **Register Institution**: Use `register-institution` to add your research institution
2. **Get Verified**: Wait for contract owner verification
3. **Create Protocol**: Define your research methodology
4. **Collect Data**: Record research findings and observations
5. **Collaborate**: Send messages and request collaborations
6. **Impact Conservation**: Link research to conservation projects

## Testing

Tests are written using Vitest and cover all contract functions:

\`\`\`bash
npm test
\`\`\`

## Contract Deployment

Deploy contracts in the following order:
1. `research-institution-verification.clar`
2. `research-protocol.clar`
3. `data-collection.clar`
4. `communication-framework.clar`
5. `conservation-integration.clar`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Write tests for new functionality
4. Submit a pull request

## License

MIT License - see LICENSE file for details

## Contact

For questions about ocean consciousness research or technical implementation, please open an issue or contact the development team.

## Roadmap

- [ ] Integration with IoT ocean sensors
- [ ] AI-powered data analysis
- [ ] Mobile app for field researchers
- [ ] Integration with existing marine databases
- [ ] Multi-chain deployment support
