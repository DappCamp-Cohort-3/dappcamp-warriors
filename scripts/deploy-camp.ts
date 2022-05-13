import { getCamp } from "../lib/deploy.helpers";

export async function deployCamp() {
  const campContract = await getCamp({ contractName: "Camp", deployParams: [] });
  console.log(`Camp Token Address: ${campContract.address}`);

  return campContract;
}

deployCamp()
.then(() => process.exit(0))
.catch((error) => {
    console.error(error);
    process.exit(1);
});
