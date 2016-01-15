program conjectura;
uses crt;

// CONJECTURA DE GOLDBACH
procedure goldbach(limitesuperior:longword);
var
   i,j,k,cont,numpares,numprimos:word; // cont serve para gerar os números pares
   vetorpar: array [1..65000] of word;
   testeprimo: boolean; // Testar serão ou nãoo primo
   vetorprimo: array [1..65000] of word;
   // cont tambémm serve para contar quais são os números primos e salvá-los em ordem crescente.

begin // begin procedure
  cont:= 2;
  i:=0;
  numpares:=0;

  // INICIA O VETOR CRIADOR DE NÚMEROS PARES ATÉ O LIMITE SUPERIOR INFORMADO
  repeat
    inc(i);
    cont := 2 + cont;
    vetorpar[i]:= cont; // Cria um vetor com os números pares encontrados
  until(cont>=limitesuperior);

for i:= 1 to ((limitesuperior div 2)-1) do
 begin
  inc(numpares);
  //writeln (vetorpar[i]);
 end;

 // FIM DO VETOR CRIADOR DE NÚMEROS PARES

cont:=0;
numprimos:=0;

// INICIO DO VETOR CRIADOR DE NÚMEROS PRIMOS
for i:= 2 to limitesuperior do // Início for 1
  begin
    testeprimo := true;
    for j:= 2 to ( i - 1 ) do // Início for 2
    begin
      if ( i mod j = 0 ) then
      begin
        testeprimo := false;
      end;
    end; // end for 2
    if ( testeprimo = true ) then
    begin
     inc(cont);
     vetorprimo[cont]:= i;
    end;
  end; // end for 1

for i:= 1 to cont do
  begin
    inc(numprimos);
    //writeln (vetorprimo[i]);
  end;

  // FIM DO VETOR CRIADOR DE NÚMEROS PRIMOS

  // IMPLEMENTAÇÃO DA CONJECTURA DE GOLDBACH

for i:= 1 to numpares do
 begin // Início for 1
  for j:= 1 to numprimos do
   begin // Início for 2
    for k:=1 to numprimos do
     begin
      if (vetorpar[i] = (vetorprimo[j] + vetorprimo[k])) then
      begin
       writeln('Goldbach ',vetorpar[i],' = ', vetorprimo[j] ,' + ' , vetorprimo[k], ' (OK)');
       break;
      end; // end if
     end; // end for k
   end; // end for j
 end; // end for i

  // FIM DA IMPLEMENTAÇÃO DA CONJECTURA DE GODBACH

end; // end procedure goldbach

// CONJECTURA DE COLLATZ
procedure collatz(limitesuperior: longword);
var n, result, aux : longint;
   // n é o número que está sendo analisado
   // result é o resultado da multiplicação se for ímpar ou divisão por 2 se for par
begin
for n:= 1 to limitesuperior do
 begin
 if n = 1 then // se o número é 1 então já imprime o ok
 begin
   writeln ('Collatz 1 -> 1 -> (OK)');
 end
 else
 begin
 aux:= n;  // aux recebe o valor de n para não ocorrer erro de looping na variá¡vel
 write ('Collatz ',aux,' -> ');
  repeat
    if (aux mod 2 = 0) then // se é par...
      begin
        result:=0;
        result:= aux DIV 2; // o resultado recebe o auxiliar de n dividido por 2
        if result = 1 then  // se o resultado é 1 então imprime o ok
        begin
          write ('1 (OK)');
        end
        else
        begin
          write (result, ' -> ');
        end;
        aux:=result;
      end
      else  // se for ímpar...
      begin
        result:=0;
        result:= (3 * aux) + 1; // resultado recebe o auxiliar de n vezes 3 + 1
        write (result, ' -> ');
        aux:=result;
      end;
  until (aux = 1); // até que o auxiliar de n seja igual a 1 para todos os números
  writeln ;
 end; // end else
 end; // end for
end; //end procedure

// FIM CONJECTURA DE COLLATZ

var
opcao_conjectura : char;
limite_superior : longword;

begin //Início corpo do programa
repeat
clrscr;
writeln('Verificador de Conjectura');
writeln('=========== == ==========');
writeln;
writeln('Verificar Goldbach (G) ou Collatz (C):');
readln(opcao_conjectura);
clrscr;
if((lowercase(opcao_conjectura)<>'g') and (lowercase(opcao_conjectura)<>'c')) then
  begin
    writeln('Opção inválida');
    readln;
  end;
until((lowercase(opcao_conjectura)='g') or (lowercase(opcao_conjectura)='c'));
writeln;
if ((lowercase(opcao_conjectura)) = 'g') then
 begin
  repeat
   clrscr;
   writeln('Digite o limite superior');
   readln(limite_superior);
    if (limite_superior < 4) or (limite_superior > 65000) then
     begin
      writeln ('Opção inválida');
      readln ;
     end;
  until (limite_superior > 3) and (limite_superior < 65001);
 end;
if ((lowercase(opcao_conjectura)) = 'c') then
 repeat
  begin
   clrscr ;
   writeln('Digite o limite superior');
   readln(limite_superior);
   if (limite_superior > 65000) then
     begin
      writeln ('Opção inválida');
      readln ;
     end;
  end;
 until (limite_superior <= 65000);
writeln;
case lowercase(opcao_conjectura) of
'g': goldbach(limite_superior);
'c': collatz(limite_superior);
end; //end case
readln;
end. //end programa
