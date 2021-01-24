pragma solidity ^0.5.13;

contract Crowdfunding1 {
    
    
    address private owner;
    
    constructor() public {
        
        owner = msg.sender;
        
    }
    
    modifier isOwner(){
        
        require(owner == msg.sender);
        _;
        
    }
    
    
    
    string public nombre;
    string public apellido;
    
    uint public objetivo = 10 ether;
    uint public balance;
    uint public totalRecaudado;
    
    address payable public artista = 0xdD870fA1b7C4700F2BD7f44238821C26f7392148;
    
    function setMecenas(string memory nombre_mecenas, string memory apellido_mecenas) public isOwner payable {
        
        nombre = nombre_mecenas;
        apellido = apellido_mecenas;
        
        require(msg.value > 1 ether); //aportacion minima 1 eth
        
        balance = balance + msg.value;
        
        if(balance >= objetivo){
            
            payOut();
            
        }
        
        
    }
    
    function getMecenas() public view returns (string memory, string memory){
        
        return(nombre, apellido);
        
    }
    
    function payOut() private {
        
        totalRecaudado = balance;
        balance = 0;
        
        artista.transfer(totalRecaudado);
    }
    
}
