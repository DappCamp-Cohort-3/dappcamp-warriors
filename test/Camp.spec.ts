import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { expect } from "chai";
import { ethers } from "hardhat";
import { getCamp } from "../lib/deploy.helpers";
import { Camp } from "../typechain";

describe("Camp tests", () => {
  let campContract: Camp;
  let deployer: SignerWithAddress;
  let account1: SignerWithAddress;

  /**
   * @dev As you may already know, Solidity doesn't support floating point numbers.
   * An Ether amount can have up to 18 decimals and ERC20 too (by default).
   * 10^18 wei = 1 Ether.
   * 10^18 "Camp Token wei" = 1 Camp Token.
   */
  const oneCampInWei = ethers.utils.parseEther("1");

  beforeEach(async () => {
    campContract = await getCamp({ contractName: "Camp", deployParams: [] });
    [deployer, account1] = await ethers.getSigners();
    
    await campContract.mint(deployer.address, oneCampInWei);
  });

  describe("deploy", () => {
    it("Should check if the deployer is the owner", async () => {
      expect(
        await campContract.connect(account1).owner()
      ).to.eq(deployer.address);
    });
  });

  describe("transfer", () => {
    it("Should transfer tokens from caller to address specified", async () => {
      expect(
        await campContract.transfer(account1.address, oneCampInWei)
      ).to.changeTokenBalance(campContract, account1, oneCampInWei);
    });

    it("Should emit transfer event", async () => {
      expect(
        await campContract.transfer(account1.address, oneCampInWei)
      ).to
      .emit(campContract, "Transfer")
      .withArgs(deployer.address, account1.address, oneCampInWei);
    });

    it("Should revert when called from address with insufficient balance", async () => {
      await expect(
        campContract.connect(account1).transfer(deployer.address, oneCampInWei)
      ).to.be.reverted;
    });
  });
});