# MI-Sistemas-Digitais-P1
Este repositório é destinado ao projeto de Sistemas Digitais TEC499 que utiliza a metodologia PBL.

---

## Co-processador de Cálculo de Matrizes

### Descrição

Este projeto em Verilog simula um processador especializado em operações de matrizes implementado em uma FPGA. Trata-se de uma arquitetura customizada, optimizada para operações matemáticas envolvendo matrizes 5x5, onde cada elemento da matriz é representado por 8 bits.

### Estrutura do Projeto

O projeto inclui diversos módulos básicos para manipulação de matrizes, incluindo adições, subtrações, transposições, e multiplicações escalares:


**matrix_add:** Realiza a adição elemento a elemento de duas matrizes.

**matrix_sub:** Realiza a subtração elemento a elemento entre duas matrizes.

**matrix_mul_scalar:** Multiplica cada elemento de uma matriz por um valor escalar.

**matrix_transpose:** Transpõe a matriz, trocando linhas por colunas.

**matrix_opposite:** Gera a matriz oposta, multiplicando cada elemento por -1.

### Detalhes Técnicos

**Hardware e Tecnologia:** Cada operação é implementada de forma que diversas instâncias possam operar em paralelo, utilizando a capacidade de sintetização em FPGAs. Isso possibilita que as operações sejam concluídas eficientemente.


**Design Modular:** O uso de módulos definidos facilita a extensão e modificação do projeto, tornando simples a adição de novas funcionalidades ou o teste individual de componentes.

#### Componentes Principais

**Unidade Lógica e Aritmética (ULA):** A ULA é responsável por executar operações aritméticas (como adição, subtração e multiplicação) em dados carregados dos registradores.


**Unidade de Controle:** Coordena as operações do processador, determinando quais ações a ULA deve realizar em cada ciclo de relógio com base no comando atual.


**Memória Processador Unidade (MPU):** Esta unidade gerencia a interação do processador com a memória, incluindo leitura e escrita de dados.


**Memória:** Contém os dados das matrizes e instruções. Neste projeto, as matrizes são armazenadas na memória e carregadas em registradores antes de serem processadas.


#### Fluxo de Dados

- As matrizes de entrada são inicialmente armazenadas na memória do sistema.


- Antes das operações, as matrizes são carregadas nos registradores. Isso permite que a ULA opere sobre elas com rapidez e eficiência.


- A ULA realiza operações de matrizes nos dados dos registradores, transformando as entradas conforme a lógica dos módulos.


- Os resultados das operações são escritos de volta nos registradores e, eventualmente, armazenados na memória para operações subsequentes ou saída.


## Instalando e Usando
Pré-requisitos

- Ter o Quartus configurado
- FPGA DoC

### Instruções

- Clone o Repositório:


```
git clone https://github.com/seu-usuario/seu-repositorio.git
```

Sintetização em FPGA:
Proceda com as etapas normais para sintetização no ambiente de desenvolvimento da FPGA, garantindo que as pinagens sejam configurados de acordo com sua placa.

Obs: para montagem do código deste repositório, foi utilizado a placa  