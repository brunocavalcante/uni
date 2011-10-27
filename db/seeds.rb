# encoding: UTF-8

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

# Roles
@administrator = Role.find_by_name('Administrator');
@professor = Role.find_by_name('Professor');
@student = Role.find_by_name('Student');

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

# Curriculum
Curriculum.create([{ :code => '20081', :name => '2008.1', :course => @si }])

# Disciplines
Discipline.create([{ :code => 'N011', :name => 'Cálculo Diferencial e Integral', :course => @si, :version => 1, :curriculums => [Curriculum.first] }, 
                   { :code => 'T009', :name => 'Computação Básica', :course => @si, :version => 1, :curriculums => [Curriculum.first] }, 
                   { :code => 'T019', :name => 'Fundamentos de Sistemas de Informação', :course => @si, :version => 1, :curriculums => [Curriculum.first] }, 
                   { :code => 'H145', :name => 'Inglês Instrumental', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'N009', :name => 'Lógica Matemática', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T001', :name => 'Algoritmos e Estruturas de Dados I', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'H144', :name => 'Comunicação e Expressão', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'N004', :name => 'Estatística Computacional', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'N010', :name => 'Matemática Discreta', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T005', :name => 'Arquitetura e Organização de Computadores', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T002', :name => 'Algoritmos e Estruturas de Dados II', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T023', :name => 'Linguagens Formais, Autômatos e Computabilidade', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T025', :name => 'Programação com Orientação à Objetos', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T032', :name => 'Sistemas Operacionais', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'A072', :name => 'Contabilidade e Finanças', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'A073', :name => 'Economia', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T033', :name => 'Técnicas de Programação', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T026', :name => 'Redes de Computadores I', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T024', :name => 'Pesquisa e Ordenação de Dados', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'A067', :name => 'Psicologia Organizacional', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T007', :name => 'Banco de Dados I', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'J080', :name => 'Direito e Legislação', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T013', :name => 'Engenharia de Software', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T008', :name => 'Banco de Dados II', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T027', :name => 'Redes de Computadores II', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T022', :name => 'Linguagens de Programação', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T014', :name => 'Estágio Supervisionado I', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T003', :name => 'Análise, Projeto e Implementação de Sistemas I', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T030', :name => 'Sistemas Distribuídos', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T010', :name => 'Computação Gráfica', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T031', :name => 'Sistemas Multimídia', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T015', :name => 'Estágio Supervisionado II', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T004', :name => 'Análise, Projeto e Implementação de Sistemas II', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T011', :name => 'Computador e Sociedade', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T028', :name => 'Segurança de Sistemas', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T021', :name => 'Inteligência Artificial', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T016', :name => 'Estágio Supervisionado III', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T036', :name => 'Trabalho de Conclusão de Course I', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'A077', :name => 'Empreendedorismo em Computação', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T020', :name => 'Gerenciamento de Projetos', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T006', :name => 'Auditoria de Sistemas', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T037', :name => 'Trabalho de Conclusão de Course II', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T017', :name => 'Estágio Supervisionado IV', :course => @si, :version => 1, :curriculums => [Curriculum.first] },
                   { :code => 'T029', :name => 'Sistemas de Apoio à Decisão', :course => @si, :version => 1, :curriculums => [Curriculum.first] }])

# Users
Person.create([{ :name => 'Administrator', :email => 'admin@uni.com', :password => '21232f297a57a5a743894a0e4a801fc3', :roles => [@administrator] }])
Professor.create([{ :person => Person.create({ :name => 'Professor', :email => 'professor@uni.com', :password => '3f9cd3c7b11eb1bae99dddb3d05da3c5', :roles => [@professor] }), :scholarity => Scholarity.first }])
Student.create([{ :person => Person.create({ :name => 'Student', :email => 'student@uni.com', :password => 'cd73502828457d15655bbd7a63fb0bc8', :roles => [@student] }), :code => 'student', :curriculums => [Curriculum.first] }])
Student.create([{ :person => Person.create({ :name => 'Jules', :email => 'jules@uni.com', :password => 'cd73502828457d15655bbd7a63fb0bc8', :roles => [@student] }), :code => 'jules', :curriculums => [Curriculum.first] }])
Student.create([{ :person => Person.create({ :name => 'Seth', :email => 'seth@uni.com', :password => 'cd73502828457d15655bbd7a63fb0bc8', :roles => [@student] }), :code => 'seth', :curriculums => [Curriculum.first] }])
Student.create([{ :person => Person.create({ :name => 'Becca', :email => 'becca@uni.com', :password => 'cd73502828457d15655bbd7a63fb0bc8', :roles => [@student] }), :code => 'becca', :curriculums => [Curriculum.first] }])
Student.create([{ :person => Person.create({ :name => 'Evan', :email => 'evan@uni.com', :password => 'cd73502828457d15655bbd7a63fb0bc8', :roles => [@student] }), :code => 'evan', :curriculums => [Curriculum.first] }])
Student.create([{ :person => Person.create({ :name => 'McLovin', :email => 'mclovin@uni.com', :password => 'cd73502828457d15655bbd7a63fb0bc8', :roles => [@student] }), :code => 'mclovin', :curriculums => [Curriculum.first] }])

# Academic Periods
AcademicPeriod.create([{ :name => '2011.2', :start => '01/08/2011', :end => '20/12/2011' }])

# Lectures
Lecture.create([{ :code => 'T001', :discipline => Discipline.first, :academic_period => AcademicPeriod.first, :professors => [Professor.first], :students => Student.all }])

# Lecture Situations
LectureSituation.create([{ :name => 'Approved', :approved => true }])
LectureSituation.create([{ :name => 'Disapproved', :approved => false }])
LectureSituation.create([{ :name => 'Disapproved by Attendance', :approved => false }])
