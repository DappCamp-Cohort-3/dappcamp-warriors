import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { expect } from "chai";
import { ethers } from "hardhat";
import { getCamp } from "../lib/deploy.helpers";
import { Camp } from "../typechain";

describe("Camp tests", () => {
  let campContract: Camp;
  let deployer: SignerWithAddress;
  let account1: SignerWithAddress;

  beforeEach(async () => {
    campContract = await getCamp({ contractName: "Camp", deployParams: [] });
    [deployer, account1] = await ethers.getSigners();
  });

  describe("deploy", () => {
    it("Should check if the deployer is the owner", async () => {
      expect(
        await campContract.connect(account1).owner()
      ).to.eq(deployer.address);
    });
  });

  
});