**O que o script faz**❔

- Busca o IP da interface a ser utilizada (ex.: Ethernet, Wi-Fi) na máquina local (Windows) e na máquina remota (WSL2);
- Abre as portas **19000,19001,19002,19003,19004,19005** no firewall do Windows;
- Faz o direcionamento entre endereço IP local (Windows) e endereço IP remoto (WSL2);
- Insere a variável de ambiente **```REACT_NATIVE_PACKAGER_HOSTNAME```** nos arquivos **```.bashrc```** e **```.zshrc```** caso exista;
- A variável de ambiente **```REACT_NATIVE_PACKAGER_HOSTNAME```** recebe automaticamente o endereço IP da máquina local (Windows);
- Define uma chave no registro do Windows para facilitar a execução do script através do ***Executar*** ```(Windows + "R")``` com o comando **```wsl2host```**;

**Como utilizar**❔  

- Executar o arquivo **start.bat** na primeira execução do script.

- Posteriormente é possível executar o script com o comando **```wsl2host```** através do ***Executar*** ```(Windows + "R")```

<p
align="center">
<img
src="https://user-images.githubusercontent.com/46982925/92856562-f43f8100-f3c9-11ea-8f7f-e915d1b788ca.png" />
</p>
