const { ethers } = require("hardhat");

async function main() {
    const CertificateNFT = await ethers.getContractFactory("CertificateNFT");

    // Pass the correct arguments for constructor
    const certificateNFT = await CertificateNFT.deploy("CertificateNFT", "CNFT");

    await certificateNFT.waitForDeployment();

    console.log("🚀 CertificateNFT deployed to:", await certificateNFT.getAddress());
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
