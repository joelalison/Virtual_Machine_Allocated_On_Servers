# Problema

Neste problema temos um conjunto $` {1…V} `$ de VMs, sendo que cada VM **i** possui um preço $` pi `$ e uma demanda de capacidade $` di `$. Temos também um conjunto de servidores $` {1…M} `$, com cada servidor **j** possuindo sua respectiva capacidade $` C_j `$. Para representar a alocação de uma VM **i** em um servidor **j** utilizamos uma variável de decisão booleana $` x_{ij} `$ que assume 1 no caso da máquina virtual **i** estar alocada no  servidor **j**, e 0 caso contrário. Assim, o que desejamos é a maximização do lucro:

$$
\text{maximizar } \left( \sum_{i=1}^{V} \sum_{j=1}^{M} p_i x_{ij} \right)
$$

sujeito a seguinte restrição:

$$
\sum_{i=1}^{V} d_i x_{ij} \leq C_j \text{, para todo servidor j,}
$$

---

# Entendendo o Problema

Para entender melhor o problema a figura abaixo mostra como funciona a variável booleana $` x_{ij} `$ que assume valor 1 se a máquina virtual **i** estiver alocada no servidor **j** e 0 caso contrário.

![entendendoProblema](https://github.com/joelalison/Virtual_Machine_Allocated_On_Servers/assets/45297008/d49e8d80-bd8e-4b4c-9d3b-66b998592fed){:width="300px"}

----

# Alocando números para o problema
Agora que entendemos o problema, devemos tratar o problema numericamente ao invez de genericamente. Para isso foi proposto um problema com 5 máquinas virtuais (com demandas e preços) e 2 servidores (com capacidades), mostrados na figura abaixo:

![ColocandoNumerosAoProblema](https://github.com/joelalison/Virtual_Machine_Allocated_On_Servers/issues/3#issue-2040886809){:width="300px"}

----

# Metodologia

Foi criado um algoritmo do Simulated Annealing e um script chamado main_SimulatedAnealing para testar a função criada. Além disso foi criado um script para verificar o ponto de mínimo da função de Rosenbrock utilizando cálculo numérico de Quasi-Newton.

---

# Função Simulated Annealing

Os parâmetros do algoritmo foram escolhidos por tentativa e erro:
- Temperatura inicial: 80
- Taxa de resfriamento: 0.9
- Iterações: 20.000

A função objetivo é encontrar o mínimo da função de Rosenbrock definida por:

$` f(x, y) = (1 - x)^2 + 100 \cdot (y - x^2)^2 `$

---

# Discussão

Foi testado inicialmente o algoritmo de Quasi-Newton para verificar a solução e foram encontrados valores de $` (x,y,z) = (1,0.9999,0.00000000001) `$ que é próximo de $` (1,1,0) `$

Como existe uma componente aleatória envolvida no processo do algoritmo do Simulated Annealing, o resultado sempre será diferente, porém para a escolha destes parâmetros os valores de x e y estão com erro apenas na segunda casa decimal, ou seja de centésimos, enquanto que o valor da função objetivo apresenta um erro na quarta casa decimal. Algo em torno de $` (x,y,z)  \simeq  (1.0XX,1.0XX,0.000X) `$

