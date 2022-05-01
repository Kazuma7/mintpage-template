import logo from "./logo.svg";
import MintHeader from "./MintHeader";
import "./App.css";
import MintFooter from "./MintFooter";
import { useEffect, useState } from "react";
import { ethers } from "ethers";
import SimpleStorage_abi from "./contracts/SimpleStorage_abi.json";

const App = () => {
  const [account, setAccount] = useState(null);
  const [errorMessage, setErrorMessage] = useState(null);
  const [metaMaskFlag, setMetaMaskFlag] = useState(false);
  const [connButtonText, setConnButtonText] = useState("Connect Wallet");

  const [provider, setProvider] = useState(null);
  const [signer, setSigner] = useState(null);
  const [contract, setContract] = useState(null);

  const [mintNum, setMintNum] = useState(null);

  const contractAddress = "0x60b40bdB9765579FB587036069a3918230eE7C65";
  const tokenPrice = "0.001";

  useEffect(() => {
    const setSaleInfo = async () => {
      //メタマスクと接続することでコントラクトにアクセスできるようになる
      const account = await window.ethereum.request({
        method: "eth_requestAccounts",
      });

      const provider = new ethers.providers.Web3Provider(window.ethereum);
      const signer = provider.getSigner();
      const contract = new ethers.Contract(
        contractAddress,
        SimpleStorage_abi,
        signer
      );

      try {
        const mintNumber = (await contract.getSupply()).toString();
        console.log("mintNumber", mintNumber);
        setMintNum(mintNumber);
      } catch (e) {
        console.log(e);
      }
    };
    setSaleInfo();
  }, []);

  const buy = async () => {
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const account = await provider.send("eth_requestAccounts", []);
    const signer = provider.getSigner();
    const contract = new ethers.Contract(
      contractAddress,
      SimpleStorage_abi,
      signer
    );
    await contract.buy({ value: ethers.utils.parseEther(tokenPrice) });
  };

  return (
    <div className="App">
      <MintHeader />
      <div>{mintNum}</div>

      <button onClick={buy}>mint</button>

      <MintFooter />
    </div>
  );
};

export default App;
