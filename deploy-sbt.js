const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();

  const SBT = await hre.ethers.getContractFactory("SoulboundToken");
  const sbt = await SBT.deploy("UniversityDegree", "UDEG");

  console.log(`Soulbound Token deployed to: ${sbt.target}`);

  // Example Mint
  const recipient = "0x70997970C51812dc3A010C7d01b50e0d17dc79C8";
  await sbt.safeMint(recipient, 1);
  console.log(`Minted token 1 to ${recipient}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
