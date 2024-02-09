pragma solidity ^0.8.0;

contract test{
    mapping (address => uint) public userBalance;
    uint v1 = 0;
    uint v2 = 0;
    uint v3 = 0;
    uint v4 = 0;

    function invest1() payable public{
        userBalance[msg.sender] = msg.value;
    }

    function invest2(uint a,uint b,uint c,uint d) payable public{
        userBalance[msg.sender] = msg.value;
	    v1 = a;
        v2 = b;
        v3 = c;
        v4 = d;


    if (v1 >= 5 && v1 <= 12 && v2 >= 4 && v2 <= 14 && v3 >= 3 && v3 <= 8 && v4 >= 16 && v4 <= 24){
       v1 = a + b;

}
            
    }

    function invest3(uint a,uint b,uint c,uint d) payable public{
        userBalance[msg.sender] = msg.value;
        v1 = a;
        v2 = b;
        v3 = c;
        v4 = d;
    if (v1 >= 4 && v1 <= 11 && v2 >= 6 && v2 <= 14 && v3 >= 3 && v3 <= 12 && v4 >= 4 && v4 <= 14){
       v1 = a + b;
       v2 = a + b + c;
       withdrawBalance(a,b,c,d);

}


    }


    function withdrawBalance(uint a,uint b,uint c,uint d) public {
    v1 = a;
    v2 = b;
    v3 = c;
    v4 = d;

    if (v1 >= 3 && v1 <= 10 && v2 >= 1 && v2 <= 5 && v3 >= 2 && v3 <= 15 && v4 >= 10 && v4 <= 20){
       msg.sender.call{value:1}("");

}
    }
}
//{"417": [{"1": [[3.0, 10.0]], "2": [[1.0, 5.0]], "3": [[2.0, 15.0]], "4": [[10.0, 20.0]]}]}
//{"0": {"distance": 21.0, "precede_target": 1}, "13": {"distance": 20.0, "precede_target": 1}, "74": {"distance": Infinity, "precede_target": 0}, "30": {"distance": 19.0, "precede_target": 1}, "79": {"distance": 30.0, "precede_target": 1}, "41": {"distance": 19.0, "precede_target": 1}, "140": {"distance": 18.0, "precede_target": 1}, "52": {"distance": 18.0, "precede_target": 1}, "181": {"distance": Infinity, "precede_target": 0}, "63": {"distance": 18.0, "precede_target": 1}, "191": {"distance": 17.0, "precede_target": 1}, "219": {"distance": 17.0, "precede_target": 1}, "1631": {"distance": 0.001, "precede_target": -1}, "87": {"distance": Infinity, "precede_target": 0}, "91": {"distance": 29.0, "precede_target": 1}, "1152": {"distance": 28.0, "precede_target": 1}, "113": {"distance": 17.0, "precede_target": 1}, "247": {"distance": 16.0, "precede_target": 1}, "118": {"distance": 15.0, "precede_target": 1}, "1354": {"distance": 14.0, "precede_target": 1}, "131": {"distance": Infinity, "precede_target": 0}, "148": {"distance": Infinity, "precede_target": 0}, "152": {"distance": 17.0, "precede_target": 1}, "1193": {"distance": 16.0, "precede_target": 1}, "174": {"distance": 9.0, "precede_target": 1}, "271": {"distance": 8.0, "precede_target": 1}, "179": {"distance": 0.001, "precede_target": -1}, "529": {"distance": Infinity, "precede_target": 0}, "189": {"distance": Infinity, "precede_target": 0}, "212": {"distance": 23.0, "precede_target": 1}, "598": {"distance": 22.0, "precede_target": 1}, "217": {"distance": 0.001, "precede_target": -1}, "240": {"distance": 23.0, "precede_target": 1}, "874": {"distance": 22.0, "precede_target": 1}, "245": {"distance": Infinity, "precede_target": 0}, "313": {"distance": 8.0, "precede_target": 1}, "321": {"distance": 7.0, "precede_target": 1}, "328": {"distance": 7.0, "precede_target": 1}, "336": {"distance": 6.0, "precede_target": 1}, "343": {"distance": 6.0, "precede_target": 1}, "351": {"distance": 5.0, "precede_target": 1}, "358": {"distance": 5.0, "precede_target": 1}, "366": {"distance": 4.0, "precede_target": 1}, "373": {"distance": 4.0, "precede_target": 1}, "381": {"distance": 3.0, "precede_target": 1}, "388": {"distance": 3.0, "precede_target": 1}, "396": {"distance": 2.0, "precede_target": 1}, "403": {"distance": 2.0, "precede_target": 1}, "411": {"distance": 1.0, "precede_target": 1}, "417": {"distance": 0, "precede_target": -1}, "523": {"distance": 0.001, "precede_target": -1}, "1333": {"distance": 0.001, "precede_target": -1}, "453": {"distance": 0.001, "precede_target": -1}, "481": {"distance": 0.001, "precede_target": -1}, "514": {"distance": 0.001, "precede_target": -1}, "519": {"distance": 0.001, "precede_target": -1}, "867": {"distance": 0.001, "precede_target": -1}, "707": {"distance": 22.0, "precede_target": 1}, "715": {"distance": 21.0, "precede_target": 1}, "722": {"distance": 21.0, "precede_target": 1}, "730": {"distance": 20.0, "precede_target": 1}, "737": {"distance": 20.0, "precede_target": 1}, "745": {"distance": 19.0, "precede_target": 1}, "752": {"distance": 19.0, "precede_target": 1}, "759": {"distance": 18.0, "precede_target": 1}, "766": {"distance": 18.0, "precede_target": 1}, "774": {"distance": 17.0, "precede_target": 1}, "781": {"distance": 17.0, "precede_target": 1}, "788": {"distance": 16.0, "precede_target": 1}, "795": {"distance": 16.0, "precede_target": 1}, "803": {"distance": 15.0, "precede_target": 1}, "809": {"distance": 14.0, "precede_target": 1}, "868": {"distance": 0.001, "precede_target": -1}, "1392": {"distance": 13.0, "precede_target": 1}, "820": {"distance": 14.0, "precede_target": 1}, "839": {"distance": 14.0, "precede_target": 1}, "849": {"distance": 9.0, "precede_target": 1}, "983": {"distance": 22.0, "precede_target": 1}, "991": {"distance": 21.0, "precede_target": 1}, "998": {"distance": 21.0, "precede_target": 1}, "1006": {"distance": 20.0, "precede_target": 1}, "1013": {"distance": 20.0, "precede_target": 1}, "1021": {"distance": 19.0, "precede_target": 1}, "1028": {"distance": 19.0, "precede_target": 1}, "1035": {"distance": 18.0, "precede_target": 1}, "1042": {"distance": 18.0, "precede_target": 1}, "1050": {"distance": 17.0, "precede_target": 1}, "1057": {"distance": 17.0, "precede_target": 1}, "1065": {"distance": 16.0, "precede_target": 1}, "1072": {"distance": 16.0, "precede_target": 1}, "1080": {"distance": 15.0, "precede_target": 1}, "1086": {"distance": 14.0, "precede_target": 1}, "1104": {"distance": Infinity, "precede_target": 0}, "1097": {"distance": Infinity, "precede_target": 0}, "1110": {"distance": 26.0, "precede_target": 1}, "1585": {"distance": 25.0, "precede_target": 1}, "1125": {"distance": 19.0, "precede_target": 1}, "1184": {"distance": 18.0, "precede_target": 1}, "1131": {"distance": 14.0, "precede_target": 1}, "1608": {"distance": 13.0, "precede_target": 1}, "1146": {"distance": 11.0, "precede_target": 1}, "1229": {"distance": 15.0, "precede_target": 1}, "1246": {"distance": 15.0, "precede_target": 1}, "1263": {"distance": 15.0, "precede_target": 1}, "1280": {"distance": 10.0, "precede_target": 1}, "1166": {"distance": Infinity, "precede_target": 0}, "1170": {"distance": 27.0, "precede_target": 1}, "1211": {"distance": Infinity, "precede_target": 0}, "1215": {"distance": 15.0, "precede_target": 1}, "1292": {"distance": 0.001, "precede_target": -1}, "1381": {"distance": 0.001, "precede_target": -1}, "1305": {"distance": 0.001, "precede_target": -1}, "1344": {"distance": 0.001, "precede_target": -1}, "1318": {"distance": 13.0, "precede_target": 1}, "1528": {"distance": 12.0, "precede_target": 1}, "1327": {"distance": Infinity, "precede_target": 0}, "1375": {"distance": Infinity, "precede_target": 0}, "1403": {"distance": 13.0, "precede_target": 1}, "1414": {"distance": 11.0, "precede_target": 1}, "1459": {"distance": Infinity, "precede_target": 0}, "1467": {"distance": 10.0, "precede_target": 1}, "1538": {"distance": Infinity, "precede_target": 0}, "1466": {"distance": 11.0, "precede_target": 1}, "1478": {"distance": 24.0, "precede_target": 1}, "1496": {"distance": 23.0, "precede_target": 1}, "1489": {"distance": 22.0, "precede_target": 1}, "1594": {"distance": 21.0, "precede_target": 1}, "1617": {"distance": 13.0, "precede_target": 1}, "1601": {"distance": Infinity, "precede_target": 0}, "1605": {"distance": 20.0, "precede_target": 1}, "1624": {"distance": Infinity, "precede_target": 0}, "1628": {"distance": 12.0, "precede_target": 1}}
