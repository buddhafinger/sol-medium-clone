
###  Initial setup.

Init hardhat

```
npm i -D hardhat
npx hardhat

✔ What do you want to do? · Create a JavaScript project
✔ Hardhat project root: · /Users/me/projects/shared-poc/poc-web3-medium
✔ Do you want to add a .gitignore? (Y/n) · y
✔ Do you want to install this sample project's dependencies with npm (@nomicfoundation/hardhat-toolbox)? (Y/n) · y
```


###After project files are created. 


- Rename Greeter.sol to Medium.sol
- Updated hardhat.config.js (need to document)
- Create and populate .env
- Created Polyscan API Key.
- Put private from Metamask wallet key into .env
- Obtained public rpc endpoint for mumbai from https://docs.polygon.technology/docs/develop/network-details/network
- npx hardhat clean
- npx hardhat compile
- changed endpoint url to https://rpc-mumbai.maticvigil.com (googled from forum post as documentation was outdated)
- refer to [README.Md](#README.md)




# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
GAS_REPORT=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js




