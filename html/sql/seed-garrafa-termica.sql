-- Seed: Garrafa Squeeze Térmica 800ml (Qualishop)
-- Run in Supabase SQL Editor

INSERT INTO produtos (id, user_id, nome, descricao, resumo, problemas, beneficios, caracteristicas, diferenciais, testes, momentosWow, publicoIdeal, objecoes, curiosidades)
VALUES
('garrafa-squeeze-termica-800ml', (SELECT id FROM auth.users ORDER BY created_at LIMIT 1), 'Garrafa Squeeze Térmica 800ml Inox 316 com Vácuo', 'Garrafa térmica squeeze de 800ml em aço inox 316, mantém sua bebida gelada por até 12h ou quente por até 6h. Ideal para academia, escola, trabalho e passeios. #garrafatermica #squeeze #academia #hidratacao #inox #tiktokshop', 'A Garrafa Squeeze Térmica 800ml em Inox 316 mantém suas bebidas na temperatura ideal por muito mais tempo graças ao isolamento térmico a vácuo. Leve e prática, tem tampa com vedação antivazamento que garante transporte seguro na mochila, bolsa ou no carro. Perfeita para treino, estudos, trabalho, viagens e qualquer programa ao ar livre.', 'Bebida esquenta rápido em garrafas comuns.
Vazamento de água dentro da mochila.
Bebida quente que esfria em minutos.
Água com gosto metálico ou plástico.
Reabastecer várias vezes por dia por falta de capacidade.', 'Bebida gelada por até 12 horas.
Bebida quente por até 6 horas.
Não vaza na mochila ou bolsa (vedação antivazamento).
Material inox 316, durável e sem gosto metálico.
Capacidade de 800ml para o dia inteiro.
Sem esforço para abrir (tampa squeeze prática).', 'Capacidade de 800ml.
Corpo em aço inoxidável 316.
Isolamento térmico a vácuo.
Tampa squeeze com vedação antivazamento.
Mantém frio por até 12 horas.
Mantém quente por até 6 horas.
Livre de BPA.
Alça prática para transporte (conforme modelo).
Tamanho compacto para mochila e bolsa.', 'Aço inox 316, mais resistente à corrosão que o 304.
Isolamento a vácuo de alto desempenho.
Tampa antivazamento que pode ir deitada na bolsa.
Gelada e quente na mesma garrafa (versátil).
Sem cheiro nem gosto na bebida.
Leve e fácil de lavar.', 'Mostrar água gelada após 12 horas na geladeira.
Mostrar café/quente preservado após horas.
Virar a garrafa de cabeça para baixo e provar que não vaza.
Comparar com garrafa plástica esquecendo na mesma condição.
Encher e levar dentro de uma mochila comum.
Medir a temperatura com termômetro no antes/depois.', 'Tirar a garrafa da bolsa no dia seguinte e o gelo ainda estar lá.
Virar de cabeça para baixo sem pingar uma gota.
Termômetro mostrando água ainda fria horas depois.
Comparação lado a lado com garrafa plástica quente/amornada.', 'Quem treina na academia.
Estudantes (escola e faculdade).
Quem trabalha fora o dia todo.
Ciclistas e corredores.
Quem faz trilha ou passeios ao ar livre.
Quem viaja de carro.
Quem gosta de café ou chá quente no dia a dia.
Quem busca reduzir plástico no dia a dia.', 'Será que mantém mesmo gelado? | Sim, o isolamento a vácuo segura até 12 horas para bebidas frias.
Vaza na mochila? | Não, tem tampa com vedação antivazamento e pode ir deitada.
É difícil de lavar? | Não, a boca é larga e o material não retém cheiro.
O inox esquenta por fora? | Não, o isolamento mantém o exterior na temperatura ambiente.
Serve só para água? | Não, serve para sucos, isotônicos, café e chá.', 'O inox 316 é mais resistente à corrosão que o 304 e usado até na indústria alimentícia.
O isolamento a vácuo funciona como uma garrafa dentro da outra, sem ar entre elas.
A bebida gelada não esquenta mesmo com a garrafa no sol.
Sem BPA, ideal para crianças.
Praticamente não forma suor/condensação por fora.')
;
