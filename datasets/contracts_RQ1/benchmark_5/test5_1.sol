pragma solidity ^0.8.0;

contract test{
    mapping (address => uint) public userBalance;
    uint v1 = 0;
    uint v2 = 0;
    uint v3 = 0;
    uint v4 = 0;
    uint v5 = 0;
    uint v6 = 0;


    function invest1() payable public{
        userBalance[msg.sender] = msg.value;
    }

    function invest2(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5, uint _v6) payable public{
        userBalance[msg.sender] = msg.value;

        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;


    if (v1 >= 9 && v1 <= 21 && v2 >= 4 && v2 <= 15 && v3 >= 5 && v3 <= 20 && v4 >= 15 && v4 <= 27 && v5 >= 3 && v5 <= 9 && v6 >= 5 && v6 <= 14){
        invest1();

}
            
    }


        function invest3(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5, uint _v6) payable public{
        userBalance[msg.sender] = msg.value;

        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;


    if (v1 >= 13 && v1 <= 19 && v2 >= 24 && v2 <= 28 && v3 >= 16 && v3 <= 22 && v4 >= 5 && v4 <= 17 && v5 >= 15 && v5 <= 19 && v6 >= 14 && v6 <= 44){
        v1 = _v1 + _v2;
        v2 = _v1 + _v2 + _v3;
        v4 = _v1 + _v2 + _v3 + _v4;

}
        }



                function invest4(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5, uint _v6) payable public{
        userBalance[msg.sender] = msg.value;

        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;


    if (v1 >= 3 && v1 <= 9 && v2 >= 14 && v2 <= 28 && v3 >= 12 && v3 <= 19 && v4 >= 14 && v4 <= 22 && v5 >= 4 && v5 <= 9 && v6 >= 44 && v6 <= 64){
        v1 = _v1 + _v2;
        v2 = _v1 + _v2 + _v3;

}
        }

    function invest5(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5, uint _v6) payable public{
        userBalance[msg.sender] = msg.value;

        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;


    if (v1 >= 13 && v1 <= 29 && v2 >= 4 && v2 <= 8 && v3 >= 2 && v3 <= 19 && v4 >= 4 && v4 <= 9 && v5 >= 14 && v5 <= 17 && v6 >= 14 && v6 <= 24){
        v1 = _v1 + _v2;
        v2 = _v1 + _v2 + _v3;

}


    }


        function invest6(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5, uint _v6) payable public{
        userBalance[msg.sender] = msg.value;

        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;


    if (v1 >= 23 && v1 <= 29 && v2 >= 14 && v2 <= 18 && v3 >= 2 && v3 <= 9 && v4 >= 14 && v4 <= 32 && v5 >= 4 && v5 <= 7 && v6 >= 14 && v6 <= 24){
        v1 = _v1 + _v2;
        v2 = _v1 + _v2 + _v3;

}


    }

        function invest7(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5, uint _v6) payable public{
        userBalance[msg.sender] = msg.value;

        v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;


    if (v1 >= 13 && v1 <= 20 && v2 >= 4 && v2 <= 8 && v3 >= 2 && v3 <= 15 && v4 >= 14 && v4 <= 22 && v5 >= 4 && v5 <= 23 && v6 >= 24 && v6 <= 54){
       withdrawBalance(_v1,_v2,_v3,_v4,_v5,_v6);

}


    }


    function withdrawBalance(uint _v1,uint _v2,uint _v3,uint _v4, uint _v5, uint _v6) public {
	    v1 = _v1;
        v2 = _v2;
        v3 = _v3;
        v4 = _v4;
        v5 = _v5;
        v6 = _v6;


    if (v1 >= 3 && v1 <= 10 && v2 >= 1 && v2 <= 5 && v3 >= 2 && v3 <= 15 && v4 >= 10 && v4 <= 20 && v5 >= 14 && v5 <= 23 && v6 >= 19 && v6 <= 22){
       msg.sender.call{value:1}("");

}
    }
}

//{"3283": [{"1": [[3.0, 10.0]], "2": [[1.0, 5.0]], "3": [[2.0, 15.0]], "4": [[10.0, 20.0]], "5": [[14.0, 23.0]], "6": [[19.0, 22.0]], "7": [[8.0, 12.0]], "8": [[10.0, 15.0]]}]}
//{"0": {"distance": 31.0, "precede_target": 1}, "13": {"distance": 30.0, "precede_target": 1}, "134": {"distance": Infinity, "precede_target": 0}, "30": {"distance": 29.0, "precede_target": 1}, "89": {"distance": 29.0, "precede_target": 1}, "41": {"distance": 28.0, "precede_target": 1}, "284": {"distance": Infinity, "precede_target": 0}, "52": {"distance": 28.0, "precede_target": 1}, "294": {"distance": 27.0, "precede_target": 1}, "63": {"distance": 28.0, "precede_target": 1}, "322": {"distance": 27.0, "precede_target": 1}, "74": {"distance": 29.0, "precede_target": 1}, "350": {"distance": 27.0, "precede_target": 1}, "85": {"distance": Infinity, "precede_target": 0}, "378": {"distance": 28.0, "precede_target": 1}, "101": {"distance": 28.0, "precede_target": 1}, "139": {"distance": 40.0, "precede_target": 1}, "112": {"distance": 28.0, "precede_target": 1}, "200": {"distance": 27.0, "precede_target": 1}, "123": {"distance": 28.0, "precede_target": 1}, "228": {"distance": 27.0, "precede_target": 1}, "256": {"distance": 27.0, "precede_target": 1}, "3999": {"distance": 0.001, "precede_target": -1}, "147": {"distance": Infinity, "precede_target": 0}, "151": {"distance": 39.0, "precede_target": 1}, "3441": {"distance": 38.0, "precede_target": 1}, "173": {"distance": 27.0, "precede_target": 1}, "419": {"distance": 26.0, "precede_target": 1}, "178": {"distance": 25.0, "precede_target": 1}, "3722": {"distance": 24.0, "precede_target": 1}, "191": {"distance": Infinity, "precede_target": 0}, "3482": {"distance": 26.0, "precede_target": 1}, "221": {"distance": 41.0, "precede_target": 1}, "443": {"distance": 40.0, "precede_target": 1}, "226": {"distance": Infinity, "precede_target": 0}, "249": {"distance": 41.0, "precede_target": 1}, "901": {"distance": 40.0, "precede_target": 1}, "254": {"distance": Infinity, "precede_target": 0}, "277": {"distance": 41.0, "precede_target": 1}, "1319": {"distance": 40.0, "precede_target": 1}, "282": {"distance": Infinity, "precede_target": 0}, "1737": {"distance": Infinity, "precede_target": 0}, "292": {"distance": Infinity, "precede_target": 0}, "315": {"distance": Infinity, "precede_target": 0}, "1806": {"distance": Infinity, "precede_target": 0}, "320": {"distance": Infinity, "precede_target": 0}, "343": {"distance": 34.0, "precede_target": 1}, "2185": {"distance": 33.0, "precede_target": 1}, "348": {"distance": 0.001, "precede_target": -1}, "371": {"distance": 41.0, "precede_target": 1}, "2572": {"distance": 40.0, "precede_target": 1}, "376": {"distance": Infinity, "precede_target": 0}, "386": {"distance": Infinity, "precede_target": 0}, "390": {"distance": 27.0, "precede_target": 1}, "412": {"distance": 17.0, "precede_target": 1}, "2989": {"distance": 16.0, "precede_target": 1}, "417": {"distance": 0.001, "precede_target": -1}, "580": {"distance": 40.0, "precede_target": 1}, "588": {"distance": 39.0, "precede_target": 1}, "595": {"distance": 39.0, "precede_target": 1}, "603": {"distance": 38.0, "precede_target": 1}, "610": {"distance": 38.0, "precede_target": 1}, "618": {"distance": 37.0, "precede_target": 1}, "625": {"distance": 37.0, "precede_target": 1}, "633": {"distance": 36.0, "precede_target": 1}, "640": {"distance": 36.0, "precede_target": 1}, "648": {"distance": 35.0, "precede_target": 1}, "655": {"distance": 35.0, "precede_target": 1}, "663": {"distance": 34.0, "precede_target": 1}, "670": {"distance": 34.0, "precede_target": 1}, "678": {"distance": 33.0, "precede_target": 1}, "685": {"distance": 33.0, "precede_target": 1}, "693": {"distance": 32.0, "precede_target": 1}, "700": {"distance": 32.0, "precede_target": 1}, "708": {"distance": 31.0, "precede_target": 1}, "715": {"distance": 31.0, "precede_target": 1}, "723": {"distance": 30.0, "precede_target": 1}, "730": {"distance": 30.0, "precede_target": 1}, "738": {"distance": 29.0, "precede_target": 1}, "745": {"distance": 29.0, "precede_target": 1}, "753": {"distance": 28.0, "precede_target": 1}, "760": {"distance": 28.0, "precede_target": 1}, "768": {"distance": 27.0, "precede_target": 1}, "775": {"distance": 27.0, "precede_target": 1}, "783": {"distance": 26.0, "precede_target": 1}, "790": {"distance": 26.0, "precede_target": 1}, "798": {"distance": 25.0, "precede_target": 1}, "804": {"distance": 24.0, "precede_target": 1}, "891": {"distance": Infinity, "precede_target": 0}, "3760": {"distance": 23.0, "precede_target": 1}, "815": {"distance": 24.0, "precede_target": 1}, "834": {"distance": 24.0, "precede_target": 1}, "844": {"distance": 24.0, "precede_target": 1}, "864": {"distance": 24.0, "precede_target": 1}, "874": {"distance": 24.0, "precede_target": 1}, "884": {"distance": Infinity, "precede_target": 0}, "1038": {"distance": 40.0, "precede_target": 1}, "1046": {"distance": 39.0, "precede_target": 1}, "1053": {"distance": 39.0, "precede_target": 1}, "1061": {"distance": 38.0, "precede_target": 1}, "1068": {"distance": 38.0, "precede_target": 1}, "1076": {"distance": 37.0, "precede_target": 1}, "1083": {"distance": 37.0, "precede_target": 1}, "1091": {"distance": 36.0, "precede_target": 1}, "1098": {"distance": 36.0, "precede_target": 1}, "1106": {"distance": 35.0, "precede_target": 1}, "1113": {"distance": 35.0, "precede_target": 1}, "1121": {"distance": 34.0, "precede_target": 1}, "1128": {"distance": 34.0, "precede_target": 1}, "1136": {"distance": 33.0, "precede_target": 1}, "1143": {"distance": 33.0, "precede_target": 1}, "1151": {"distance": 32.0, "precede_target": 1}, "1158": {"distance": 32.0, "precede_target": 1}, "1166": {"distance": 31.0, "precede_target": 1}, "1173": {"distance": 31.0, "precede_target": 1}, "1181": {"distance": 30.0, "precede_target": 1}, "1188": {"distance": 30.0, "precede_target": 1}, "1196": {"distance": 29.0, "precede_target": 1}, "1203": {"distance": 29.0, "precede_target": 1}, "1211": {"distance": 28.0, "precede_target": 1}, "1218": {"distance": 28.0, "precede_target": 1}, "1226": {"distance": 27.0, "precede_target": 1}, "1233": {"distance": 27.0, "precede_target": 1}, "1241": {"distance": 26.0, "precede_target": 1}, "1248": {"distance": 26.0, "precede_target": 1}, "1256": {"distance": 25.0, "precede_target": 1}, "1262": {"distance": 24.0, "precede_target": 1}, "1309": {"distance": Infinity, "precede_target": 0}, "1273": {"distance": 24.0, "precede_target": 1}, "1292": {"distance": 24.0, "precede_target": 1}, "1302": {"distance": Infinity, "precede_target": 0}, "1456": {"distance": 40.0, "precede_target": 1}, "1464": {"distance": 39.0, "precede_target": 1}, "1471": {"distance": 39.0, "precede_target": 1}, "1479": {"distance": 38.0, "precede_target": 1}, "1486": {"distance": 38.0, "precede_target": 1}, "1494": {"distance": 37.0, "precede_target": 1}, "1501": {"distance": 37.0, "precede_target": 1}, "1509": {"distance": 36.0, "precede_target": 1}, "1516": {"distance": 36.0, "precede_target": 1}, "1524": {"distance": 35.0, "precede_target": 1}, "1531": {"distance": 35.0, "precede_target": 1}, "1539": {"distance": 34.0, "precede_target": 1}, "1546": {"distance": 34.0, "precede_target": 1}, "1554": {"distance": 33.0, "precede_target": 1}, "1561": {"distance": 33.0, "precede_target": 1}, "1569": {"distance": 32.0, "precede_target": 1}, "1576": {"distance": 32.0, "precede_target": 1}, "1584": {"distance": 31.0, "precede_target": 1}, "1591": {"distance": 31.0, "precede_target": 1}, "1599": {"distance": 30.0, "precede_target": 1}, "1606": {"distance": 30.0, "precede_target": 1}, "1614": {"distance": 29.0, "precede_target": 1}, "1621": {"distance": 29.0, "precede_target": 1}, "1629": {"distance": 28.0, "precede_target": 1}, "1636": {"distance": 28.0, "precede_target": 1}, "1644": {"distance": 27.0, "precede_target": 1}, "1651": {"distance": 27.0, "precede_target": 1}, "1659": {"distance": 26.0, "precede_target": 1}, "1666": {"distance": 26.0, "precede_target": 1}, "1674": {"distance": 25.0, "precede_target": 1}, "1680": {"distance": 24.0, "precede_target": 1}, "1727": {"distance": Infinity, "precede_target": 0}, "1691": {"distance": 24.0, "precede_target": 1}, "1710": {"distance": 24.0, "precede_target": 1}, "1720": {"distance": Infinity, "precede_target": 0}, "2174": {"distance": Infinity, "precede_target": 0}, "1943": {"distance": Infinity, "precede_target": 0}, "1951": {"distance": Infinity, "precede_target": 0}, "1958": {"distance": Infinity, "precede_target": 0}, "1966": {"distance": Infinity, "precede_target": 0}, "1973": {"distance": Infinity, "precede_target": 0}, "1981": {"distance": Infinity, "precede_target": 0}, "1988": {"distance": Infinity, "precede_target": 0}, "1996": {"distance": Infinity, "precede_target": 0}, "2003": {"distance": Infinity, "precede_target": 0}, "2011": {"distance": Infinity, "precede_target": 0}, "2018": {"distance": Infinity, "precede_target": 0}, "2026": {"distance": Infinity, "precede_target": 0}, "2033": {"distance": Infinity, "precede_target": 0}, "2041": {"distance": Infinity, "precede_target": 0}, "2048": {"distance": Infinity, "precede_target": 0}, "2056": {"distance": Infinity, "precede_target": 0}, "2063": {"distance": Infinity, "precede_target": 0}, "2071": {"distance": Infinity, "precede_target": 0}, "2078": {"distance": Infinity, "precede_target": 0}, "2086": {"distance": Infinity, "precede_target": 0}, "2093": {"distance": Infinity, "precede_target": 0}, "2101": {"distance": Infinity, "precede_target": 0}, "2108": {"distance": Infinity, "precede_target": 0}, "2116": {"distance": Infinity, "precede_target": 0}, "2123": {"distance": Infinity, "precede_target": 0}, "2131": {"distance": Infinity, "precede_target": 0}, "2138": {"distance": Infinity, "precede_target": 0}, "2146": {"distance": Infinity, "precede_target": 0}, "2153": {"distance": Infinity, "precede_target": 0}, "2161": {"distance": Infinity, "precede_target": 0}, "2167": {"distance": Infinity, "precede_target": 0}, "2175": {"distance": Infinity, "precede_target": 0}, "2322": {"distance": 33.0, "precede_target": 1}, "2330": {"distance": 32.0, "precede_target": 1}, "2337": {"distance": 32.0, "precede_target": 1}, "2345": {"distance": 31.0, "precede_target": 1}, "2352": {"distance": 31.0, "precede_target": 1}, "2360": {"distance": 30.0, "precede_target": 1}, "2367": {"distance": 30.0, "precede_target": 1}, "2375": {"distance": 29.0, "precede_target": 1}, "2382": {"distance": 29.0, "precede_target": 1}, "2390": {"distance": 28.0, "precede_target": 1}, "2397": {"distance": 28.0, "precede_target": 1}, "2405": {"distance": 27.0, "precede_target": 1}, "2412": {"distance": 27.0, "precede_target": 1}, "2420": {"distance": 26.0, "precede_target": 1}, "2427": {"distance": 26.0, "precede_target": 1}, "2435": {"distance": 25.0, "precede_target": 1}, "2442": {"distance": 25.0, "precede_target": 1}, "2450": {"distance": 24.0, "precede_target": 1}, "2457": {"distance": 24.0, "precede_target": 1}, "2465": {"distance": 23.0, "precede_target": 1}, "2472": {"distance": 23.0, "precede_target": 1}, "2480": {"distance": 22.0, "precede_target": 1}, "2487": {"distance": 22.0, "precede_target": 1}, "2495": {"distance": 21.0, "precede_target": 1}, "2502": {"distance": 21.0, "precede_target": 1}, "2510": {"distance": 20.0, "precede_target": 1}, "2517": {"distance": 20.0, "precede_target": 1}, "2525": {"distance": 19.0, "precede_target": 1}, "2532": {"distance": 19.0, "precede_target": 1}, "2540": {"distance": 18.0, "precede_target": 1}, "2546": {"distance": 17.0, "precede_target": 1}, "2562": {"distance": 0.001, "precede_target": -1}, "2561": {"distance": 0.001, "precede_target": -1}, "2709": {"distance": 40.0, "precede_target": 1}, "2717": {"distance": 39.0, "precede_target": 1}, "2724": {"distance": 39.0, "precede_target": 1}, "2732": {"distance": 38.0, "precede_target": 1}, "2739": {"distance": 38.0, "precede_target": 1}, "2747": {"distance": 37.0, "precede_target": 1}, "2754": {"distance": 37.0, "precede_target": 1}, "2762": {"distance": 36.0, "precede_target": 1}, "2769": {"distance": 36.0, "precede_target": 1}, "2777": {"distance": 35.0, "precede_target": 1}, "2784": {"distance": 35.0, "precede_target": 1}, "2791": {"distance": 34.0, "precede_target": 1}, "2798": {"distance": 34.0, "precede_target": 1}, "2806": {"distance": 33.0, "precede_target": 1}, "2813": {"distance": 33.0, "precede_target": 1}, "2821": {"distance": 32.0, "precede_target": 1}, "2828": {"distance": 32.0, "precede_target": 1}, "2836": {"distance": 31.0, "precede_target": 1}, "2843": {"distance": 31.0, "precede_target": 1}, "2851": {"distance": 30.0, "precede_target": 1}, "2858": {"distance": 30.0, "precede_target": 1}, "2866": {"distance": 29.0, "precede_target": 1}, "2873": {"distance": 29.0, "precede_target": 1}, "2881": {"distance": 28.0, "precede_target": 1}, "2888": {"distance": 28.0, "precede_target": 1}, "2896": {"distance": 27.0, "precede_target": 1}, "2903": {"distance": 27.0, "precede_target": 1}, "2911": {"distance": 26.0, "precede_target": 1}, "2918": {"distance": 26.0, "precede_target": 1}, "2926": {"distance": 25.0, "precede_target": 1}, "2932": {"distance": 24.0, "precede_target": 1}, "2979": {"distance": Infinity, "precede_target": 0}, "2943": {"distance": 24.0, "precede_target": 1}, "2962": {"distance": 24.0, "precede_target": 1}, "2972": {"distance": Infinity, "precede_target": 0}, "3059": {"distance": 16.0, "precede_target": 1}, "3067": {"distance": 15.0, "precede_target": 1}, "3074": {"distance": 15.0, "precede_target": 1}, "3082": {"distance": 14.0, "precede_target": 1}, "3089": {"distance": 14.0, "precede_target": 1}, "3097": {"distance": 13.0, "precede_target": 1}, "3104": {"distance": 13.0, "precede_target": 1}, "3112": {"distance": 12.0, "precede_target": 1}, "3119": {"distance": 12.0, "precede_target": 1}, "3127": {"distance": 11.0, "precede_target": 1}, "3134": {"distance": 11.0, "precede_target": 1}, "3142": {"distance": 10.0, "precede_target": 1}, "3149": {"distance": 10.0, "precede_target": 1}, "3157": {"distance": 9.0, "precede_target": 1}, "3164": {"distance": 9.0, "precede_target": 1}, "3172": {"distance": 8.0, "precede_target": 1}, "3179": {"distance": 8.0, "precede_target": 1}, "3187": {"distance": 7.0, "precede_target": 1}, "3194": {"distance": 7.0, "precede_target": 1}, "3202": {"distance": 6.0, "precede_target": 1}, "3209": {"distance": 6.0, "precede_target": 1}, "3217": {"distance": 5.0, "precede_target": 1}, "3224": {"distance": 5.0, "precede_target": 1}, "3232": {"distance": 4.0, "precede_target": 1}, "3239": {"distance": 4.0, "precede_target": 1}, "3247": {"distance": 3.0, "precede_target": 1}, "3254": {"distance": 3.0, "precede_target": 1}, "3262": {"distance": 2.0, "precede_target": 1}, "3269": {"distance": 2.0, "precede_target": 1}, "3277": {"distance": 1.0, "precede_target": 1}, "3283": {"distance": 0, "precede_target": -1}, "3389": {"distance": 0.001, "precede_target": -1}, "3701": {"distance": 0.001, "precede_target": -1}, "3319": {"distance": 0.001, "precede_target": -1}, "3347": {"distance": 0.001, "precede_target": -1}, "3380": {"distance": 0.001, "precede_target": -1}, "3385": {"distance": 0.001, "precede_target": -1}, "3399": {"distance": 36.0, "precede_target": 1}, "3953": {"distance": 35.0, "precede_target": 1}, "3414": {"distance": 29.0, "precede_target": 1}, "3473": {"distance": 28.0, "precede_target": 1}, "3420": {"distance": 24.0, "precede_target": 1}, "3976": {"distance": 23.0, "precede_target": 1}, "3435": {"distance": 19.0, "precede_target": 1}, "3525": {"distance": 25.0, "precede_target": 1}, "3542": {"distance": 25.0, "precede_target": 1}, "3559": {"distance": 25.0, "precede_target": 1}, "3576": {"distance": 25.0, "precede_target": 1}, "3593": {"distance": 25.0, "precede_target": 1}, "3610": {"distance": 25.0, "precede_target": 1}, "3627": {"distance": 25.0, "precede_target": 1}, "3644": {"distance": 18.0, "precede_target": 1}, "3455": {"distance": Infinity, "precede_target": 0}, "3459": {"distance": 37.0, "precede_target": 1}, "3507": {"distance": Infinity, "precede_target": 0}, "3511": {"distance": 25.0, "precede_target": 1}, "3660": {"distance": 0.001, "precede_target": -1}, "3749": {"distance": 0.001, "precede_target": -1}, "3673": {"distance": 0.001, "precede_target": -1}, "3712": {"distance": 0.001, "precede_target": -1}, "3686": {"distance": 23.0, "precede_target": 1}, "3896": {"distance": 22.0, "precede_target": 1}, "3695": {"distance": Infinity, "precede_target": 0}, "3743": {"distance": Infinity, "precede_target": 0}, "3771": {"distance": 23.0, "precede_target": 1}, "3782": {"distance": 26.0, "precede_target": 1}, "3827": {"distance": Infinity, "precede_target": 0}, "3835": {"distance": 25.0, "precede_target": 1}, "3906": {"distance": Infinity, "precede_target": 0}, "3834": {"distance": 26.0, "precede_target": 1}, "3846": {"distance": 34.0, "precede_target": 1}, "3864": {"distance": 33.0, "precede_target": 1}, "3857": {"distance": 32.0, "precede_target": 1}, "3962": {"distance": 31.0, "precede_target": 1}, "3985": {"distance": 21.0, "precede_target": 1}, "3969": {"distance": Infinity, "precede_target": 0}, "3973": {"distance": 30.0, "precede_target": 1}, "3992": {"distance": Infinity, "precede_target": 0}, "3996": {"distance": 20.0, "precede_target": 1}}
