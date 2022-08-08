# Smart Contract for Medium Clone

Solidity Smart Contract to Mint Blog metadata into ERC71 Token to be used with a Medium Clone built with React.  

The project consists of a build and deploy scripts.   

The ERC71 contract makes use of OpenZeppelin contracts and uses hardhat templates and build and deploy capability which utilises npx.  


It also utilises nomiclabs/hardhat-etherscan a Hardhat plugin for integration with Etherscan's contract verification service.  


## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Support](#support)
- [Contributing](#contributing)


## Prerequisites

- [Metamask wallet](https://metamask.io/) to store your tokens and enable web3 transactions.
- [Morallis Account](https://admin.moralis.io/dapps) for dApp Hosting Services.
- [Polygonscan Account](https://polygonscan.com/) to view and interact with the blockchain 
- [MATIC ERC-20tokens](https://faucet.polygon.technology/) on Mumbai Test Network


## Installation

Populate your local .env file with he following variables

```
POLYGON_MUMBAI = 'https://rpc-mumbai.maticvigil.com'
PRIVATE_KEY = <your private metamask wallet key - never share this key!>
API_KEY = <polygonscan key created in the polyscan front end>
```

Prepare the project locally. 

```
npm install
npx hardhat clean
npx hardhat compile
npx hardhat run scripts/deployMedium.js --network mumbai
```
Once the contract is deployed successfully it will return the contract address. You can then verify the returned address as per below.

```
npx hardhat verify <0x ..contract address> --network mumbai  "Medium Blog" "BLOG" 
```

## Usage

Once the contract has been deployed you can interact with the contract via blockchain interface front end such has Polyscan or directly via your application.






Uses:

- nomiclabs/hardhat-etherscan - Hardhat plugin for integration with Etherscan's contract verification service.



Core files:

Main contract:
- contracts/Medium.sol

Deploy script:
- scripts/deployMedium.js

Config:
- hardhat.config.js






## Support

Some additional setup notes were captured in the [NOTES.md](#Notes.md)

## Contributing

This project is for personal educational purposes - feel free to fork.

Please use any private keys with extreame caution. 
