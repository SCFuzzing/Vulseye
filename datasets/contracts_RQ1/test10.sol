pragma solidity ^0.8.0;

contract test{
    mapping (address => uint) public userBalance;
    uint v1 = 0;
    uint v2 = 0;
    uint v3 = 0;
    uint v4 = 0;
    uint v5 = 0;
    uint v6 = 0;
    uint v7 = 0;
    uint v8 = 0;
    uint v9 = 0;
    uint v10 = 0;

    function invest1() payable public{
        userBalance[msg.sender] = msg.value;
    }

    function invest2(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5, uint _v6, uint _v7, uint _v8, uint _v9, uint _v10) payable public{
        userBalance[msg.sender] = msg.value;
	    v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;
        v7 = _v7;
        v8 = _v8;
        v9 = _v9;
        v10 = _v10;

    if (v1 >= 3 && v1 <= 14 && v2 >= 112 && v2 <= 142 && v3 >= 13 && v3 <= 25 && v4 >= 36 && v4 <= 41 && v5 >= 24 && v5 <= 41 && v6 >= 27 && v6 <= 34 && v7 >= 12 && v7 <= 25 && v8 >= 76 && v8 <= 116 && v9 >= 15 && v9 <= 44 && v10 >= 25 && v10 <= 79){
       v1 = _v1 + _v2;
        invest1();

}
            
    }


        function invest3(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5, uint _v6, uint _v7, uint _v8, uint _v9, uint _v10) payable public{
        userBalance[msg.sender] = msg.value;
	    v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;
        v7 = _v7;
        v8 = _v8;
        v9 = _v9;
        v10 = _v10;

    if (v1 >= 23 && v1 <= 34 && v2 >= 18 && v2 <= 52 && v3 >= 33 && v3 <= 45 && v4 >= 16 && v4 <= 41 && v5 >= 14 && v5 <= 31 && v6 >= 27 && v6 <= 34 && v7 >= 11 && v7 <= 25 && v8 >= 76 && v8 <= 136 && v9 >= 15 && v9 <= 44 && v10 >= 15 && v10 <= 29){
       v1 = _v1 + _v2;
        v2 = _v1 + _v2 + _v3 + _v3;

}
        }



                function invest4(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5, uint _v6, uint _v7, uint _v8, uint _v9, uint _v10) payable public{
        userBalance[msg.sender] = msg.value;
	    v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;
        v7 = _v7;
        v8 = _v8;
        v9 = _v9;
        v10 = _v10;

    if (v1 >= 13 && v1 <= 34 && v2 >= 28 && v2 <= 52 && v3 >= 35 && v3 <= 45 && v4 >= 15 && v4 <= 45 && v5 >= 19 && v5 <= 33 && v6 >= 17 && v6 <= 39 && v7 >= 14 && v7 <= 25 && v8 >= 24 && v8 <= 136 && v9 >= 25 && v9 <= 44 && v10 >= 15 && v10 <= 29){
       v1 = _v1 + _v2;
        v2 = _v1 + _v2 + _v3;

}
        }

    function invest5(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5, uint _v6, uint _v7, uint _v8, uint _v9, uint _v10) payable public{
        userBalance[msg.sender] = msg.value;
	    v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;
        v7 = _v7;
        v8 = _v8;
        v9 = _v9;
        v10 = _v10;

    if (v1 >= 23 && v1 <= 34 && v2 >= 18 && v2 <= 25 && v3 >= 35 && v3 <= 45 && v4 >= 15 && v4 <= 55 && v5 >= 19 && v5 <= 33 && v6 >= 37 && v6 <= 49 && v7 >= 16 && v7 <= 20 && v8 >= 34 && v8 <= 56 && v9 >= 15 && v9 <= 22 && v10 >= 15 && v10 <= 29){
       v1 = _v1 + _v2;
        v2 = _v1 + _v2 + _v3;

}


    }


        function invest6(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5, uint _v6, uint _v7, uint _v8, uint _v9, uint _v10) payable public{
        userBalance[msg.sender] = msg.value;
	    v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;
        v7 = _v7;
        v8 = _v8;
        v9 = _v9;
        v10 = _v10;

    if (v1 >= 25 && v1 <= 34 && v2 >= 8 && v2 <= 15 && v3 >= 15 && v3 <= 25 && v4 >= 45 && v4 <= 55 && v5 >= 39 && v5 <= 53 && v6 >= 27 && v6 <= 39 && v7 >= 16 && v7 <= 20 && v8 >= 34 && v8 <= 56 && v9 >= 5 && v9 <= 12 && v10 >= 15 && v10 <= 29){
       v1 = _v1 + _v2;
        v2 = _v1 + _v2 + _v3;

}


    }


    function invest7(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5, uint _v6, uint _v7, uint _v8, uint _v9, uint _v10) payable public{
        userBalance[msg.sender] = msg.value;
	    v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;
        v7 = _v7;
        v8 = _v8;
        v9 = _v9;
        v10 = _v10;

    if (v1 >= 25 && v1 <= 44 && v2 >= 8 && v2 <= 35 && v3 >= 15 && v3 <= 25 && v4 >= 45 && v4 <= 75 && v5 >= 19 && v5 <= 33 && v6 >= 17 && v6 <= 19 && v7 >= 26 && v7 <= 52 && v8 >= 34 && v8 <= 56 && v9 >= 5 && v9 <= 22 && v10 >= 36 && v10 <= 83){
       v1 = _v1 + _v2;
        v2 = _v1 + _v2 + _v3;

}


    }

        function invest8(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5, uint _v6, uint _v7, uint _v8, uint _v9, uint _v10) payable public{
        userBalance[msg.sender] = msg.value;
	    v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;
        v7 = _v7;
        v8 = _v8;
        v9 = _v9;
        v10 = _v10;

    if (v1 >= 9 && v1 <= 17 && v2 >= 8 && v2 <= 15 && v3 >= 15 && v3 <= 25 && v4 >= 25 && v4 <= 45 && v5 >= 19 && v5 <= 23 && v6 >= 7 && v6 <= 9 && v7 >= 26 && v7 <= 52 && v8 >= 14 && v8 <= 16 && v9 >= 45 && v9 <= 68 && v10 >= 26 && v10 <= 83){
       v1 = _v1 + _v2;
        v2 = _v1 + _v2 + _v3;

}


    }

            function invest9(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5, uint _v6, uint _v7, uint _v8, uint _v9, uint _v10) payable public{
        userBalance[msg.sender] = msg.value;
	    v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;
        v7 = _v7;
        v8 = _v8;
        v9 = _v9;
        v10 = _v10;

    if (v1 >= 23 && v1 <= 27 && v2 >= 12 && v2 <= 15 && v3 >= 22 && v3 <= 25 && v4 >= 5 && v4 <= 15 && v5 >= 14 && v5 <= 23 && v6 >= 7 && v6 <= 17 && v7 >= 3 && v7 <= 12 && v8 >= 14 && v8 <= 16 && v9 >= 25 && v9 <= 35 && v10 >= 6 && v10 <= 23){
       withdrawBalance(_v1,_v2,_v3,_v4,_v5,_v6,_v7,_v8,_v9,_v10);

}


    }


    function withdrawBalance(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5, uint _v6, uint _v7, uint _v8, uint _v9, uint _v10) public {
	    v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;
        v7 = _v7;
        v8 = _v8;
        v9 = _v9;
        v10 = _v10;

    if (v1 >= 3 && v1 <= 10 && v2 >= 1 && v2 <= 5 && v3 >= 2 && v3 <= 15 && v4 >= 10 && v4 <= 20 && v5 >= 14 && v5 <= 23 && v6 >= 19 && v6 <= 22 && v7 >= 8 && v7 <= 12 && v8 >= 10 && v8 <= 15 && v9 >= 5 && v9 <= 15 && v10 >= 6 && v10 <= 20){
       msg.sender.call{value:1}("");

}
    }
}

//{"1827": [{"1": [[3.0, 10.0]], "2": [[1.0, 5.0]], "3": [[2.0, 15.0]], "4": [[10.0, 20.0]], "5": [[14.0, 23.0]], "6": [[19.0, 22.0]], "7": [[8.0, 12.0]], "8": [[10.0, 15.0]], "9": [[5.0, 15.0]], "10": [[6.0, 20.0]]}]}
//{"0": {"distance": 34.0, "precede_target": 1}, "13": {"distance": 33.0, "precede_target": 1}, "156": {"distance": Infinity, "precede_target": 0}, "30": {"distance": 32.0, "precede_target": 1}, "100": {"distance": 33.0, "precede_target": 1}, "41": {"distance": 32.0, "precede_target": 1}, "347": {"distance": 31.0, "precede_target": 1}, "52": {"distance": 32.0, "precede_target": 1}, "375": {"distance": 31.0, "precede_target": 1}, "63": {"distance": 32.0, "precede_target": 1}, "403": {"distance": 31.0, "precede_target": 1}, "74": {"distance": 33.0, "precede_target": 1}, "431": {"distance": 31.0, "precede_target": 1}, "85": {"distance": 32.0, "precede_target": 1}, "459": {"distance": Infinity, "precede_target": 0}, "96": {"distance": Infinity, "precede_target": 0}, "469": {"distance": 31.0, "precede_target": 1}, "112": {"distance": 32.0, "precede_target": 1}, "161": {"distance": 44.0, "precede_target": 1}, "123": {"distance": 32.0, "precede_target": 1}, "222": {"distance": 31.0, "precede_target": 1}, "134": {"distance": 33.0, "precede_target": 1}, "250": {"distance": 31.0, "precede_target": 1}, "145": {"distance": 32.0, "precede_target": 1}, "278": {"distance": 32.0, "precede_target": 1}, "319": {"distance": 31.0, "precede_target": 1}, "5630": {"distance": 0.001, "precede_target": -1}, "169": {"distance": Infinity, "precede_target": 0}, "173": {"distance": 43.0, "precede_target": 1}, "5031": {"distance": 42.0, "precede_target": 1}, "195": {"distance": 31.0, "precede_target": 1}, "497": {"distance": 30.0, "precede_target": 1}, "200": {"distance": 29.0, "precede_target": 1}, "5353": {"distance": 28.0, "precede_target": 1}, "213": {"distance": Infinity, "precede_target": 0}, "5072": {"distance": 30.0, "precede_target": 1}, "243": {"distance": 42.0, "precede_target": 1}, "521": {"distance": 41.0, "precede_target": 1}, "248": {"distance": 0.001, "precede_target": -1}, "271": {"distance": 49.0, "precede_target": 1}, "986": {"distance": 48.0, "precede_target": 1}, "276": {"distance": Infinity, "precede_target": 0}, "286": {"distance": Infinity, "precede_target": 0}, "290": {"distance": 31.0, "precede_target": 1}, "312": {"distance": 21.0, "precede_target": 1}, "1459": {"distance": 20.0, "precede_target": 1}, "317": {"distance": 0.001, "precede_target": -1}, "340": {"distance": 49.0, "precede_target": 1}, "1945": {"distance": 48.0, "precede_target": 1}, "345": {"distance": Infinity, "precede_target": 0}, "368": {"distance": 49.0, "precede_target": 1}, "2439": {"distance": 48.0, "precede_target": 1}, "373": {"distance": Infinity, "precede_target": 0}, "396": {"distance": 49.0, "precede_target": 1}, "2933": {"distance": 48.0, "precede_target": 1}, "401": {"distance": Infinity, "precede_target": 0}, "424": {"distance": 49.0, "precede_target": 1}, "3427": {"distance": 48.0, "precede_target": 1}, "429": {"distance": Infinity, "precede_target": 0}, "452": {"distance": 49.0, "precede_target": 1}, "3932": {"distance": 48.0, "precede_target": 1}, "457": {"distance": Infinity, "precede_target": 0}, "4426": {"distance": Infinity, "precede_target": 0}, "467": {"distance": Infinity, "precede_target": 0}, "490": {"distance": 49.0, "precede_target": 1}, "4495": {"distance": 48.0, "precede_target": 1}, "495": {"distance": Infinity, "precede_target": 0}, "672": {"distance": 41.0, "precede_target": 1}, "680": {"distance": 40.0, "precede_target": 1}, "687": {"distance": 40.0, "precede_target": 1}, "695": {"distance": 39.0, "precede_target": 1}, "702": {"distance": 39.0, "precede_target": 1}, "710": {"distance": 38.0, "precede_target": 1}, "717": {"distance": 38.0, "precede_target": 1}, "725": {"distance": 37.0, "precede_target": 1}, "732": {"distance": 37.0, "precede_target": 1}, "740": {"distance": 36.0, "precede_target": 1}, "747": {"distance": 36.0, "precede_target": 1}, "755": {"distance": 35.0, "precede_target": 1}, "762": {"distance": 35.0, "precede_target": 1}, "770": {"distance": 34.0, "precede_target": 1}, "777": {"distance": 34.0, "precede_target": 1}, "785": {"distance": 33.0, "precede_target": 1}, "792": {"distance": 33.0, "precede_target": 1}, "800": {"distance": 32.0, "precede_target": 1}, "807": {"distance": 32.0, "precede_target": 1}, "815": {"distance": 31.0, "precede_target": 1}, "822": {"distance": 31.0, "precede_target": 1}, "830": {"distance": 30.0, "precede_target": 1}, "837": {"distance": 30.0, "precede_target": 1}, "845": {"distance": 29.0, "precede_target": 1}, "852": {"distance": 29.0, "precede_target": 1}, "860": {"distance": 28.0, "precede_target": 1}, "867": {"distance": 28.0, "precede_target": 1}, "875": {"distance": 27.0, "precede_target": 1}, "882": {"distance": 27.0, "precede_target": 1}, "890": {"distance": 26.0, "precede_target": 1}, "897": {"distance": 26.0, "precede_target": 1}, "905": {"distance": 25.0, "precede_target": 1}, "912": {"distance": 25.0, "precede_target": 1}, "920": {"distance": 24.0, "precede_target": 1}, "927": {"distance": 24.0, "precede_target": 1}, "935": {"distance": 23.0, "precede_target": 1}, "942": {"distance": 23.0, "precede_target": 1}, "950": {"distance": 22.0, "precede_target": 1}, "956": {"distance": 21.0, "precede_target": 1}, "974": {"distance": 0.001, "precede_target": -1}, "973": {"distance": 0.001, "precede_target": -1}, "1137": {"distance": 48.0, "precede_target": 1}, "1145": {"distance": 47.0, "precede_target": 1}, "1152": {"distance": 47.0, "precede_target": 1}, "1160": {"distance": 46.0, "precede_target": 1}, "1167": {"distance": 46.0, "precede_target": 1}, "1175": {"distance": 45.0, "precede_target": 1}, "1182": {"distance": 45.0, "precede_target": 1}, "1190": {"distance": 44.0, "precede_target": 1}, "1197": {"distance": 44.0, "precede_target": 1}, "1205": {"distance": 43.0, "precede_target": 1}, "1212": {"distance": 43.0, "precede_target": 1}, "1220": {"distance": 42.0, "precede_target": 1}, "1227": {"distance": 42.0, "precede_target": 1}, "1235": {"distance": 41.0, "precede_target": 1}, "1242": {"distance": 41.0, "precede_target": 1}, "1250": {"distance": 40.0, "precede_target": 1}, "1257": {"distance": 40.0, "precede_target": 1}, "1265": {"distance": 39.0, "precede_target": 1}, "1272": {"distance": 39.0, "precede_target": 1}, "1280": {"distance": 38.0, "precede_target": 1}, "1287": {"distance": 38.0, "precede_target": 1}, "1295": {"distance": 37.0, "precede_target": 1}, "1302": {"distance": 37.0, "precede_target": 1}, "1310": {"distance": 36.0, "precede_target": 1}, "1317": {"distance": 36.0, "precede_target": 1}, "1325": {"distance": 35.0, "precede_target": 1}, "1332": {"distance": 35.0, "precede_target": 1}, "1340": {"distance": 34.0, "precede_target": 1}, "1347": {"distance": 34.0, "precede_target": 1}, "1355": {"distance": 33.0, "precede_target": 1}, "1362": {"distance": 33.0, "precede_target": 1}, "1370": {"distance": 32.0, "precede_target": 1}, "1377": {"distance": 32.0, "precede_target": 1}, "1385": {"distance": 31.0, "precede_target": 1}, "1392": {"distance": 31.0, "precede_target": 1}, "1400": {"distance": 30.0, "precede_target": 1}, "1407": {"distance": 30.0, "precede_target": 1}, "1415": {"distance": 29.0, "precede_target": 1}, "1421": {"distance": 28.0, "precede_target": 1}, "1447": {"distance": Infinity, "precede_target": 0}, "5391": {"distance": 27.0, "precede_target": 1}, "1432": {"distance": Infinity, "precede_target": 0}, "1446": {"distance": Infinity, "precede_target": 0}, "1543": {"distance": 20.0, "precede_target": 1}, "1551": {"distance": 19.0, "precede_target": 1}, "1558": {"distance": 19.0, "precede_target": 1}, "1566": {"distance": 18.0, "precede_target": 1}, "1573": {"distance": 18.0, "precede_target": 1}, "1581": {"distance": 17.0, "precede_target": 1}, "1588": {"distance": 17.0, "precede_target": 1}, "1596": {"distance": 16.0, "precede_target": 1}, "1603": {"distance": 16.0, "precede_target": 1}, "1611": {"distance": 15.0, "precede_target": 1}, "1618": {"distance": 15.0, "precede_target": 1}, "1626": {"distance": 14.0, "precede_target": 1}, "1633": {"distance": 14.0, "precede_target": 1}, "1641": {"distance": 13.0, "precede_target": 1}, "1648": {"distance": 13.0, "precede_target": 1}, "1656": {"distance": 12.0, "precede_target": 1}, "1663": {"distance": 12.0, "precede_target": 1}, "1671": {"distance": 11.0, "precede_target": 1}, "1678": {"distance": 11.0, "precede_target": 1}, "1686": {"distance": 10.0, "precede_target": 1}, "1693": {"distance": 10.0, "precede_target": 1}, "1701": {"distance": 9.0, "precede_target": 1}, "1708": {"distance": 9.0, "precede_target": 1}, "1716": {"distance": 8.0, "precede_target": 1}, "1723": {"distance": 8.0, "precede_target": 1}, "1731": {"distance": 7.0, "precede_target": 1}, "1738": {"distance": 7.0, "precede_target": 1}, "1746": {"distance": 6.0, "precede_target": 1}, "1753": {"distance": 6.0, "precede_target": 1}, "1761": {"distance": 5.0, "precede_target": 1}, "1768": {"distance": 5.0, "precede_target": 1}, "1776": {"distance": 4.0, "precede_target": 1}, "1783": {"distance": 4.0, "precede_target": 1}, "1791": {"distance": 3.0, "precede_target": 1}, "1798": {"distance": 3.0, "precede_target": 1}, "1806": {"distance": 2.0, "precede_target": 1}, "1813": {"distance": 2.0, "precede_target": 1}, "1821": {"distance": 1.0, "precede_target": 1}, "1827": {"distance": 0, "precede_target": -1}, "1933": {"distance": 0.001, "precede_target": -1}, "5332": {"distance": 0.001, "precede_target": -1}, "1863": {"distance": 0.001, "precede_target": -1}, "1891": {"distance": 0.001, "precede_target": -1}, "1924": {"distance": 0.001, "precede_target": -1}, "1929": {"distance": 0.001, "precede_target": -1}, "2096": {"distance": 48.0, "precede_target": 1}, "2104": {"distance": 47.0, "precede_target": 1}, "2111": {"distance": 47.0, "precede_target": 1}, "2119": {"distance": 46.0, "precede_target": 1}, "2126": {"distance": 46.0, "precede_target": 1}, "2134": {"distance": 45.0, "precede_target": 1}, "2141": {"distance": 45.0, "precede_target": 1}, "2149": {"distance": 44.0, "precede_target": 1}, "2156": {"distance": 44.0, "precede_target": 1}, "2164": {"distance": 43.0, "precede_target": 1}, "2171": {"distance": 43.0, "precede_target": 1}, "2179": {"distance": 42.0, "precede_target": 1}, "2186": {"distance": 42.0, "precede_target": 1}, "2194": {"distance": 41.0, "precede_target": 1}, "2201": {"distance": 41.0, "precede_target": 1}, "2209": {"distance": 40.0, "precede_target": 1}, "2216": {"distance": 40.0, "precede_target": 1}, "2224": {"distance": 39.0, "precede_target": 1}, "2231": {"distance": 39.0, "precede_target": 1}, "2239": {"distance": 38.0, "precede_target": 1}, "2246": {"distance": 38.0, "precede_target": 1}, "2254": {"distance": 37.0, "precede_target": 1}, "2261": {"distance": 37.0, "precede_target": 1}, "2269": {"distance": 36.0, "precede_target": 1}, "2276": {"distance": 36.0, "precede_target": 1}, "2284": {"distance": 35.0, "precede_target": 1}, "2291": {"distance": 35.0, "precede_target": 1}, "2299": {"distance": 34.0, "precede_target": 1}, "2306": {"distance": 34.0, "precede_target": 1}, "2314": {"distance": 33.0, "precede_target": 1}, "2321": {"distance": 33.0, "precede_target": 1}, "2329": {"distance": 32.0, "precede_target": 1}, "2336": {"distance": 32.0, "precede_target": 1}, "2344": {"distance": 31.0, "precede_target": 1}, "2351": {"distance": 31.0, "precede_target": 1}, "2359": {"distance": 30.0, "precede_target": 1}, "2366": {"distance": 30.0, "precede_target": 1}, "2374": {"distance": 29.0, "precede_target": 1}, "2380": {"distance": 28.0, "precede_target": 1}, "2427": {"distance": Infinity, "precede_target": 0}, "2391": {"distance": 28.0, "precede_target": 1}, "2410": {"distance": 28.0, "precede_target": 1}, "2420": {"distance": Infinity, "precede_target": 0}, "2590": {"distance": 48.0, "precede_target": 1}, "2598": {"distance": 47.0, "precede_target": 1}, "2605": {"distance": 47.0, "precede_target": 1}, "2613": {"distance": 46.0, "precede_target": 1}, "2620": {"distance": 46.0, "precede_target": 1}, "2628": {"distance": 45.0, "precede_target": 1}, "2635": {"distance": 45.0, "precede_target": 1}, "2643": {"distance": 44.0, "precede_target": 1}, "2650": {"distance": 44.0, "precede_target": 1}, "2658": {"distance": 43.0, "precede_target": 1}, "2665": {"distance": 43.0, "precede_target": 1}, "2673": {"distance": 42.0, "precede_target": 1}, "2680": {"distance": 42.0, "precede_target": 1}, "2688": {"distance": 41.0, "precede_target": 1}, "2695": {"distance": 41.0, "precede_target": 1}, "2703": {"distance": 40.0, "precede_target": 1}, "2710": {"distance": 40.0, "precede_target": 1}, "2718": {"distance": 39.0, "precede_target": 1}, "2725": {"distance": 39.0, "precede_target": 1}, "2733": {"distance": 38.0, "precede_target": 1}, "2740": {"distance": 38.0, "precede_target": 1}, "2748": {"distance": 37.0, "precede_target": 1}, "2755": {"distance": 37.0, "precede_target": 1}, "2763": {"distance": 36.0, "precede_target": 1}, "2770": {"distance": 36.0, "precede_target": 1}, "2778": {"distance": 35.0, "precede_target": 1}, "2785": {"distance": 35.0, "precede_target": 1}, "2793": {"distance": 34.0, "precede_target": 1}, "2800": {"distance": 34.0, "precede_target": 1}, "2808": {"distance": 33.0, "precede_target": 1}, "2815": {"distance": 33.0, "precede_target": 1}, "2823": {"distance": 32.0, "precede_target": 1}, "2830": {"distance": 32.0, "precede_target": 1}, "2838": {"distance": 31.0, "precede_target": 1}, "2845": {"distance": 31.0, "precede_target": 1}, "2853": {"distance": 30.0, "precede_target": 1}, "2860": {"distance": 30.0, "precede_target": 1}, "2868": {"distance": 29.0, "precede_target": 1}, "2874": {"distance": 28.0, "precede_target": 1}, "2921": {"distance": Infinity, "precede_target": 0}, "2885": {"distance": 28.0, "precede_target": 1}, "2904": {"distance": 28.0, "precede_target": 1}, "2914": {"distance": Infinity, "precede_target": 0}, "3084": {"distance": 48.0, "precede_target": 1}, "3092": {"distance": 47.0, "precede_target": 1}, "3099": {"distance": 47.0, "precede_target": 1}, "3107": {"distance": 46.0, "precede_target": 1}, "3114": {"distance": 46.0, "precede_target": 1}, "3122": {"distance": 45.0, "precede_target": 1}, "3129": {"distance": 45.0, "precede_target": 1}, "3137": {"distance": 44.0, "precede_target": 1}, "3144": {"distance": 44.0, "precede_target": 1}, "3152": {"distance": 43.0, "precede_target": 1}, "3159": {"distance": 43.0, "precede_target": 1}, "3167": {"distance": 42.0, "precede_target": 1}, "3174": {"distance": 42.0, "precede_target": 1}, "3182": {"distance": 41.0, "precede_target": 1}, "3189": {"distance": 41.0, "precede_target": 1}, "3197": {"distance": 40.0, "precede_target": 1}, "3204": {"distance": 40.0, "precede_target": 1}, "3212": {"distance": 39.0, "precede_target": 1}, "3219": {"distance": 39.0, "precede_target": 1}, "3227": {"distance": 38.0, "precede_target": 1}, "3234": {"distance": 38.0, "precede_target": 1}, "3242": {"distance": 37.0, "precede_target": 1}, "3249": {"distance": 37.0, "precede_target": 1}, "3257": {"distance": 36.0, "precede_target": 1}, "3264": {"distance": 36.0, "precede_target": 1}, "3272": {"distance": 35.0, "precede_target": 1}, "3279": {"distance": 35.0, "precede_target": 1}, "3287": {"distance": 34.0, "precede_target": 1}, "3294": {"distance": 34.0, "precede_target": 1}, "3302": {"distance": 33.0, "precede_target": 1}, "3309": {"distance": 33.0, "precede_target": 1}, "3317": {"distance": 32.0, "precede_target": 1}, "3324": {"distance": 32.0, "precede_target": 1}, "3332": {"distance": 31.0, "precede_target": 1}, "3339": {"distance": 31.0, "precede_target": 1}, "3347": {"distance": 30.0, "precede_target": 1}, "3354": {"distance": 30.0, "precede_target": 1}, "3362": {"distance": 29.0, "precede_target": 1}, "3368": {"distance": 28.0, "precede_target": 1}, "3415": {"distance": Infinity, "precede_target": 0}, "3379": {"distance": 28.0, "precede_target": 1}, "3398": {"distance": 28.0, "precede_target": 1}, "3408": {"distance": Infinity, "precede_target": 0}, "3578": {"distance": 48.0, "precede_target": 1}, "3586": {"distance": 47.0, "precede_target": 1}, "3593": {"distance": 47.0, "precede_target": 1}, "3601": {"distance": 46.0, "precede_target": 1}, "3608": {"distance": 46.0, "precede_target": 1}, "3616": {"distance": 45.0, "precede_target": 1}, "3623": {"distance": 45.0, "precede_target": 1}, "3631": {"distance": 44.0, "precede_target": 1}, "3638": {"distance": 44.0, "precede_target": 1}, "3646": {"distance": 43.0, "precede_target": 1}, "3653": {"distance": 43.0, "precede_target": 1}, "3661": {"distance": 42.0, "precede_target": 1}, "3668": {"distance": 42.0, "precede_target": 1}, "3676": {"distance": 41.0, "precede_target": 1}, "3683": {"distance": 41.0, "precede_target": 1}, "3691": {"distance": 40.0, "precede_target": 1}, "3698": {"distance": 40.0, "precede_target": 1}, "3706": {"distance": 39.0, "precede_target": 1}, "3713": {"distance": 39.0, "precede_target": 1}, "3721": {"distance": 38.0, "precede_target": 1}, "3728": {"distance": 38.0, "precede_target": 1}, "3736": {"distance": 37.0, "precede_target": 1}, "3743": {"distance": 37.0, "precede_target": 1}, "3751": {"distance": 36.0, "precede_target": 1}, "3758": {"distance": 36.0, "precede_target": 1}, "3766": {"distance": 35.0, "precede_target": 1}, "3773": {"distance": 35.0, "precede_target": 1}, "3781": {"distance": 34.0, "precede_target": 1}, "3788": {"distance": 34.0, "precede_target": 1}, "3796": {"distance": 33.0, "precede_target": 1}, "3803": {"distance": 33.0, "precede_target": 1}, "3811": {"distance": 32.0, "precede_target": 1}, "3818": {"distance": 32.0, "precede_target": 1}, "3826": {"distance": 31.0, "precede_target": 1}, "3833": {"distance": 31.0, "precede_target": 1}, "3841": {"distance": 30.0, "precede_target": 1}, "3848": {"distance": 30.0, "precede_target": 1}, "3856": {"distance": 29.0, "precede_target": 1}, "3862": {"distance": 28.0, "precede_target": 1}, "3920": {"distance": Infinity, "precede_target": 0}, "3873": {"distance": 28.0, "precede_target": 1}, "3893": {"distance": 28.0, "precede_target": 1}, "3903": {"distance": 28.0, "precede_target": 1}, "3913": {"distance": Infinity, "precede_target": 0}, "4083": {"distance": 48.0, "precede_target": 1}, "4091": {"distance": 47.0, "precede_target": 1}, "4098": {"distance": 47.0, "precede_target": 1}, "4106": {"distance": 46.0, "precede_target": 1}, "4113": {"distance": 46.0, "precede_target": 1}, "4121": {"distance": 45.0, "precede_target": 1}, "4128": {"distance": 45.0, "precede_target": 1}, "4136": {"distance": 44.0, "precede_target": 1}, "4143": {"distance": 44.0, "precede_target": 1}, "4151": {"distance": 43.0, "precede_target": 1}, "4158": {"distance": 43.0, "precede_target": 1}, "4166": {"distance": 42.0, "precede_target": 1}, "4173": {"distance": 42.0, "precede_target": 1}, "4181": {"distance": 41.0, "precede_target": 1}, "4188": {"distance": 41.0, "precede_target": 1}, "4196": {"distance": 40.0, "precede_target": 1}, "4203": {"distance": 40.0, "precede_target": 1}, "4211": {"distance": 39.0, "precede_target": 1}, "4218": {"distance": 39.0, "precede_target": 1}, "4226": {"distance": 38.0, "precede_target": 1}, "4233": {"distance": 38.0, "precede_target": 1}, "4241": {"distance": 37.0, "precede_target": 1}, "4248": {"distance": 37.0, "precede_target": 1}, "4256": {"distance": 36.0, "precede_target": 1}, "4263": {"distance": 36.0, "precede_target": 1}, "4271": {"distance": 35.0, "precede_target": 1}, "4278": {"distance": 35.0, "precede_target": 1}, "4286": {"distance": 34.0, "precede_target": 1}, "4293": {"distance": 34.0, "precede_target": 1}, "4301": {"distance": 33.0, "precede_target": 1}, "4308": {"distance": 33.0, "precede_target": 1}, "4316": {"distance": 32.0, "precede_target": 1}, "4323": {"distance": 32.0, "precede_target": 1}, "4331": {"distance": 31.0, "precede_target": 1}, "4338": {"distance": 31.0, "precede_target": 1}, "4346": {"distance": 30.0, "precede_target": 1}, "4353": {"distance": 30.0, "precede_target": 1}, "4361": {"distance": 29.0, "precede_target": 1}, "4367": {"distance": 28.0, "precede_target": 1}, "4414": {"distance": Infinity, "precede_target": 0}, "4378": {"distance": 28.0, "precede_target": 1}, "4397": {"distance": 28.0, "precede_target": 1}, "4407": {"distance": Infinity, "precede_target": 0}, "4646": {"distance": 48.0, "precede_target": 1}, "4654": {"distance": 47.0, "precede_target": 1}, "4661": {"distance": 47.0, "precede_target": 1}, "4669": {"distance": 46.0, "precede_target": 1}, "4676": {"distance": 46.0, "precede_target": 1}, "4684": {"distance": 45.0, "precede_target": 1}, "4691": {"distance": 45.0, "precede_target": 1}, "4699": {"distance": 44.0, "precede_target": 1}, "4706": {"distance": 44.0, "precede_target": 1}, "4714": {"distance": 43.0, "precede_target": 1}, "4721": {"distance": 43.0, "precede_target": 1}, "4729": {"distance": 42.0, "precede_target": 1}, "4736": {"distance": 42.0, "precede_target": 1}, "4744": {"distance": 41.0, "precede_target": 1}, "4751": {"distance": 41.0, "precede_target": 1}, "4759": {"distance": 40.0, "precede_target": 1}, "4766": {"distance": 40.0, "precede_target": 1}, "4774": {"distance": 39.0, "precede_target": 1}, "4781": {"distance": 39.0, "precede_target": 1}, "4789": {"distance": 38.0, "precede_target": 1}, "4796": {"distance": 38.0, "precede_target": 1}, "4804": {"distance": 37.0, "precede_target": 1}, "4811": {"distance": 37.0, "precede_target": 1}, "4819": {"distance": 36.0, "precede_target": 1}, "4826": {"distance": 36.0, "precede_target": 1}, "4834": {"distance": 35.0, "precede_target": 1}, "4841": {"distance": 35.0, "precede_target": 1}, "4849": {"distance": 34.0, "precede_target": 1}, "4856": {"distance": 34.0, "precede_target": 1}, "4864": {"distance": 33.0, "precede_target": 1}, "4871": {"distance": 33.0, "precede_target": 1}, "4879": {"distance": 32.0, "precede_target": 1}, "4886": {"distance": 32.0, "precede_target": 1}, "4894": {"distance": 31.0, "precede_target": 1}, "4901": {"distance": 31.0, "precede_target": 1}, "4909": {"distance": 30.0, "precede_target": 1}, "4916": {"distance": 30.0, "precede_target": 1}, "4924": {"distance": 29.0, "precede_target": 1}, "4930": {"distance": 28.0, "precede_target": 1}, "4977": {"distance": Infinity, "precede_target": 0}, "4941": {"distance": 28.0, "precede_target": 1}, "4960": {"distance": 28.0, "precede_target": 1}, "4970": {"distance": Infinity, "precede_target": 0}, "4989": {"distance": 40.0, "precede_target": 1}, "5584": {"distance": 39.0, "precede_target": 1}, "5004": {"distance": 33.0, "precede_target": 1}, "5063": {"distance": 32.0, "precede_target": 1}, "5010": {"distance": 28.0, "precede_target": 1}, "5607": {"distance": 27.0, "precede_target": 1}, "5025": {"distance": 23.0, "precede_target": 1}, "5118": {"distance": 29.0, "precede_target": 1}, "5135": {"distance": 29.0, "precede_target": 1}, "5152": {"distance": 29.0, "precede_target": 1}, "5169": {"distance": 29.0, "precede_target": 1}, "5186": {"distance": 29.0, "precede_target": 1}, "5203": {"distance": 29.0, "precede_target": 1}, "5220": {"distance": 29.0, "precede_target": 1}, "5237": {"distance": 29.0, "precede_target": 1}, "5255": {"distance": 29.0, "precede_target": 1}, "5273": {"distance": 22.0, "precede_target": 1}, "5045": {"distance": Infinity, "precede_target": 0}, "5049": {"distance": 41.0, "precede_target": 1}, "5100": {"distance": Infinity, "precede_target": 0}, "5104": {"distance": 29.0, "precede_target": 1}, "5291": {"distance": 0.001, "precede_target": -1}, "5380": {"distance": 0.001, "precede_target": -1}, "5304": {"distance": 0.001, "precede_target": -1}, "5343": {"distance": 0.001, "precede_target": -1}, "5317": {"distance": 27.0, "precede_target": 1}, "5527": {"distance": 26.0, "precede_target": 1}, "5326": {"distance": Infinity, "precede_target": 0}, "5374": {"distance": Infinity, "precede_target": 0}, "5402": {"distance": 27.0, "precede_target": 1}, "5413": {"distance": 30.0, "precede_target": 1}, "5458": {"distance": Infinity, "precede_target": 0}, "5466": {"distance": 29.0, "precede_target": 1}, "5537": {"distance": Infinity, "precede_target": 0}, "5465": {"distance": 30.0, "precede_target": 1}, "5477": {"distance": 38.0, "precede_target": 1}, "5495": {"distance": 37.0, "precede_target": 1}, "5488": {"distance": 36.0, "precede_target": 1}, "5593": {"distance": 35.0, "precede_target": 1}, "5616": {"distance": 25.0, "precede_target": 1}, "5600": {"distance": Infinity, "precede_target": 0}, "5604": {"distance": 34.0, "precede_target": 1}, "5623": {"distance": Infinity, "precede_target": 0}, "5627": {"distance": 24.0, "precede_target": 1}}

