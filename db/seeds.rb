# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Escolaridade.create([{ :nome => 'Bacharel' }, { :nome => 'Mestre' }, { :nome => 'Doutor' }, { :nome => 'Especialista' }])
CategoriaCurso.create([{ :nome => 'Graduação' }, { :nome => 'Pós-Graduação' }])
Curso.create([{ :nome => 'Sistemas de Informação', :categoria_curso => CategoriaCurso.first },
              { :nome => 'Administração', :categoria_curso => CategoriaCurso.first },
              { :nome => 'Ciências Contábeis', :categoria_curso => CategoriaCurso.first },
              { :nome => 'Direito', :categoria_curso => CategoriaCurso.first },
              { :nome => 'Jornalismo', :categoria_curso => CategoriaCurso.first },
              { :nome => 'Pedagogia', :categoria_curso => CategoriaCurso.first },
              { :nome => 'Publicidade e Propaganda', :categoria_curso => CategoriaCurso.first },
              { :nome => 'Logística', :categoria_curso => CategoriaCurso.first },
              { :nome => 'Negócios Imobiliários', :categoria_curso => CategoriaCurso.first }, 
              { :nome => 'Design Gráfico', :categoria_curso => CategoriaCurso.first }])
Disciplina.create([{ :nome => 'Cálculo Diferencial e Integral', :creditos => '20', :curso => Curso.first }, 
                   { :nome => 'Computação Básica', :creditos => '20', :curso => Curso.first }, 
                   { :nome => 'Fundamentos de Sistemas de Informação', :creditos => '20', :curso => Curso.first }, 
                   { :nome => 'Inglês Instrumental', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Lógica Matemática', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Algoritmos e Estruturas de Dados I', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Comunicação e Expressão', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Estatística Computacional', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Matemática Discreta', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Arquitetura e Organização de Computadores', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Algoritmos e Estruturas de Dados II', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Linguagens Formais, Autômatos e Computabilidade', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Programação com Orientação à Objetos', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Sistemas Operacionais', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Contabilidade e Finanças', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Economia', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Técnicas de Programação', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Redes de Computadores I', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Pesquisa e Ordenação de Dados', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Psicologia Organizacional', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Banco de Dados I', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Direito e Legislação', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Engenharia de Software', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Banco de Dados II', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Redes de Computadores II', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Linguagens de Programação', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Estágio Supervisionado I', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Análise, Projeto e Implementação de Sistemas I', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Sistemas Distribuídos', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Computação Gráfica', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Sistemas Multimídia', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Estágio Supervisionado II', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Análise, Projeto e Implementação de Sistemas II', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Computador e Sociedade', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Segurança de Sistemas', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Inteligência Artificial', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Estágio Supervisionado III', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Trabalho de Conclusão de Curso I', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Empreendedorismo em Computação', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Gerenciamento de Projetos', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Auditoria de Sistemas', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Trabalho de Conclusão de Curso II', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Estágio Supervisionado IV', :creditos => '20', :curso => Curso.first },
                   { :nome => 'Sistemas de Apoio à Decisão', :creditos => '20', :curso => Curso.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Antônio de Barros Serra' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Alexandre Silva Cavalcante' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Ciro Carneiro Coelho' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Cristiano Therrien' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Daniel Capelo Borges' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Danielle da Costa Filgueiras Albuquerque' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Eduardo Mendes de Oliveira' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Fabiana Nogueira Holanda' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Fláudio José Gonçalves' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Francisco Ivan de Oliveira' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Francisco Cristino de França Júnior' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Francisco A. Tavares F. Silva' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Glauber Ferreira Cintra' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Leandro da Silva Toledo' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Luiz Humberto Sucupira Júnior' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Luciano Comin Nunes' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Marum Simão Filho' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Marcelo Bezerra de Alcântara' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Mariana Aguiar Alcântara Brito' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Raimundo Sales Neto e Azevedo' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Rafael Leão Fonseca' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Régis Patrick Silva Simão' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Renato Barros da Costa' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Renato Simões' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Ricardo Aquino Coimbra' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Ricardo Bezerra de Menezes' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Rodrigo Pordeus Nascimento' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Tarciane de Castro Andrade' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Tiago Seixas' }), :escolaridade => Escolaridade.first }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Wamberg Glaucon Chaves de Oliveira' }), :escolaridade => Escolaridade.first }])