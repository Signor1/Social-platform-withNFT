import { ethers } from "hardhat";

async function main() {
  //NFT contract deployment
  const MetaWebNFT = await ethers.deployContract("MetaWebNFT");
  await MetaWebNFT.waitForDeployment();

  //Factory contract deployment
  const MetaWebFactory = await ethers.deployContract("MetaWebFactory", [
    MetaWebNFT.target,
  ]);
  await MetaWebFactory.waitForDeployment();

  //Social Media - MetaWebX deployment
  const MetaWebX = await ethers.deployContract("MetaWebX", [
    MetaWebFactory.target,
  ]);
  await MetaWebX.waitForDeployment();

  console.log(`MetaWebNFT deployed to ${MetaWebNFT.target}`);

  console.log(
    `----------------------------------------------------------------------`
  );

  console.log(`MetaWebFactory deployed to ${MetaWebFactory.target}`);

  console.log(
    `----------------------------------------------------------------------`
  );

  console.log(`MetaWebX deployed to ${MetaWebX.target}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
