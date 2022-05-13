import { getDappCampWarriors } from "../lib/deploy.helpers";

export async function deployDappCampWarriors() {
  const dappCampWarriorsContract = await getDappCampWarriors({
    contractName: "DappCampWarriors",
    deployParams: [],
  });
  console.log(`DappCampWarriors Contract Address: ${dappCampWarriorsContract.address}`);
}


deployDappCampWarriors()
.then(() => process.exit(0))
.catch((error) => {
    console.error(error);
    process.exit(1);
});