 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecureDataAccess {
    string private secretData;
    address private owner;
    mapping(address => bool) private authorizedUsers;

    // Evento para logar a adição de um usuário autorizado
    event UserAuthorized(address indexed user);
    // Evento para logar a remoção de um usuário autorizado
    event UserRevoked(address indexed user);

    // Construtor do contrato
    constructor(string memory _secretData) {
        secretData = _secretData;
        owner = msg.sender; // Define o proprietário como o criador do contrato
    }

    // Modificador para restringir o acesso ao proprietário do contrato
    modifier onlyOwner() {
        require(msg.sender == owner, "Acesso negado: apenas o proprietario pode executar esta acao.");
        _;
    }

    // Função para adicionar um usuário autorizado (somente o proprietário pode chamar)
    function authorizeUser(address user) public onlyOwner {
        authorizedUsers[user] = true;
        emit UserAuthorized(user);
    }

    // Função para remover um usuário autorizado (somente o proprietário pode chamar)
    function revokeUser(address user) public onlyOwner {
        authorizedUsers[user] = false;
        emit UserRevoked(user);
    }

    // Função para ler os dados, apenas usuários autorizados podem acessá-los
    function readSecretData() public view returns (string memory) {
        require(authorizedUsers[msg.sender], "Acesso negado: usuario nao autorizado.");
        return secretData;
    }
}
