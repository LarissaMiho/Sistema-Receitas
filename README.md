# Sistema-Receitas
Projeto feito para a aula de Laboratório de Engenharia de Software - 5º semestre de Análise e Desenvolvimento de Sistemas - Fatec São José dos Campos - 2021.

# Link dos videos de demonstração
Parte 1 - [video](https://youtu.be/Vk0sn9viELE)

# Build
1. Abrir o terminal no diretório do projeto.
2. Digitar "gradle build" para gerenciar as de dependências e validar para que o projeto seja buildado.
3. Digitar "gradle tomcatRun" para subir o projeto.
4. Acessar no navegador o link do localhost que o terminal lhe dá quando se roda o comando acima.

# REQUISITOS E RESTRIÇÕES GERAIS, TECNOLOGIA JAVA:
1.Utilizar a linguagem Java (Versão 8 ou superior) no back end;
2. JPA com provedor Hibernate (5 ou superior) para persistência de dados;
3. Utilizar o padrão de projeto MVC na arquitetura do sistema;
4. Utilizar Servlets anotados ou com descritor de implantação;
5. Utilizar Java Server Pages para criar páginas dinâmicas (tipo templates);
6. Utilizar o Gradle 5 ou superior para fazer o build do sistema;
7. Implantar o sistema em um web container Apache TomCat. 

# REQUISITOS E RESTRIÇÕES COMUNS: 
1. Exemplificar a utilização de três recursos da linguagem de programação JavaScript,
desenvolvendo código-fonte sem fazer uso de bibliotecas ou frameworks de terceiros.
Além dessas três funcionalidades, utilizar Ajax em alguma funcionalidade do sistema.
2. Exemplificar a construção de três regras CSS, sem fazer uso de frameworks ou
bibliotecas e desconsiderando tamanho e cor de fonte ou cor de plano de fundo. Criar
mandatoriamente uma regra que controle layout de página ou posicionamento de
elementos.
3. Sua aplicação web deve conter um menu para navegação e, no mínimo, duas
interfaces distintas com o usuário, acessíveis a partir do menu. 

# REQUISITOS ESPECÍFICOS SISTEMA 1:
Desenvolver um sistema para criação de receitas.
Uma receita deve ser criada a partir de uma lista de ingredientes pré-cadastrados.
Um ingrediente é caracterizado pelo menos por um nome (ex: banana) e por um id único.
Cada ingrediente, previamente cadastrado, deve possuir uma quantidade específica na receita
que a ele fica atrelada na receita (ex: 200g).
Além da quantidade de cada ingrediente na receita, essa deve possuir um nome (ex: bolo de
cenoura) e um conjunto de passos (1 a N passos) que devem ser executados na sua
preparação.
Notar que Gerenciar Ingredientes refere-se a: inserir, alterar, buscar e remover ingredientes. O
mesmo se aplica às receitas. Além disso, não deve ser possível criar uma receita com um
ingrediente não cadastrado nem tampouco remover um ingrediente caso esse esteja presente
em pelo menos uma receita.


