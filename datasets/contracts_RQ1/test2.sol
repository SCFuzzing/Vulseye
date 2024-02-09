pragma solidity ^0.8.0;

contract test{
    mapping (address => uint) public userBalance;
    uint v1 = 0;
    uint v2 = 0;


    function invest1(uint _v1,uint _v2) payable public{
        userBalance[msg.sender] = msg.value;
	    v1 = _v1;
        v2 = _v2;

    if (v1 >= 2 && v1 <= 6 && v2 >= 4 && v2 <= 13){
	    v1 = _v1 + _v2;
}
            
    }



    function withdrawBalance(uint _v1,uint _v2) public {
	    v1 = _v1;
        v2 = _v2;
    if (v1 >= 3 && v1 <= 10 && v2 >= 1 && v2 <= 5){
       msg.sender.call{value:1}("");

}
    }
}
//{"283": [{"1": [[3.0, 10.0]], "2": [[1.0, 5.0]]}]}
//{"0": {"distance": 19.0, "precede_target": 1}, "13": {"distance": 18.0, "precede_target": 1}, "52": {"distance": Infinity, "precede_target": 0}, "30": {"distance": 17.0, "precede_target": 1}, "57": {"distance": 28.0, "precede_target": 1}, "41": {"distance": 16.0, "precede_target": 1}, "118": {"distance": 16.0, "precede_target": 1}, "159": {"distance": 15.0, "precede_target": 1}, "1036": {"distance": 0.001, "precede_target": -1}, "65": {"distance": Infinity, "precede_target": 0}, "69": {"distance": 27.0, "precede_target": 1}, "596": {"distance": 26.0, "precede_target": 1}, "91": {"distance": 15.0, "precede_target": 1}, "187": {"distance": 14.0, "precede_target": 1}, "96": {"distance": 13.0, "precede_target": 1}, "759": {"distance": 12.0, "precede_target": 1}, "109": {"distance": Infinity, "precede_target": 0}, "126": {"distance": Infinity, "precede_target": 0}, "130": {"distance": 15.0, "precede_target": 1}, "637": {"distance": 14.0, "precede_target": 1}, "152": {"distance": 5.0, "precede_target": 1}, "211": {"distance": 4.0, "precede_target": 1}, "157": {"distance": 0.001, "precede_target": -1}, "180": {"distance": 17.0, "precede_target": 1}, "393": {"distance": 16.0, "precede_target": 1}, "185": {"distance": Infinity, "precede_target": 0}, "239": {"distance": 4.0, "precede_target": 1}, "247": {"distance": 3.0, "precede_target": 1}, "254": {"distance": 3.0, "precede_target": 1}, "262": {"distance": 2.0, "precede_target": 1}, "269": {"distance": 2.0, "precede_target": 1}, "277": {"distance": 1.0, "precede_target": 1}, "283": {"distance": 0, "precede_target": -1}, "389": {"distance": 0.001, "precede_target": -1}, "738": {"distance": 0.001, "precede_target": -1}, "319": {"distance": 0.001, "precede_target": -1}, "347": {"distance": 0.001, "precede_target": -1}, "380": {"distance": 0.001, "precede_target": -1}, "385": {"distance": 0.001, "precede_target": -1}, "488": {"distance": 16.0, "precede_target": 1}, "496": {"distance": 15.0, "precede_target": 1}, "503": {"distance": 15.0, "precede_target": 1}, "511": {"distance": 14.0, "precede_target": 1}, "518": {"distance": 14.0, "precede_target": 1}, "526": {"distance": 13.0, "precede_target": 1}, "532": {"distance": 12.0, "precede_target": 1}, "550": {"distance": Infinity, "precede_target": 0}, "797": {"distance": 11.0, "precede_target": 1}, "543": {"distance": Infinity, "precede_target": 0}, "554": {"distance": 24.0, "precede_target": 1}, "990": {"distance": 23.0, "precede_target": 1}, "569": {"distance": 17.0, "precede_target": 1}, "628": {"distance": 16.0, "precede_target": 1}, "575": {"distance": 12.0, "precede_target": 1}, "1013": {"distance": 11.0, "precede_target": 1}, "590": {"distance": 7.0, "precede_target": 1}, "670": {"distance": 13.0, "precede_target": 1}, "687": {"distance": 6.0, "precede_target": 1}, "610": {"distance": Infinity, "precede_target": 0}, "614": {"distance": 25.0, "precede_target": 1}, "652": {"distance": Infinity, "precede_target": 0}, "656": {"distance": 13.0, "precede_target": 1}, "697": {"distance": 0.001, "precede_target": -1}, "786": {"distance": 0.001, "precede_target": -1}, "710": {"distance": 0.001, "precede_target": -1}, "749": {"distance": 0.001, "precede_target": -1}, "723": {"distance": 11.0, "precede_target": 1}, "933": {"distance": 10.0, "precede_target": 1}, "732": {"distance": Infinity, "precede_target": 0}, "780": {"distance": Infinity, "precede_target": 0}, "808": {"distance": 11.0, "precede_target": 1}, "819": {"distance": Infinity, "precede_target": 0}, "864": {"distance": Infinity, "precede_target": 0}, "872": {"distance": Infinity, "precede_target": 0}, "943": {"distance": Infinity, "precede_target": 0}, "871": {"distance": Infinity, "precede_target": 0}, "883": {"distance": 22.0, "precede_target": 1}, "901": {"distance": 21.0, "precede_target": 1}, "894": {"distance": 20.0, "precede_target": 1}, "999": {"distance": 19.0, "precede_target": 1}, "1022": {"distance": 9.0, "precede_target": 1}, "1006": {"distance": Infinity, "precede_target": 0}, "1010": {"distance": 18.0, "precede_target": 1}, "1029": {"distance": Infinity, "precede_target": 0}, "1033": {"distance": 8.0, "precede_target": 1}}
