# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first) = 0

# Parameters
Parameter.create([{ :name => 'locale', :value => 'en' }])
Role.create([{ :name => 'Administrator' }, { :name => 'Professor' }, { :name => 'Student' }])
Scholarity.create([{ :name => 'Bacharel' }, { :name => 'Mestre' }, { :name => 'Doutor' }, { :name => 'Especialista' }])
CourseCategory.create([{ :name => 'Graduação' }, { :name => 'Pós-Graduação' }])

# Courses
Course.create([{ :code => 'SI', :name => 'Sistemas de Informação', :course_category => CourseCategory.first },
              { :code => 'AD', :name => 'Administração', :course_category => CourseCategory.first },
              { :code => 'CC', :name => 'Ciências Contábeis', :course_category => CourseCategory.first },
              { :code => 'DI', :name => 'Direito', :course_category => CourseCategory.first },
              { :code => 'JO', :name => 'Jornalismo', :course_category => CourseCategory.first },
              { :code => 'PE', :name => 'Pedagogia', :course_category => CourseCategory.first },
              { :code => 'PP', :name => 'Publicidade e Propaganda', :course_category => CourseCategory.first },
              { :code => 'LO', :name => 'Logística', :course_category => CourseCategory.first },
              { :code => 'NI', :name => 'Negócios Imobiliários', :course_category => CourseCategory.first }, 
              { :code => 'DG', :name => 'Design Gráfico', :course_category => CourseCategory.first }])
@si = Course.find_by_name('Sistemas de Informação');
Curriculum.create([{ :name => '2008', :course => @si }])
Discipline.create([{ :code => 'N011', :name => 'Cálculo Diferencial e Integral', :course => @si, :curriculums => [Curriculum.first] }, 
                   { :code => 'T009', :name => 'Computação Básica', :course => @si, :curriculums => [Curriculum.first] }, 
                   { :code => 'T019', :name => 'Fundamentos de Sistemas de Informação', :course => @si, :curriculums => [Curriculum.first] }, 
                   { :code => 'H145', :name => 'Inglês Instrumental', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'N009', :name => 'Lógica Matemática', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T001', :name => 'Algoritmos e Estruturas de Dados I', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'H144', :name => 'Comunicação e Expressão', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'N004', :name => 'Estatística Computacional', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'N010', :name => 'Matemática Discreta', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T005', :name => 'Arquitetura e Organização de Computadores', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T002', :name => 'Algoritmos e Estruturas de Dados II', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T023', :name => 'Linguagens Formais, Autômatos e Computabilidade', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T025', :name => 'Programação com Orientação à Objetos', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T032', :name => 'Sistemas Operacionais', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'A072', :name => 'Contabilidade e Finanças', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'A073', :name => 'Economia', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T033', :name => 'Técnicas de Programação', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T026', :name => 'Redes de Computadores I', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T024', :name => 'Pesquisa e Ordenação de Dados', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'A067', :name => 'Psicologia Organizacional', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T007', :name => 'Banco de Dados I', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'J080', :name => 'Direito e Legislação', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T013', :name => 'Engenharia de Software', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T008', :name => 'Banco de Dados II', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T027', :name => 'Redes de Computadores II', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T022', :name => 'Linguagens de Programação', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T014', :name => 'Estágio Supervisionado I', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T003', :name => 'Análise, Projeto e Implementação de Sistemas I', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T030', :name => 'Sistemas Distribuídos', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T010', :name => 'Computação Gráfica', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T031', :name => 'Sistemas Multimídia', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T015', :name => 'Estágio Supervisionado II', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T004', :name => 'Análise, Projeto e Implementação de Sistemas II', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T011', :name => 'Computador e Sociedade', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T028', :name => 'Segurança de Sistemas', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T021', :name => 'Inteligência Artificial', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T016', :name => 'Estágio Supervisionado III', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T036', :name => 'Trabalho de Conclusão de Course I', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'A077', :name => 'Empreendedorismo em Computação', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T020', :name => 'Gerenciamento de Projetos', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T006', :name => 'Auditoria de Sistemas', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T037', :name => 'Trabalho de Conclusão de Course II', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T017', :name => 'Estágio Supervisionado IV', :course => @si, :curriculums => [Curriculum.first] },
                   { :code => 'T029', :name => 'Sistemas de Apoio à Decisão', :course => @si, :curriculums => [Curriculum.first] }])
Professor.create([{ :person => Person.create({ :name => 'Antônio de Barros Serra' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Alexandre Silva Cavalcante' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Ciro Carneiro Coelho' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Cristiano Therrien' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Daniel Capelo Borges' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Danielle da Costa Filgueiras Albuquerque' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Eduardo Mendes de Oliveira' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Fabiana Nogueira Holanda' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Fláudio José Gonçalves' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Francisco Ivan de Oliveira' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Francisco Cristino de França Júnior' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Francisco A. Tavares F. Silva' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Glauber Ferreira Cintra' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Leandro da Silva Toledo' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Luiz Humberto Sucupira Júnior' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Luciano Comin Nunes' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Marum Simão Filho' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Marcelo Bezerra de Alcântara' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Mariana Aguiar Alcântara Brito' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Raimundo Sales Neto e Azevedo' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Rafael Leão Fonseca' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Régis Patrick Silva Simão' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Renato Barros da Costa' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Renato Simões' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Ricardo Aquino Coimbra' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Ricardo Bezerra de Menezes' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Rodrigo Pordeus Nascimento' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Tarciane de Castro Andrade' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Tiago Seixas' }), :scholarity => Scholarity.first }])
Professor.create([{ :person => Person.create({ :name => 'Wamberg Glaucon Chaves de Oliveira' }), :scholarity => Scholarity.first }])

# Users
@administrator = Role.find_by_name('Administrator');
@professor = Role.find_by_name('Professor');
@student = Role.find_by_name('Student');
Person.create([{ :name => 'Administrator', :email => 'admin@uni.com.br', :password => '21232f297a57a5a743894a0e4a801fc3', :roles => [@administrator] }])
Professor.create([{ :person => Person.create({ :name => 'Professor de Teste', :email => 'professor@uni.com.br', :password => '3f9cd3c7b11eb1bae99dddb3d05da3c5', :roles => [@professor] }), :scholarity => Scholarity.first }])
Student.create([{ :person => Person.create({ :name => 'Aluno de Teste', :email => 'aluno@uni.com.br', :password => 'ca0cd09a12abade3bf0777574d9f987f', :roles => [@student] }), :code => '12345', :curriculums => [Curriculum.first] }])
Student.create([{ :person => Person.create({ :name => 'Aluno de Teste 2', :email => 'aluno2@uni.com.br', :password => 'ca0cd09a12abade3bf0777574d9f987f', :roles => [@student] }), :code => '54321', :curriculums => [Curriculum.first] }])