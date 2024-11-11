pragma solidity ^0.8.0;

contract test{
    mapping (address => uint) public userBalance;
    uint v1 = 0;
    uint v2 = 0;
    uint v3 = 0;
    uint v4 = 0;
    uint v5 = 0;

    function invest1() payable public{
        userBalance[msg.sender] = msg.value;
    }

    function invest2(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5) payable public{
        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;

        userBalance[msg.sender] = msg.value;
            if (v1 >= 19 && v1 <= 22 && v2 >= 2 && v2 <= 13 && v3 >= 19 && v3 <= 25 && v4 >= 13 && v4 <= 22 && v5 >= 12 && v5 <= 19){
       invest1();
}
            
    }


        function invest3(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5) payable public{
        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;

        userBalance[msg.sender] = msg.value;
            if (v1 >= 9 && v1 <= 22 && v2 >= 34 && v2 <= 49 && v3 >= 12 && v3 <= 15 && v4 >= 3 && v4 <= 21 && v5 >= 2 && v5 <= 9){
       v1 = _v1 + _v2;
       v2 = _v1 + _v2 + _v3 + _v4;
}
        }

    function invest4(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5) payable public{
        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        userBalance[msg.sender] = msg.value;
            if (v1 >= 4 && v1 <= 11 && v2 >= 4 && v2 <= 9 && v3 >= 12 && v3 <= 15 && v4 >= 3 && v4 <= 20 && v5 >= 5 && v5 <= 15){
       v1 = _v1 + _v2;
       v2 = _v1 + _v2 + _v3;

}


    }

        function invest5(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5) payable public{
        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        userBalance[msg.sender] = msg.value;
            if (v1 >= 4 && v1 <= 11 && v2 >= 4 && v2 <= 9 && v3 >= 12 && v3 <= 15 && v4 >= 3 && v4 <= 20 && v5 >= 5 && v5 <= 15){
       withdrawBalance(_v1,_v2,_v3,_v4,_v5);

}


    }


    function withdrawBalance(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5) public {
	    v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;

    if (v1 >= 3 && v1 <= 10 && v2 >= 1 && v2 <= 5 && v3 >= 2 && v3 <= 15 && v4 >= 10 && v4 <= 20 && v5 >= 14 && v5 <= 23){
       msg.sender.call{value:1}("");

}
    }
}

//{"1228": [{"1": [[3.0, 10.0]], "2": [[1.0, 5.0]], "3": [[2.0, 15.0]], "4": [[10.0, 20.0]], "5": [[14.0, 23.0]], "6": [[19.0, 22.0]]}]}
//{"0": {"distance": 27.0, "precede_target": 1}, "13": {"distance": 26.0, "precede_target": 1}, "112": {"distance": Infinity, "precede_target": 0}, "30": {"distance": 25.0, "precede_target": 1}, "78": {"distance": 25.0, "precede_target": 1}, "41": {"distance": 25.0, "precede_target": 1}, "234": {"distance": 24.0, "precede_target": 1}, "52": {"distance": 24.0, "precede_target": 1}, "275": {"distance": Infinity, "precede_target": 0}, "63": {"distance": 24.0, "precede_target": 1}, "285": {"distance": 23.0, "precede_target": 1}, "74": {"distance": Infinity, "precede_target": 0}, "313": {"distance": 23.0, "precede_target": 1}, "90": {"distance": 24.0, "precede_target": 1}, "117": {"distance": 36.0, "precede_target": 1}, "101": {"distance": 24.0, "precede_target": 1}, "178": {"distance": 23.0, "precede_target": 1}, "206": {"distance": 23.0, "precede_target": 1}, "2631": {"distance": 0.001, "precede_target": -1}, "125": {"distance": Infinity, "precede_target": 0}, "129": {"distance": 35.0, "precede_target": 1}, "2114": {"distance": 34.0, "precede_target": 1}, "151": {"distance": 23.0, "precede_target": 1}, "341": {"distance": 22.0, "precede_target": 1}, "156": {"distance": 21.0, "precede_target": 1}, "2354": {"distance": 20.0, "precede_target": 1}, "169": {"distance": Infinity, "precede_target": 0}, "2155": {"distance": 22.0, "precede_target": 1}, "199": {"distance": Infinity, "precede_target": 0}, "365": {"distance": Infinity, "precede_target": 0}, "204": {"distance": Infinity, "precede_target": 0}, "227": {"distance": 33.0, "precede_target": 1}, "667": {"distance": 32.0, "precede_target": 1}, "232": {"distance": Infinity, "precede_target": 0}, "242": {"distance": Infinity, "precede_target": 0}, "246": {"distance": 23.0, "precede_target": 1}, "268": {"distance": 13.0, "precede_target": 1}, "1008": {"distance": 12.0, "precede_target": 1}, "273": {"distance": 0.001, "precede_target": -1}, "1342": {"distance": Infinity, "precede_target": 0}, "283": {"distance": Infinity, "precede_target": 0}, "306": {"distance": 33.0, "precede_target": 1}, "1411": {"distance": 32.0, "precede_target": 1}, "311": {"distance": Infinity, "precede_target": 0}, "334": {"distance": 26.0, "precede_target": 1}, "1764": {"distance": 25.0, "precede_target": 1}, "339": {"distance": 0.001, "precede_target": -1}, "488": {"distance": Infinity, "precede_target": 0}, "496": {"distance": Infinity, "precede_target": 0}, "503": {"distance": Infinity, "precede_target": 0}, "510": {"distance": Infinity, "precede_target": 0}, "517": {"distance": Infinity, "precede_target": 0}, "525": {"distance": Infinity, "precede_target": 0}, "532": {"distance": Infinity, "precede_target": 0}, "540": {"distance": Infinity, "precede_target": 0}, "547": {"distance": Infinity, "precede_target": 0}, "555": {"distance": Infinity, "precede_target": 0}, "562": {"distance": Infinity, "precede_target": 0}, "570": {"distance": Infinity, "precede_target": 0}, "577": {"distance": Infinity, "precede_target": 0}, "585": {"distance": Infinity, "precede_target": 0}, "592": {"distance": Infinity, "precede_target": 0}, "600": {"distance": Infinity, "precede_target": 0}, "607": {"distance": Infinity, "precede_target": 0}, "615": {"distance": Infinity, "precede_target": 0}, "622": {"distance": Infinity, "precede_target": 0}, "630": {"distance": Infinity, "precede_target": 0}, "637": {"distance": Infinity, "precede_target": 0}, "645": {"distance": Infinity, "precede_target": 0}, "651": {"distance": Infinity, "precede_target": 0}, "659": {"distance": Infinity, "precede_target": 0}, "658": {"distance": Infinity, "precede_target": 0}, "790": {"distance": 32.0, "precede_target": 1}, "798": {"distance": 31.0, "precede_target": 1}, "805": {"distance": 31.0, "precede_target": 1}, "813": {"distance": 30.0, "precede_target": 1}, "820": {"distance": 30.0, "precede_target": 1}, "828": {"distance": 29.0, "precede_target": 1}, "835": {"distance": 29.0, "precede_target": 1}, "843": {"distance": 28.0, "precede_target": 1}, "850": {"distance": 28.0, "precede_target": 1}, "858": {"distance": 27.0, "precede_target": 1}, "865": {"distance": 27.0, "precede_target": 1}, "873": {"distance": 26.0, "precede_target": 1}, "880": {"distance": 26.0, "precede_target": 1}, "888": {"distance": 25.0, "precede_target": 1}, "895": {"distance": 25.0, "precede_target": 1}, "902": {"distance": 24.0, "precede_target": 1}, "909": {"distance": 24.0, "precede_target": 1}, "917": {"distance": 23.0, "precede_target": 1}, "924": {"distance": 23.0, "precede_target": 1}, "932": {"distance": 22.0, "precede_target": 1}, "939": {"distance": 22.0, "precede_target": 1}, "947": {"distance": 21.0, "precede_target": 1}, "953": {"distance": 20.0, "precede_target": 1}, "1000": {"distance": Infinity, "precede_target": 0}, "2392": {"distance": 19.0, "precede_target": 1}, "964": {"distance": 20.0, "precede_target": 1}, "983": {"distance": 20.0, "precede_target": 1}, "993": {"distance": Infinity, "precede_target": 0}, "1064": {"distance": 12.0, "precede_target": 1}, "1072": {"distance": 11.0, "precede_target": 1}, "1079": {"distance": 11.0, "precede_target": 1}, "1087": {"distance": 10.0, "precede_target": 1}, "1094": {"distance": 10.0, "precede_target": 1}, "1102": {"distance": 9.0, "precede_target": 1}, "1109": {"distance": 9.0, "precede_target": 1}, "1117": {"distance": 8.0, "precede_target": 1}, "1124": {"distance": 8.0, "precede_target": 1}, "1132": {"distance": 7.0, "precede_target": 1}, "1139": {"distance": 7.0, "precede_target": 1}, "1147": {"distance": 6.0, "precede_target": 1}, "1154": {"distance": 6.0, "precede_target": 1}, "1162": {"distance": 5.0, "precede_target": 1}, "1169": {"distance": 5.0, "precede_target": 1}, "1177": {"distance": 4.0, "precede_target": 1}, "1184": {"distance": 4.0, "precede_target": 1}, "1192": {"distance": 3.0, "precede_target": 1}, "1199": {"distance": 3.0, "precede_target": 1}, "1207": {"distance": 2.0, "precede_target": 1}, "1214": {"distance": 2.0, "precede_target": 1}, "1222": {"distance": 1.0, "precede_target": 1}, "1228": {"distance": 0, "precede_target": -1}, "1334": {"distance": 0.001, "precede_target": -1}, "2333": {"distance": 0.001, "precede_target": -1}, "1264": {"distance": 0.001, "precede_target": -1}, "1292": {"distance": 0.001, "precede_target": -1}, "1325": {"distance": 0.001, "precede_target": -1}, "1330": {"distance": 0.001, "precede_target": -1}, "2063": {"distance": 0.001, "precede_target": -1}, "1534": {"distance": 32.0, "precede_target": 1}, "1542": {"distance": 31.0, "precede_target": 1}, "1549": {"distance": 31.0, "precede_target": 1}, "1557": {"distance": 30.0, "precede_target": 1}, "1564": {"distance": 30.0, "precede_target": 1}, "1572": {"distance": 29.0, "precede_target": 1}, "1579": {"distance": 29.0, "precede_target": 1}, "1587": {"distance": 28.0, "precede_target": 1}, "1594": {"distance": 28.0, "precede_target": 1}, "1602": {"distance": 27.0, "precede_target": 1}, "1609": {"distance": 27.0, "precede_target": 1}, "1617": {"distance": 26.0, "precede_target": 1}, "1624": {"distance": 26.0, "precede_target": 1}, "1632": {"distance": 25.0, "precede_target": 1}, "1639": {"distance": 25.0, "precede_target": 1}, "1647": {"distance": 24.0, "precede_target": 1}, "1654": {"distance": 24.0, "precede_target": 1}, "1662": {"distance": 23.0, "precede_target": 1}, "1669": {"distance": 23.0, "precede_target": 1}, "1677": {"distance": 22.0, "precede_target": 1}, "1684": {"distance": 22.0, "precede_target": 1}, "1692": {"distance": 21.0, "precede_target": 1}, "1698": {"distance": 20.0, "precede_target": 1}, "1756": {"distance": Infinity, "precede_target": 0}, "1709": {"distance": 20.0, "precede_target": 1}, "1729": {"distance": 20.0, "precede_target": 1}, "1739": {"distance": 20.0, "precede_target": 1}, "1749": {"distance": Infinity, "precede_target": 0}, "1887": {"distance": 25.0, "precede_target": 1}, "1895": {"distance": 24.0, "precede_target": 1}, "1902": {"distance": 24.0, "precede_target": 1}, "1910": {"distance": 23.0, "precede_target": 1}, "1917": {"distance": 23.0, "precede_target": 1}, "1925": {"distance": 22.0, "precede_target": 1}, "1932": {"distance": 22.0, "precede_target": 1}, "1940": {"distance": 21.0, "precede_target": 1}, "1947": {"distance": 21.0, "precede_target": 1}, "1955": {"distance": 20.0, "precede_target": 1}, "1962": {"distance": 20.0, "precede_target": 1}, "1970": {"distance": 19.0, "precede_target": 1}, "1977": {"distance": 19.0, "precede_target": 1}, "1985": {"distance": 18.0, "precede_target": 1}, "1992": {"distance": 18.0, "precede_target": 1}, "1999": {"distance": 17.0, "precede_target": 1}, "2006": {"distance": 17.0, "precede_target": 1}, "2014": {"distance": 16.0, "precede_target": 1}, "2021": {"distance": 16.0, "precede_target": 1}, "2029": {"distance": 15.0, "precede_target": 1}, "2036": {"distance": 15.0, "precede_target": 1}, "2044": {"distance": 14.0, "precede_target": 1}, "2050": {"distance": 13.0, "precede_target": 1}, "2064": {"distance": 0.001, "precede_target": -1}, "2072": {"distance": 32.0, "precede_target": 1}, "2585": {"distance": 31.0, "precede_target": 1}, "2087": {"distance": 25.0, "precede_target": 1}, "2146": {"distance": 24.0, "precede_target": 1}, "2093": {"distance": 20.0, "precede_target": 1}, "2608": {"distance": 19.0, "precede_target": 1}, "2108": {"distance": 15.0, "precede_target": 1}, "2194": {"distance": 21.0, "precede_target": 1}, "2211": {"distance": 21.0, "precede_target": 1}, "2228": {"distance": 21.0, "precede_target": 1}, "2245": {"distance": 21.0, "precede_target": 1}, "2262": {"distance": 21.0, "precede_target": 1}, "2279": {"distance": 14.0, "precede_target": 1}, "2128": {"distance": Infinity, "precede_target": 0}, "2132": {"distance": 33.0, "precede_target": 1}, "2176": {"distance": Infinity, "precede_target": 0}, "2180": {"distance": 21.0, "precede_target": 1}, "2292": {"distance": 0.001, "precede_target": -1}, "2381": {"distance": 0.001, "precede_target": -1}, "2305": {"distance": 0.001, "precede_target": -1}, "2344": {"distance": 0.001, "precede_target": -1}, "2318": {"distance": 19.0, "precede_target": 1}, "2528": {"distance": 18.0, "precede_target": 1}, "2327": {"distance": Infinity, "precede_target": 0}, "2375": {"distance": Infinity, "precede_target": 0}, "2403": {"distance": 19.0, "precede_target": 1}, "2414": {"distance": 22.0, "precede_target": 1}, "2459": {"distance": Infinity, "precede_target": 0}, "2467": {"distance": 21.0, "precede_target": 1}, "2538": {"distance": Infinity, "precede_target": 0}, "2466": {"distance": 22.0, "precede_target": 1}, "2478": {"distance": 30.0, "precede_target": 1}, "2496": {"distance": 29.0, "precede_target": 1}, "2489": {"distance": 28.0, "precede_target": 1}, "2594": {"distance": 27.0, "precede_target": 1}, "2617": {"distance": 17.0, "precede_target": 1}, "2601": {"distance": Infinity, "precede_target": 0}, "2605": {"distance": 26.0, "precede_target": 1}, "2624": {"distance": Infinity, "precede_target": 0}, "2628": {"distance": 16.0, "precede_target": 1}}
