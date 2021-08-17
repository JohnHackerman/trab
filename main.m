%%%%                                                  NOTAS DE ATUALIZA��O!!!!
%%%%
%%%%          ADICIONADO Q5, Q6, Q7 e Q8 (Imbutidas).
%%%%          ADICIONADO DOIS AMBIENTES DE TESTE O Testes QUE J� TINHA E O test PARA MELHOR FLEXIBILIDADE.COM ISSO FORAM EXCLUIDOS OS ARQUIVOS q3 E O PLOT_TABELA_TEST
%%%%          MELHORIAS NA VISUALIZA��O DO CODE E PLOTAGEM.
%%%%          ACERTOS NO CODIGO NAS QUESTOES 3, 5, 6, 7.
%%%5
%%%%          PROBLEMAS NO PLOT GRAFICO, QUANDO JUNTO A Q3 E Q5 O ULTIMO GRADICO DA Q3 BUGA E N�O PLOTA, OU SE PLOTA, PLOTA JUNTO COM A A DA Q5.
%%%%          PROBLEMAS AINDA NA Q5 NO ULTIMO PVI O PLOT EST� ESTRANHO .
%%%%          PROBLEMAS NA QUESTAO 6, O MODULO DO ERRO N�O EST� FUNCIONANDO, APENAS DO PLOT ESTA CERTO FICA DANDO MENSAGENS NA JANELA DE COMANDO,POIS O NUMERO DA NEGATIVO E N�O EXISTE LOG NEGATIVO.
%%%%          PROBLEMAS NA QUEST�O 6, N�O CONSEGUI RESOLVER O PROBLEMA DO ODE45 PASSO ADPT O N�O EST� PLOTANDO.
%%%%          
%%%%          VERIFICAR FUN��O Fehlberg45, ACHAR RESOLU��O DO PROBLEMA.
%%%%          VERIFICA��O DAS OUTRAS FUN��ES PARA MELHOR VISUALIZA��O DA JANELA DE COMANDOS.



fprintf('Solu��o da Quest�o 1 : Determine a solu�ao anal�tica y(x) de cada PVI. \n\n');

%[f, sol, PVIstr, yx, yxstr] = solveEDO('y*log(x+1)', 0, 1) 
[f, sol, PVIstr] = solveEDO('y*log(x+1)', 0, 1) 

%[f, sol, PVIstr, yx, yxstr] = solveEDO('y*(x**2 -1)', 0, 1) 
[f, sol, PVIstr] = solveEDO('y*(x**2 -1)', 0, 1) 

%[f, sol, PVIstr, yx, yxstr] = solveEDO('1-(y/x)', 0, 1) 
[f, sol, PVIstr] = solveEDO('1-(y/x)', 0, 1) 


%------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\


fprintf ('\n\nSolu��o da Quest�o 2 : Converta a solu�ao em uma fun��o n�ao-simb�lica.\n\n');


[~, ~, ~, yx, yxstr] = solveEDO('y*log(x+1)', 0, 1) 

[~, ~, ~, yx, yxstr] = solveEDO('y*(x**2 -1)', 0, 1) 

[~, ~, ~, yx, yxstr] = solveEDO('1-(y/x)', 0, 1) 


%------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\


fprintf ('\n\nSolu��o da Quest�o 3 : Discretize a vari�vel independente a partir de x0, calcule o valor da fun�ao anal�tica e desenhe:.\n\n');


func1 = @(x,y) y*log(x+1); % Primeira EDO
func2 = @(x,y) y*(x**2 -1); % Segunda EDO
func3 = @(x,y) 1-(y/x); % Terceira EDO

  x0 = 0;
  y0 = 1;
  h = 0.1;
  n = 10;
  x0_c = 1;
  y0_c = 1;
  xx = 0:0.1:1;
  xx3 = 1:0.1:2;
  
  
%%%_ - _ - __ - _ - __ - _ - _Primeira Fun��o_ - _ - __ - _ - __ - _ - _


for i=1:length(xx)
  [X, Y_a] = Euler(func1, x0, y0, h, n );
  [X, A_a] = EulerMelhorado(func1, x0, y0, h, n );
  [X, B_a] = EulerModificado(func1, x0, y0, h, n );
  [X, C_a] = Fehlberg12(func1, x0, y0, h, n );
  [X, D_a] = Fehlberg45(func1, x0, y0, h, n );
  passofixo = true;
  [X, E_a] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_a, F_adpt_a] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
end
  plot(xx,Y_a,'--*k', xx,A_a,'-r',  xx,B_a,'--b','linewidth',2,  xx,C_a,'--y','linewidth',2,  xx,D_a,'--*d',  xx,E_a,'--g','linewidth',3, X_adpt_a, F_adpt_a,'--*m');
  title("PVI : y' = ln(x + 1), com x0=0,y0=1",'fontsize',20)
  xlabel('x','fontsize',20);
  ylabel('y','fontsize',20);
  grid on;
  legend('Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45ADPT','location','northwest');
  hold on;
  
  
%%%_ - _ - __ - _ - __ - _ - _Segunda Fun��o_ - _ - __ - _ - __ - _ - _


for i=1:length(xx)
  [X, Y_b] = Euler(func2, x0, y0, h, n );
  [X, A_b] = EulerMelhorado(func2, x0, y0, h, n );
  [X, B_b] = EulerModificado(func2, x0, y0, h, n );
  [X, C_b] = Fehlberg12(func2, x0, y0, h, n );
  [X, D_b] = Fehlberg45(func2, x0, y0, h, n );
  passofixo = true;
  [X, E_b] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_b, F_adpt_b] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
end
  figure
  plot(xx,Y_b,'--*k', xx,A_b,'-r',  xx,B_b,'--b','linewidth',2,  xx,C_b,'--y','linewidth',2,  xx,D_b,'--*d',  xx,E_b,'--g','linewidth',3, X_adpt_b, F_adpt_b,'--*m');
  title("PVI : y�=y*(x�-1), com x0=0,y0=1",'fontsize',20)
  xlabel('x','fontsize',20);
  ylabel('y','fontsize',20);
  grid on;
  legend('Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45APDT','location','northwest');
  hold on;


%%%% _ - _ - __ - _ - __ - _ - _Terceira Fun��o_ - _ - __ - _ - __ - _ - _


for i=1:length(xx)
  [X, Y_c] = Euler(func3, x0_c, y0, h, n );
  [X, A_c] = EulerMelhorado(func3, x0_c, y0, h, n );
  [X, B_c] = EulerModificado(func3, x0_c, y0, h, n );
  [X, C_c] = Fehlberg12(func3, x0_c, y0, h, n );
  [X, D_c] = Fehlberg45(func3, x0_c, y0, h, n );
  passofixo = true;
  [X, E_c] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_c, F_adpt_c] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0, h, n, passofixo );
end
  figure
  plot(xx3,Y_c,'--*k', xx3,A_c,'-r',  xx3,B_c,'--b','linewidth',2,  xx3,C_c,'--y','linewidth',2,  xx3,D_c,'--*d',  xx3,E_c,'--g','linewidth',3, X_adpt_c, F_adpt_c,'--*m');
  title("PVI : y�=1-y/x, com x0=1,y0=1",'fontsize',20)
  xlabel('x','fontsize',20);
  ylabel('y','fontsize',20);
  grid on;
  legend('Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45APDT','location','northwest');
  hold on;
  hold off;
  
%------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\


fprintf ('\n\nSolu��o da Quest�o 4 : Calcule as aproxima��es da solu��o anal�tica, usando os seguintes m�todos:\n\n'); 


func1 = @(x,y) y*log(x+1); % Primeira EDO
func2 = @(x,y) y*(x**2 -1); % Segunda EDO
func3 = @(x,y) 1-(y/x); % Terceira EDO 


x0 = 0;
y0 = 1;
h = 0.1;
n = 10;
x0_c = 1;
y0_c = 1;
f = '%8.6f';


fprintf('\n\nFuncao: y(x)= (x + 1) .* exp (x .* (log (x + 1) - 1))\n\n')


[X, Y] = Euler(func1, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler');

[X, Y] = EulerMelhorado(func1, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler Melhorado');

[X, Y] = EulerModificado(func1, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler Modificado');

[X, Y] = Fehlberg12(func1, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Fehlberg RK(1)2')

[X, Y] = Fehlberg45(func1, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Fehlberg RK(4)5')

passofixo = true;
[X, Y] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
printTabXY( X, 'X', Y, 'Y', f, 'Dormand-Prince - Passo fixo' );

passofixo = false;
[X, Y] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
printTabXY( X, 'X', Y, 'Y', f, 'Dormand-Prince - Passo adaptativo' );


fprintf('\n\nFuncao: y(x)= exp (x .* (x .^ 2 - 3) / 3)\n\n')


[X, Y] = Euler(func2, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler');

[X, Y] = EulerMelhorado(func2, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler Melhorado');

[X, Y] = EulerModificado(func2, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler Modificado');

[X, Y] = Fehlberg12(func2, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Fehlberg RK(1)2')

[X, Y] = Fehlberg45(func2, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Fehlberg RK(4)5')

passofixo = true;
[X, Y] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
printTabXY( X, 'X', Y, 'Y', f, 'Dormand-Prince - Passo fixo' );

passofixo = false;
[X, Y] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
printTabXY( X, 'X', Y, 'Y', f, 'Dormand-Prince - Passo adaptativo' );


fprintf('\n\nFuncao: y(x)= x / 2\n\n')


[X, Y] = Euler(func3, x0_c, y0_c, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler');

[X, Y] = EulerMelhorado(func3, x0_c, y0_c, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler Melhorado');

[X, Y] = EulerModificado(func3, x0_c, y0_c, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler Modificado');

[X, Y] = Fehlberg12(func3, x0_c, y0_c, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Fehlberg RK(1)2')

[X, Y] = Fehlberg45(func3, x0_c, y0_c, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Fehlberg RK(4)5')

passofixo = true;
[X, Y] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0_c, h, n, passofixo );
printTabXY( X, 'X', Y, 'Y', f, 'Dormand-Prince - Passo fixo' );

passofixo = false;
[X, Y] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0_c, h, n, passofixo );
printTabXY( X, 'X', Y, 'Y', f, 'Dormand-Prince - Passo adaptativo' );


%------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\


fprintf ('\n\nSolu��o da Quest�o 5 : Insira os pontos (xi, yi) de cada m�todo no gr�fico junto com a fun�ao verdadeira y(x) :\n\n');


func1 = @(x,y) y*log(x+1); % Primeira EDO
funcv1 = @(x) (x + 1) .* exp (x .* (log (x + 1) - 1)); %Solu��o analitica n�o simbolica primeira EDO
func2 = @(x,y) y*(x**2 -1); % Segunda EDO
funcv2 = @(x) exp (x .* (x .^ 2 - 3) / 3);%Solu��o analitica n�o simbolica segunda EDO
func3 = @(x,y) 1-(y/x); % Terceira EDO
funcv3 = @(x) x / 2; %Solu��o analitica n�o simbolica terceira EDO

  x0 = 0;
  y0 = 1;
  h = 0.1;
  n = 10;
  x0_c = 1;
  y0_c = 1;
  x = 0:0.1:1;
  xx3 = 1:0.1:2;
  
  
%%%_ - _ - __ - _ - __ - _ - _Primeira Fun��o_ - _ - __ - _ - __ - _ - _


for i=1:length(x)
  [X, Y_a] = Euler(func1, x0, y0, h, n );
  [X, A_a] = EulerMelhorado(func1, x0, y0, h, n );
  [X, B_a] = EulerModificado(func1, x0, y0, h, n );
  [X, C_a] = Fehlberg12(func1, x0, y0, h, n );
  [X, D_a] = Fehlberg45(func1, x0, y0, h, n );
  passofixo = true;
  [X, E_a] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_a, F_adpt_a] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
end
  
  hold off;
  plot(x,funcv1(X),'--m','linewidth',3,x,Y_a,'*-k', x,A_a,'-r','linewidth',2,  x,B_a,'-db',  x,C_a,'--py','linewidth',2,  x,D_a,'*d',  x,E_a,'+g','linewidth',2, X_adpt_a, F_adpt_a,'-oc');
  title("PVI : y' = ln(x + 1), com x0=0,y0=1",'fontsize',20)
  xlabel('x','fontsize',20);
  ylabel('y','fontsize',20);
  grid on;
  legend('y(x)=(x + 1) .* exp (x .* (log (x + 1) - 1)','Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45ADPT','location','northwest');
  hold on;


%%%_ - _ - __ - _ - __ - _ - _Segunda Fun��o_ - _ - __ - _ - __ - _ - _


for i=1:length(x)
  [X, Y_b] = Euler(func2, x0, y0, h, n );
  [X, A_b] = EulerMelhorado(func2, x0, y0, h, n );
  [X, B_b] = EulerModificado(func2, x0, y0, h, n );
  [X, C_b] = Fehlberg12(func2, x0, y0, h, n );
  [X, D_b] = Fehlberg45(func2, x0, y0, h, n );
  passofixo = true;
  [X, E_b] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_b, F_adpt_b] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
end
  figure
  plot(x,funcv2(x),'--m','linewidth',3,x,Y_b,'*-k', x,A_b,'-r','linewidth',2,  x,B_b,'-db',  x,C_b,'--py','linewidth',2,  x,D_b,'*d',  x,E_b,'+g','linewidth',2, X_adpt_b, F_adpt_b,'-oc');
  title("PVI : y�=y*(x�-1), com x0=0,y0=1",'fontsize',20)
  xlabel('x','fontsize',20);
  ylabel('y','fontsize',20);
  grid on;
  legend('y(x)= exp (x .* (x .^ 2 - 3) / 3)','Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45APDT','location','northwest');
  hold on;


%%%% _ - _ - __ - _ - __ - _ - _Terceira Fun��o_ - _ - __ - _ - __ - _ - _


for i=1:length(xx3)
  [X, Y_c] = Euler(func3, x0_c, y0, h, n );
  [X, A_c] = EulerMelhorado(func3, x0_c, y0, h, n );
  [X, B_c] = EulerModificado(func3, x0_c, y0, h, n );
  [X, C_c] = Fehlberg12(func3, x0_c, y0, h, n );
  [X, D_c] = Fehlberg45(func3, x0_c, y0, h, n );
  passofixo = true;
  [X, E_c] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_c, F_adpt_c] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0, h, n, passofixo );
end

  
  %%%               -----______-----______-----______DANGER_____-----______-----______
  
  
  %%%         plot(x,funcv3(x),'--m');
  %%%         Resultado n�o est� batendo, embora a fun��o esteja certa
  %%%         testes feito solo prova que est� certo, algum erro que n�o consigo ver depois do for acontece     
  
  
figure
plot(xx3,funcv3(xx3),'--m',xx3,Y_c,'--*k', xx3,A_c,'-r',  xx3,B_c,'--b','linewidth',2,  xx3,C_c,'--y','linewidth',2,  xx3,D_c,'--*d',  xx3,E_c,'--g','linewidth',3, X_adpt_c, F_adpt_c,'-oc');
title("PVI : y�=1-y/x, com x0=1,y0=0",'fontsize',20)
xlabel('x','fontsize',20);
ylabel('y','fontsize',20);
grid on;
legend('y(x)= x / 2','Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45APDT','location','northwest');
hold on;
  
  
%------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\


fprintf ('\n\nSolu��o da Quest�o 6 : Gere um no gr�fico de erros de cada m�todo relativo � fun�ao verdadeira y(x), com eixo y logar�tmic:.\n\n');


func1 = @(x,y) y*log(x+1); % Primeira EDO
funcv1 = @(x) (x + 1) .* exp (x .* (log (x + 1) - 1)); %Solu��o analitica n�o simbolica primeira EDO
func2 = @(x,y) y*(x**2 -1); % Segunda EDO
funcv2 = @(x) exp (x .* (x .^ 2 - 3) / 3);%Solu��o analitica n�o simbolica segunda EDO
func3 = @(x,y) 1-(y/x); % Terceira EDO
funcv3 = @(x) x / 2; %Solu��o analitica n�o simbolica terceira EDO

  x0 = 0;
  y0 = 1;
  h = 0.1;
  n = 10;
  x0_c = 1;
  y0_c = 1;
  x = 0:0.1:1;
  xx3 = 1:0.1:2;
  
%%%_ - _ - __ - _ - __ - _ - _Primeira Fun��o_ - _ - __ - _ - __ - _ - _


for i=1:length(x)
  [X, Y_a] = Euler(func1, x0, y0, h, n );
  [X, A_a] = EulerMelhorado(func1, x0, y0, h, n );
  [X, B_a] = EulerModificado(func1, x0, y0, h, n );
  [X, C_a] = Fehlberg12(func1, x0, y0, h, n );
  [X, D_a] = Fehlberg45(func1, x0, y0, h, n );
  passofixo = true;
  [X, E_a] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_a, F_adpt_a] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
end

  semilogy(x,funcv1(X)-Y_a,'*-k', x,funcv1(X)-A_a,'-r','linewidth',2,  x,funcv1(X)-B_a,'-db',  x,funcv1(X)-C_a,'--py','linewidth',2,  x,funcv1(X)-D_a,'*d',  x,funcv1(X)-E_a,'-+g');%, X_adpt_a, funcv1(X)-F_adpt_a,'-oc');   ------RESOLVER-----
  title("PVI : y' = ln(x + 1), com x0=0,y0=1",'fontsize',20)
  xlabel('x','fontsize',20);
  ylabel('y','fontsize',20);
  grid on;
  legend('Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45ADPT','location','northwest');
  hold on;


%%%_ - _ - __ - _ - __ - _ - _Segunda Fun��o_ - _ - __ - _ - __ - _ - _


for i=1:length(x)
  [X, Y_b] = Euler(func2, x0, y0, h, n );
  [X, A_b] = EulerMelhorado(func2, x0, y0, h, n );
  [X, B_b] = EulerModificado(func2, x0, y0, h, n );
  [X, C_b] = Fehlberg12(func2, x0, y0, h, n );
  [X, D_b] = Fehlberg45(func2, x0, y0, h, n );
  passofixo = true;
  [X, E_b] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_b, F_adpt_b] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
end
  figure

  semilogy(x, abs(funcv2(X)-Y_b),'*-k', x,abs(funcv2(X)-A_b),'-r','linewidth',2,  x,abs(funcv2(X)-B_b),'-db',  x,abs(funcv2(X)-C_b),'--py','linewidth',2,  x,abs(funcv2(X)-D_b),'*d',  x,abs(funcv2(X)-E_b),'-+g');%, X_adpt_b,abs(funcv2(X)-F_adpt_b),'-oc');    ------RESOLVER-----   
  title("PVI : y�=y*(x�-1), com x0=0,y0=1",'fontsize',20)
  xlabel('x','fontsize',20);
  ylabel('y','fontsize',20);
  grid on;
  legend('Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45APDT','location','northwest');
  hold on;
 

 
%%%% _ - _ - __ - _ - __ - _ - _Terceira Fun��o_ - _ - __ - _ - __ - _ - _

x = 1:0.1:2;

for i=1:length(xx3)
  [X, Y_c] = Euler(func3, x0_c, y0, h, n );
  [X, A_c] = EulerMelhorado(func3, x0_c, y0, h, n );
  [X, B_c] = EulerModificado(func3, x0_c, y0, h, n );
  [X, C_c] = Fehlberg12(func3, x0_c, y0, h, n );
  [X, D_c] = Fehlberg45(func3, x0_c, y0, h, n );
  passofixo = true;
  [X, E_c] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_c, F_adpt_c] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0, h, n, passofixo );
end

figure
  semilogy(xx3,funcv3(x)-Y_c,'-*k', xx3,funcv3(x)-A_c,'-r','linewidth',2,  xx3,funcv3(x)-B_c,'-db',  xx3,funcv3(x)-C_c,'--py',  xx3,funcv3(x)-D_c,'*d',  xx3,funcv3(x)-E_c,'-+g');%, X_adpt_c, funcv3(x)-F_adpt_c,'-oc');     ------RESOLVER-----
  title("PVI : y�=1-y/x, com x0=1,y0=0",'fontsize',20)
  xlabel('x','fontsize',20);
  ylabel('y','fontsize',20);
  grid on;
  legend('Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45APDT','location','northwest');
  hold on
  

%------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\------------------------\\

 
fprintf ('\n\n\nSolu��o da Quest�o 7 : Mostre uma tabela com os valores de cada m�todo:\n\n');


func1 = @(x,y) y*log(x+1); % Primeira EDO
funcv1 = @(x) (x + 1) .* exp (x .* (log (x + 1) - 1)); %Solu��o analitica n�o simbolica primeira EDO
func2 = @(x,y) y*(x**2 -1); % Segunda EDO
funcv2 = @(x) exp (x .* (x .^ 2 - 3) / 3);%Solu��o analitica n�o simbolica segunda EDO
func3 = @(x,y) 1-(y/x); % Terceira EDO
funcv3 = @(x) x / 2; %Solu��o analitica n�o simbolica terceira EDO


  x0 = 0;
  y0 = 1;
  h = 0.1;
  n = 10;
  x0_c = 1;
  y0_c = 1;
  xx = 0:0.1:1;
  xx3 = 1:0.1:2;
 

%%%_ - _ - __ - _ - __ - _ - _Primeira Fun��o_ - _ - __ - _ - __ - _ - _

 
fprintf('PVI: ===> Funcao: y(x)= (x + 1) .* exp (x .* (log (x + 1) - 1))\n\n')
fprintf('%8s | %12s | %12s | %12s | %12s | %12s | %12s | %12s \n', 'X','Valor Ex.','Euler', 'Euler Mel.', 'Euler Mod.', 'Fehlb12', 'Fehlb45', 'ODE45 fixo');
fprintf('-----------------------------------------------------------------------------------------------------------------\n');

for i=1:length(xx)
  [X, Y_a] = Euler(func1, x0, y0, h, n );
  [X, A_a] = EulerMelhorado(func1, x0, y0, h, n );
  [X, B_a] = EulerModificado(func1, x0, y0, h, n );
  [X, C_a] = Fehlberg12(func1, x0, y0, h, n );
  [X, D_a] = Fehlberg45(func1, x0, y0, h, n );
  passofixo = true;
  [X, E_a] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
	fprintf('%.6f | %12.6f | %12.6f | %12.6f | %12.6f | %12.6f | %12.6f | %12.6f \n', xx(i), funcv1(X(i)), Y_a(i), A_a(i), B_a(i), C_a(i), D_a(i), E_a(i));
end


fprintf('\nErros\n\n');

for i=1:length(xx)
  [X, Y_a] = Euler(func1, x0, y0, h, n );
  [X, A_a] = EulerMelhorado(func1, x0, y0, h, n );
  [X, B_a] = EulerModificado(func1, x0, y0, h, n );
  [X, C_a] = Fehlberg12(func1, x0, y0, h, n );
  [X, D_a] = Fehlberg45(func1, x0, y0, h, n );
  passofixo = true;
  [X, E_a] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
  fprintf('%.6f | %.6e | %.6e | %.6e | %.6e | %.6e | %.6e | %.6e \n', xx(i), abs(funcv1(X(i))-funcv1(X(i))), abs(funcv1(X(i))-Y_a(i)), abs(funcv1(X(i))-A_a(i)), abs(funcv1(X(i))-B_a(i)), abs(funcv1(X(i))-C_a(i)), abs(funcv1(X(i))-D_a(i)), abs(funcv1(X(i))-E_a(i)));
end


%%%_ - _ - __ - _ - __ - _ - _Segunda Fun��o_ - _ - __ - _ - __ - _ - _


fprintf('\n\n\nPVI: ===> Funcao: y(x)= exp (x .* (x .^ 2 - 3) / 3)\n\n');

fprintf('%8s | %12s | %12s | %12s | %12s | %12s | %12s | %12s \n', 'X','Valor Ex.','Euler', 'Euler Mel.', 'Euler Mod.', 'Fehlb12', 'Fehlb45', 'ODE45 fixo');
fprintf('-----------------------------------------------------------------------------------------------------------------\n');

for i=1:length(xx)
  [X, Y_b] = Euler(func2, x0, y0, h, n );
  [X, A_b] = EulerMelhorado(func2, x0, y0, h, n );
  [X, B_b] = EulerModificado(func2, x0, y0, h, n );
  [X, C_b] = Fehlberg12(func2, x0, y0, h, n );
  [X, D_b] = Fehlberg45(func2, x0, y0, h, n );
  passofixo = true;
  [X, E_b] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
	fprintf('%.6f | %12.6f | %12.6f | %12.6f | %12.6f | %12.6f | %12.6f | %12.6f \n', xx(i), funcv2(X(i)), Y_b(i), A_b(i), B_b(i), C_b(i), D_b(i), E_b(i));
end


fprintf('\nErros\n\n');


for i=1:length(xx)
  [X, Y_b] = Euler(func2, x0, y0, h, n );
  [X, A_b] = EulerMelhorado(func2, x0, y0, h, n );
  [X, B_b] = EulerModificado(func2, x0, y0, h, n );
  [X, C_b] = Fehlberg12(func2, x0, y0, h, n );
  [X, D_b] = Fehlberg45(func2, x0, y0, h, n );
  passofixo = true;
  [X, E_b] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
	fprintf('%.6f | %.6e | %.6e | %.6e | %.6e | %.6e | %.6e | %.6e \n', xx(i), abs(funcv2(X(i))-funcv2(X(i))), abs(funcv2(X(i))-Y_b(i)), abs(funcv2(X(i))-A_b(i)), abs(funcv2(X(i))-B_b(i)), abs(funcv2(X(i))-C_b(i)), abs(funcv2(X(i))-D_b(i)), abs(funcv2(X(i))-E_b(i)));
end



%%%% _ - _ - __ - _ - __ - _ - _Terceira Fun��o_ - _ - __ - _ - __ - _ - _


fprintf('\n\nPVI: ===> Funcao: y(x)= x / 2\n\n');

fprintf('%8s | %12s | %12s | %12s | %12s | %12s | %12s | %12s \n', 'X','Valor Ex.','Euler', 'Euler Mel.', 'Euler Mod.', 'Fehlb12', 'Fehlb45', 'ODE45 fixo');
fprintf('------------------------------------------------------------------------------------------------------------------\n');

for i=1:length(xx3)
  [X, Y_c] = Euler(func3, x0_c, y0, h, n );
  [X, A_c] = EulerMelhorado(func3, x0_c, y0, h, n );
  [X, B_c] = EulerModificado(func3, x0_c, y0, h, n );
  [X, C_c] = Fehlberg12(func3, x0_c, y0, h, n );
  [X, D_c] = Fehlberg45(func3, x0_c, y0, h, n );
  passofixo = true;
  [X, E_c] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0, h, n, passofixo );
	fprintf('%.6f | %12.6f | %12.6f | %12.6f | %12.6f | %12.6f | %12.6f | %12.6f \n', xx3(i), funcv3(X(i)), Y_c(i), A_c(i), B_c(i), C_c(i), D_c(i), E_c(i));
end


fprintf('\nErros\n\n');


for i=1:length(xx3)
  [X, Y_c] = Euler(func3, x0_c, y0, h, n );
  [X, A_c] = EulerMelhorado(func3, x0_c, y0, h, n );
  [X, B_c] = EulerModificado(func3, x0_c, y0, h, n );
  [X, C_c] = Fehlberg12(func3, x0_c, y0, h, n );
  [X, D_c] = Fehlberg45(func3, x0_c, y0, h, n );
  passofixo = true;
  [X, E_c] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0, h, n, passofixo );
	fprintf('%.6f | %.6e | %.6e | %.6e | %.6e | %.6e | %.6e | %.6e \n', xx3(i), abs(funcv3(X(i))-funcv3(X(i))), abs(funcv3(X(i))-Y_c(i)), abs(funcv3(X(i))-A_c(i)), abs(funcv3(X(i))-B_c(i)), abs(funcv3(X(i))-C_c(i)), abs(funcv3(X(i))-D_c(i)), abs(funcv3(X(i))-E_c(i)));
end

