# Desenvolvimento de API para Web Service com Rails

## Endpoint Raiz (Root)

Todos os recursos (resources) devem ser precedidos pela seguinte rota:

`http://localhost:3000/v1/`

Para isso você vai precisar usar [namespace](https://guides.rubyonrails.org/v5.1/routing.html#controller-namespaces-and-routing) na hora de configurar as Rotas (config/routes.rb).

## Parâmetros (Parameters)

Todos os parâmetros são opcionais e sem ele a API vai apenas retornar todos os personagens em ordem crescente de acordo com o ID. Parâmetros são passados como strings e podem ser encadeados.

`http://localhost:3000/v1/characters?cha_lt=15&dex_lt=10`

## Listar os Personagens (Get Characters)

Retorna os personagens (characters) do sistema. É possível aplicar diversos filtros. As opções disponíveis estão listadas na tabela seguinte:

`http://localhost:3000/v1/characters`

Parâmetro | Tipo | Detalhes
------------ | ------------- | -------------
str_gt | integer | Retorna todos os personagens onde força (str - strength) for maior que (gt - greater than) o número fornecido.
str_lt | integer | Retorna todos os personagens onde força (str - strength) for menor que (lt - less than) o número fornecido.
dex_gt | integer | Retorna todos os personagens onde destreza (dex - dexterity) for maior que (gt - greater than) o número fornecido.
dex_lt | integer | Retorna todos os personagens onde destreza (dex - dexterity) for menor que (lt - less than) o número fornecido.
con_gt | integer | Retorna todos os personagens onde constituição (con - constitution) for maior que (gt - greater than) o número fornecido.
con_lt | integer | Retorna todos os personagens onde constituição (con - constitution) for menor que (lt - less than) o número fornecido.
int_gt | integer | Retorna todos os personagens onde inteligência (int - intelligence) for maior que (gt - greater than) o número fornecido.
int_lt | integer | Retorna todos os personagens onde inteligência (int - intelligence) for menor que (lt - less than) o número fornecido.
wis_gt | integer | Retorna todos os personagens onde sabedoria (wis - wisdom) for maior que (gt - greater than) o número fornecido.
wis_lt | integer | Retorna todos os personagens onde sabedoria (wis - wisdom) for menor que (lt - less than) o número fornecido.
cha_gt | integer | Retorna todos os personagens onde carisma (cha - charisma) for maior que (gt - greater than) o número fornecido.
cha_lt | integer | Retorna todos os personagens onde carisma (cha - charisma) for menor que (lt - less than) o número fornecido.
character_name | string | Retorna todos os personagens onde constituição (con - constitution) for menor que (lt - less than) o número fornecido.

## Obter um Único Personagem (Character)

Recupere um personagem da API usando seu ID.

`http://localhost:3000/v1/characters/1`

### Exemplo de Resposta

Todos os endpoints retornam um JSON com um número de objetos de personagens (characters) dentro de um array:

```json
[
  {
    "id": 1,
    "name": "Elisson",
    "strength": 1,
    "dexterity": 3,
    "constitution": 2,
    "intelligence": 4,
    "wisdom": 2,
    "charisma": 3,
    "level": 2,
    "proficiency_bonus": 2,
    "skills": [
      {
        "id": 1,
        "name": "Athletics",
        "ability": "strength",
        "score": -3,
        "proficient": true
      },
      {
        "id": 2,
        "name": "Acrobatics",
        "ability": "dexterity",
        "score": -4,
        "proficient": false
      },
      {
        "id": 3,
        "name": "Stealth",
        "ability": "dexterity",
        "score": -4,
        "proficient": false
      }
    ]
  }
]
```

## Banco de Dados

Crie duas tabelas: characters e skills com os seguintes campos:

O campo proficient na tabela skills precisa ter false como [valor padrão (default).](https://guides.rubyonrails.org/v5.1/active_record_migrations.html)

## Modelos

Adicione validações para os campos de nomes (não permita salvar registros com nomes vazios). 
Os campos strength, dexterity, constitution, intelligence, wisdom e charisma, em Character, devem ser números inteiros com valores entre 1 e 20.
O campo ability em Skill precisa ter um dos seguintes valores: strength, dexterity, constitution, intelligence, wisdom e charisma.
O nível (level) do personagem é a média aritmética dos valores de seus 6 atributos (strength, dexterity, constitution, intelligence, wisdom e charisma).
O bônus de proficiência da um personagem é calculado de acordo com seu nível (level) e a Tabela 1.
A pontuação (score) de uma habilidade (skill) é calculada de acordo com o valor do atributo no personagem referente a ability da skill. Exemplo: Se a ability da skill for strength, o score é calculado usando o campo strength do personagem da skill, aplicando o modificar apresentado na Tabela 2. 
Se o personagem for proficient na skill, deve-se somar o bônus de proficiência da Tabela 1.

**Tabela 1 Cálculo de Bônus de Proficiência**

Level | Proficiency Bonus
------------ | -------------
1 | +2
2 | +2
3 | +2
4 | +2
5 | +3
6 | +3
7 | +3
8 | +3
9 | +4
10 | +4
11 | +4
12 | +4
13 | +5
14 | +5
15 | +5
16 | +5
17 | +6
18 | +6
19 | +6
20 | +6


**Tabela 2 Modificador de Score (Pontuação) da Skill**

Valor de Ability no Personagem | Modificador
------------ | -------------
1 | -5
2-3 | -4
4-5 | -3
6-7 | -2
8-9 | -1
10-11 | 0
12-13 | +1
14-15 | +2
16-17 | +3
18-19 | +4
20 | +5

Lembrando que ability pode ser: strength, dexterity, constitution, intelligence, wisdom e charisma.

## Rotas

Sua API deve possuir os endpoints exibidos na Figura 1. 
Skills não precisam das rotas index e show e precisam estar aninhadas com character devido a relação de belongs_to. 
Atenção para exclusão das skills de um personagem quando o excluir.

## JSON

Cogite a utilização da [gem jbuilder](https://github.com/rails/jbuilder) para construção do JSON.
