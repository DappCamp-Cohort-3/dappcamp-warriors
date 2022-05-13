# DappCamp Warriors

## Deploy

With the same helpers we used to deploy in our tests, we can deploy locally, to testnet and to mainnet.

### Deploying to testnet/mainnet

_Make sure you created a .env file with your variables (check .env.example)._

Run the following commands, in the same order (change `ropsten` for the network you wanna deploy to):

```bash
npx hardhat run scripts/deploy-camp.ts --network ropsten
```
