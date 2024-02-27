import { ethers } from "hardhat";

async function main() {
  const MetaWebXAddress = "0x94434C0a47cB2a3E5e1614aB514EC5700aBF1605";

  //Social Media - MetaWebX deployment
  const MetaWebX = await ethers.getContractAt("MetaWebX", MetaWebXAddress);

  const totalNFTbefore = await MetaWebX.totalNFTs();
  console.log({
    "total NFT before Post Creation": ethers.formatUnits(totalNFTbefore, 0),
  });

  const nftTx = await MetaWebX.createNFT(
    "ipfs://bafkreiaraxiidp7dt6pnqvdsnokmdqjhzpi4ik6dhjhm4rlf2wuacobbby"
  );
  await nftTx.wait();

  const nftTx2 = await MetaWebX.createNFT(
    "ipfs://bafkreiezch6456oo3jnn6ho2eamqcwktsyvw4umsrao7ospimzuinzndj4"
  );
  await nftTx2.wait();

  console.log(
    `----------------------------------------------------------------------`
  );

  const totalNFTAfter = await MetaWebX.totalNFTs();
  console.log({
    "total NFT After Post Creation": ethers.formatUnits(totalNFTAfter, 0),
  });
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
