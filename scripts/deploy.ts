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

// MetaWebNFT deployed to 0x3BB80889A58951260f4C821733D34e64c955EB53
// ----------------------------------------------------------------------
// MetaWebFactory deployed to 0x14dF34CB7Ddda12c4607f5129Ef9fd6D223E21AA
// ----------------------------------------------------------------------
// MetaWebX deployed to 0x94434C0a47cB2a3E5e1614aB514EC5700aBF1605
