# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Perfil.create([{ :nome => 'Administrador' }, { :nome => 'Professor' }, { :nome => 'Aluno' }])
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
@si = Curso.find_by_nome('Sistemas de Informação');
Disciplina.create([{ :nome => 'Cálculo Diferencial e Integral', :cursos => [@si] }, 
                   { :nome => 'Computação Básica', :cursos => [@si] }, 
                   { :nome => 'Fundamentos de Sistemas de Informação', :cursos => [@si] }, 
                   { :nome => 'Inglês Instrumental', :cursos => [@si] },
                   { :nome => 'Lógica Matemática', :cursos => [@si] },
                   { :nome => 'Algoritmos e Estruturas de Dados I', :cursos => [@si] },
                   { :nome => 'Comunicação e Expressão', :cursos => [@si] },
                   { :nome => 'Estatística Computacional', :cursos => [@si] },
                   { :nome => 'Matemática Discreta', :cursos => [@si] },
                   { :nome => 'Arquitetura e Organização de Computadores', :cursos => [@si] },
                   { :nome => 'Algoritmos e Estruturas de Dados II', :cursos => [@si] },
                   { :nome => 'Linguagens Formais, Autômatos e Computabilidade', :cursos => [@si] },
                   { :nome => 'Programação com Orientação à Objetos', :cursos => [@si] },
                   { :nome => 'Sistemas Operacionais', :cursos => [@si] },
                   { :nome => 'Contabilidade e Finanças', :cursos => [@si] },
                   { :nome => 'Economia', :cursos => [@si] },
                   { :nome => 'Técnicas de Programação', :cursos => [@si] },
                   { :nome => 'Redes de Computadores I', :cursos => [@si] },
                   { :nome => 'Pesquisa e Ordenação de Dados', :cursos => [@si] },
                   { :nome => 'Psicologia Organizacional', :cursos => [@si] },
                   { :nome => 'Banco de Dados I', :cursos => [@si] },
                   { :nome => 'Direito e Legislação', :cursos => [@si] },
                   { :nome => 'Engenharia de Software', :cursos => [@si] },
                   { :nome => 'Banco de Dados II', :cursos => [@si] },
                   { :nome => 'Redes de Computadores II', :cursos => [@si] },
                   { :nome => 'Linguagens de Programação', :cursos => [@si] },
                   { :nome => 'Estágio Supervisionado I', :cursos => [@si] },
                   { :nome => 'Análise, Projeto e Implementação de Sistemas I', :cursos => [@si] },
                   { :nome => 'Sistemas Distribuídos', :cursos => [@si] },
                   { :nome => 'Computação Gráfica', :cursos => [@si] },
                   { :nome => 'Sistemas Multimídia', :cursos => [@si] },
                   { :nome => 'Estágio Supervisionado II', :cursos => [@si] },
                   { :nome => 'Análise, Projeto e Implementação de Sistemas II', :cursos => [@si] },
                   { :nome => 'Computador e Sociedade', :cursos => [@si] },
                   { :nome => 'Segurança de Sistemas', :cursos => [@si] },
                   { :nome => 'Inteligência Artificial', :cursos => [@si] },
                   { :nome => 'Estágio Supervisionado III', :cursos => [@si] },
                   { :nome => 'Trabalho de Conclusão de Curso I', :cursos => [@si] },
                   { :nome => 'Empreendedorismo em Computação', :cursos => [@si] },
                   { :nome => 'Gerenciamento de Projetos', :cursos => [@si] },
                   { :nome => 'Auditoria de Sistemas', :cursos => [@si] },
                   { :nome => 'Trabalho de Conclusão de Curso II', :cursos => [@si] },
                   { :nome => 'Estágio Supervisionado IV', :cursos => [@si] },
                   { :nome => 'Sistemas de Apoio à Decisão', :cursos => [@si] }])
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

# Users
@administrador = Perfil.find_by_nome('Administrador');
@professor = Perfil.find_by_nome('Professor');
@aluno = Perfil.find_by_nome('Aluno');
Pessoa.create([{ :nome => 'Administrador do Sistema', :email => 'admin@uni.com.br', :senha => '21232f297a57a5a743894a0e4a801fc3', :perfis => [@administrador] }])
Professor.create([{ :pessoa => Pessoa.create({ :nome => 'Professor de Teste', :email => 'professor@uni.com.br', :senha => '3f9cd3c7b11eb1bae99dddb3d05da3c5', :perfis => [@professor] }), :escolaridade => Escolaridade.first }])
Aluno.create([{ :pessoa => Pessoa.create({ :nome => 'Aluno de Teste', :email => 'aluno@uni.com.br', :senha => 'ca0cd09a12abade3bf0777574d9f987f', :perfis => [@aluno] }), :matricula => '12345', :cursos => [@si] }])