*&Create a customised ABAP program, for an Airport Company. Based on CITY FROM and CITY TO (both provided by the user in the Selection Screen),
*&the program must retrieve which flights in the system have these 2 cities (Departure and Arrival). The data for these information can be found 
*&in the table SPFLI.

*&Nome do programa
REPORT EXERCISE.

*&Criação de variavel para apresentar informações do banco SPFLI
DATA: w_spfli TYPE spfli.

*&Criacao de tabela interna do tipo SPFLI
DATA: t_spfli TYPE TABLE OF spfli.

*&Tela de seleção

*&Parametro que aponta para o campo cityfrom na tabela transparente
PARAMETER: p_cityf  TYPE spfli-cityfrom,
	   p_cityto TYPE spfli-cityto.

*&Selecao
*&Selecionar todos os campos da tabela spfli para tabela interna t_spfli, onde o valores cityfrom e cityto sejam iguais aos informados pelo usuario 
SELECT *
INTO TABLE t_spfli
FROM spfli
WHERE cityfrom = p_cityf AND
      cityto = p_cityto.

*&Processamento
*&Se variavel de sistema ficar igual a zero significa que a selecao funcionou
IF sy-subrc = 0.

*&Loop para apresentar dados para o usuário
LOOP AT T_spli into w_spfli;
   writer: w_spfli-carrid, w_spli-connid.
ENDLOOP.

*&Se nao apresenta mensagem de nao encontrado
ELSE.
   write: "nothing found".
ENDIF.       