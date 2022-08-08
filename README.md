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
-  Exported Private Metamask key
- [Polygonscan Account](https://polygonscan.com/) to view and interact with the blockchain 
- [MATIC ERC-20tokens](https://faucet.polygon.technology/) on Mumbai Test Network


## Installation


Getting started:
- Clone this repo
- Obtain your public Metamask wallet address
- Goto the Polygon [Faucet](https://faucet.polygon.technology/) and use your public wallet address in the faucet to obtain some MATIC on the Mumbai testnet.
- Add the Mumbai Test network to your Metamask Wallet - see network details below.

```
Mumbai Testnet
https://rpc-mumbai.maticvigil.com/
80001
MATIC
https://polygonscan.com

- Sign up to [polyscan.com]9https://polygonscan.com/) and create an API KEY.

Populate your local .env file with he following variables

```
POLYGON_MUMBAI = 'https://rpc-mumbai.maticvigil.com'  
PRIVATE_KEY = <your private metamask wallet key - NEVER share this key or commit to code!>  
API_KEY = <Your Polyscan API KEY>  
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

After verification test interaction with your contract by searching for your unique contract id returned in previous deploy and verify steps.

At this stage you can interact with your contract using web3 on mumbai polyscan by searching for your contract address, selecting the Contract (with green dot) and then view, read or write to the contract.  


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
