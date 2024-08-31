Program Lista_de_Contatos;
uses crt;

var
	matrizPerfils : array[1..100,1..3] of string;
	quantidade_contatos : integer;
	indice : integer;
	select_indice : integer;
	acao : integer;
	sair : boolean;
	
procedure Ver_Contato(select_indice : integer);
begin
	 writeln(' ');
	 write('Digite o �ndice do contato que voc� deseja ver: ');
	 readln(select_indice);
	 clrscr;
	 writeln('Visualizando contato...');
	 writeln('=== ', matrizPerfils[select_indice, 1],' ===');
	 writeln('Telefone: ', matrizPerfils[select_indice, 2]);
	 writeln('E-mail: ', matrizPerfils[select_indice, 3]);
	 write('Precione qualquer tecla para voltar...');
	 readln(); 
end;

procedure Editar_Contato(select_indice, acao : integer);
begin
	 writeln(' ');
	 write('Digite o �ndice do contato que voc� deseja editar: ');
	 readln(select_indice);
	 clrscr;
	 writeln('Editando contato...');
	 writeln(' ');  
	 writeln('Nome: ', matrizPerfils[select_indice, 1]);
	 writeln('Telefone: ', matrizPerfils[select_indice, 2]);
	 writeln('E-mail: ', matrizPerfils[select_indice, 3]);
	 writeln(' ');
	 writeln('[1] Editar nome [2] Editar telefone [3] Editar e-mail');
	 write('> ');
	 readln(acao);
	 case acao of
	 1 : begin
	 	write('Novo nome:');
	 	readln(matrizPerfils[select_indice, 1]);
	 end;
	 2 : begin 
	 	write('Novo telefone: ');
	 	readln(matrizPerfils[select_indice, 2]);
	 end;
	 3 : begin
	 	write('Novo e-mail: ');
		readln(matrizPerfils[select_indice, 3]); 	 
	 end;
	 end; 
end;

procedure Excluir_Contato(select_indice, quantidade_contatos : integer);
begin
	writeln(' ');
	write('Digite o �ndice do contato que voc� deseja excluir: ');
	readln(select_indice);
	while (select_indice <= quantidade_contatos) do
	begin
		matrizPerfils[select_indice, 1] := matrizPerfils[select_indice + 1, 1];
		matrizPerfils[select_indice, 2] := matrizPerfils[select_indice + 1, 2];
		matrizPerfils[select_indice, 3] := matrizPerfils[select_indice + 1, 3];
		select_indice := select_indice + 1;			
	end;
	quantidade_contatos := quantidade_contatos - 1;
end;

procedure Novo_Contato(quantidade_contatos : integer);
begin
	if (quantidade_contatos = 0) then
	begin
		writeln('Seja bem-vindo, fa�a seu CADASTRO');
	end
	else begin
	  clrscr;
	  writeln('=== NOVO CONTATO ===');
	end;
	write('Nome: ');
	readln(matrizPerfils[quantidade_contatos + 1, 1]);
	write('Telefone: ');
	readln(matrizPerfils[quantidade_contatos + 1, 2]);
	write('E-mail: ');
	readln(matrizPerfils[quantidade_contatos + 1, 3]);
end;
	
	
Begin
	sair := False;
	Novo_Contato(quantidade_contatos);
	quantidade_contatos := quantidade_contatos + 1;
	while (sair <> True) do
	begin
		clrscr;
		writeln('=== CONTATOS ===');
		writeln(' ');
		writeln('Lista de Contatos');
		for indice := 1 to quantidade_contatos do
		begin
				if (indice = 1) then
				begin
					writeln(indice,' - ',matrizPerfils[1, 1], ' [Meu Perfil]');
				end
				else begin
					writeln(indice,' - ',matrizPerfils[indice,1]);
				end;
		end;
		writeln(' ');
		writeln('[1] Ver Contato [2] Editar Contato [3] Excluir Contato [4] Adicionar Contato [5] Sair');
		write('> ');
		readln(acao);
		case acao of
		1 : begin
			Ver_Contato(select_indice);
			end;
		2 : begin
			Editar_Contato(select_indice, acao);
			end;
		3 : begin
			Excluir_Contato(select_indice, quantidade_contatos);
			end;
		4 : begin
			Novo_Contato(quantidade_contatos);
			quantidade_contatos := quantidade_contatos + 1;
			end;
		5 : begin
			sair := True;
			end;
		end;  	  
End.