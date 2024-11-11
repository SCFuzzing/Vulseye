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



