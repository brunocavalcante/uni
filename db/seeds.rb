# encoding: UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first) = 0

# Parameters
Parameter.create({ :name => 'locale', :value => 'en' })

Scholarity.create([{ :name => 'Bacharel' }, 
                   { :name => 'Mestre' }, 
                   { :name => 'Doutor' }, 
                   { :name => 'Especialista' }])
                  
CourseCategory.create({ :name => 'Graduação' }, 
                      { :name => 'Pós-Graduação' })
                      
LectureSituation.create([{ :name => 'Approved', :approved => true }, 
                         { :name => 'Disapproved', :approved => false }, 
                         { :name => 'Disapproved by Attendance', :approved => false }])

# Roles
@administrator = Role.create({ :name => 'Administrator' })
@professor     = Role.create({ :name => 'Professor' })
@student       = Role.create({ :name => 'Student' })

# Administrator (Password is "admin")
Person.create({ :name => 'Administrator', :email => 'admin@uni.com', :password => '21232f297a57a5a743894a0e4a801fc3', :roles => [@administrator] })

# Initial Test Data:

# Courses
@si = Course.create({ :code => 'SI', :name => 'Sistemas de Informação', :course_category => CourseCategory.first })
Course.create([{ :code => 'AD', :name => 'Administração', :course_category => CourseCategory.first },
               { :code => 'CC', :name => 'Ciências Contábeis', :course_category => CourseCategory.first },
               { :code => 'DI', :name => 'Direito', :course_category => CourseCategory.first },
               { :code => 'JO', :name => 'Jornalismo', :course_category => CourseCategory.first },
               { :code => 'PE', :name => 'Pedagogia', :course_category => CourseCategory.first },
               { :code => 'PP', :name => 'Publicidade e Propaganda', :course_category => CourseCategory.first },
               { :code => 'LO', :name => 'Logística', :course_category => CourseCategory.first },
               { :code => 'NI', :name => 'Negócios Imobiliários', :course_category => CourseCategory.first }, 
               { :code => 'DG', :name => 'Design Gráfico', :course_category => CourseCategory.first }])

# Curriculum
@curriculum = Curriculum.create({ :code => '20081', :name => '2008.1', :course => @si, :finished => false, :active => false })

CurriculumModule.create([{ :curriculum => @curriculum, :name => '1º Semestre', :order => 1 }, 
                         { :curriculum => @curriculum, :name => '2º Semestre', :order => 2 }, 
                         { :curriculum => @curriculum, :name => '3º Semestre', :order => 3 }, 
                         { :curriculum => @curriculum, :name => '4º Semestre', :order => 4 }, 
                         { :curriculum => @curriculum, :name => '5º Semestre', :order => 5 }, 
                         { :curriculum => @curriculum, :name => '6º Semestre', :order => 6 }, 
                         { :curriculum => @curriculum, :name => '7º Semestre', :order => 7 }, 
                         { :curriculum => @curriculum, :name => '8º Semestre', :order => 8 } ])
@modules = CurriculumModule.by_order.all

# Disciplines
Discipline.create([{ :code => 'N011', :name => 'Cálculo Diferencial e Integral', :course => @si, :version => 1 }, 
                   { :code => 'T009', :name => 'Computação Básica', :course => @si, :version => 1 },  
                   { :code => 'T019', :name => 'Fundamentos de Sistemas de Informação', :course => @si, :version => 1 },  
                   { :code => 'H145', :name => 'Inglês Instrumental', :course => @si, :version => 1 }, 
                   { :code => 'N009', :name => 'Lógica Matemática', :course => @si, :version => 1 }, 
                   { :code => 'T001', :name => 'Algoritmos e Estruturas de Dados I', :course => @si, :version => 1 }, 
                   { :code => 'H144', :name => 'Comunicação e Expressão', :course => @si, :version => 1 }, 
                   { :code => 'N004', :name => 'Estatística Computacional', :course => @si, :version => 1 }, 
                   { :code => 'N010', :name => 'Matemática Discreta', :course => @si, :version => 1 }, 
                   { :code => 'T005', :name => 'Arquitetura e Organização de Computadores', :course => @si, :version => 1 }, 
                   { :code => 'T002', :name => 'Algoritmos e Estruturas de Dados II', :course => @si, :version => 1 }, 
                   { :code => 'T023', :name => 'Linguagens Formais, Autômatos e Computabilidade', :course => @si, :version => 1 }, 
                   { :code => 'T025', :name => 'Programação com Orientação à Objetos', :course => @si, :version => 1 },
                   { :code => 'T032', :name => 'Sistemas Operacionais', :course => @si, :version => 1 },
                   { :code => 'A072', :name => 'Contabilidade e Finanças', :course => @si, :version => 1 },
                   { :code => 'A073', :name => 'Economia', :course => @si, :version => 1 },
                   { :code => 'T033', :name => 'Técnicas de Programação', :course => @si, :version => 1 },
                   { :code => 'T026', :name => 'Redes de Computadores I', :course => @si, :version => 1 },
                   { :code => 'T024', :name => 'Pesquisa e Ordenação de Dados', :course => @si, :version => 1 },
                   { :code => 'A067', :name => 'Psicologia Organizacional', :course => @si, :version => 1 },
                   { :code => 'T007', :name => 'Banco de Dados I', :course => @si, :version => 1 },
                   { :code => 'J080', :name => 'Direito e Legislação', :course => @si, :version => 1 },
                   { :code => 'T013', :name => 'Engenharia de Software', :course => @si, :version => 1 },
                   { :code => 'T008', :name => 'Banco de Dados II', :course => @si, :version => 1 },
                   { :code => 'T027', :name => 'Redes de Computadores II', :course => @si, :version => 1 },
                   { :code => 'T022', :name => 'Linguagens de Programação', :course => @si, :version => 1 },
                   { :code => 'T014', :name => 'Estágio Supervisionado I', :course => @si, :version => 1 },
                   { :code => 'T003', :name => 'Análise, Projeto e Implementação de Sistemas I', :course => @si, :version => 1 },
                   { :code => 'T030', :name => 'Sistemas Distribuídos', :course => @si, :version => 1 },
                   { :code => 'T010', :name => 'Computação Gráfica', :course => @si, :version => 1 },
                   { :code => 'T031', :name => 'Sistemas Multimídia', :course => @si, :version => 1 },
                   { :code => 'T015', :name => 'Estágio Supervisionado II', :course => @si, :version => 1 },
                   { :code => 'T004', :name => 'Análise, Projeto e Implementação de Sistemas II', :course => @si, :version => 1 },
                   { :code => 'T011', :name => 'Computador e Sociedade', :course => @si, :version => 1 },
                   { :code => 'T028', :name => 'Segurança de Sistemas', :course => @si, :version => 1 },
                   { :code => 'T021', :name => 'Inteligência Artificial', :course => @si, :version => 1 },
                   { :code => 'T016', :name => 'Estágio Supervisionado III', :course => @si, :version => 1 },
                   { :code => 'T036', :name => 'Trabalho de Conclusão de Curso I', :course => @si, :version => 1 },
                   { :code => 'A077', :name => 'Empreendedorismo em Computação', :course => @si, :version => 1 },
                   { :code => 'T020', :name => 'Gerenciamento de Projetos', :course => @si, :version => 1 },
                   { :code => 'T006', :name => 'Auditoria de Sistemas', :course => @si, :version => 1 },
                   { :code => 'T037', :name => 'Trabalho de Conclusão de Curso II', :course => @si, :version => 1 },
                   { :code => 'T017', :name => 'Estágio Supervisionado IV', :course => @si, :version => 1 },
                   { :code => 'T029', :name => 'Sistemas de Apoio à Decisão', :course => @si, :version => 1 }])

Discipline.all.each_with_index { |discipline, i| CurriculumDiscipline.create({ :mandatory => true, :discipline => discipline, :curriculum => @curriculum, :curriculum_module => @modules[i.div(6)] })}

@curriculum.finished = true
@curriculum.active = true
@curriculum.save!

# Users
Professor.create({ :person => Person.create({ :name => 'Professor', :email => 'professor@uni.com', :scholarity => Scholarity.first, :roles => [@professor] }) })
Student.create({ :person => Person.create({ :name => 'Student', :email => 'student@uni.com', :roles => [@student] }), :code => 'student' })
Student.create({ :person => Person.create({ :name => 'Jules', :email => 'jules@uni.com', :roles => [@student] }), :code => 'jules' })
Student.create({ :person => Person.create({ :name => 'Seth', :email => 'seth@uni.com', :roles => [@student] }), :code => 'seth' })
Student.create({ :person => Person.create({ :name => 'Becca', :email => 'becca@uni.com', :roles => [@student] }), :code => 'becca' })
Student.create({ :person => Person.create({ :name => 'Evan', :email => 'evan@uni.com', :roles => [@student] }), :code => 'evan' })
Student.create({ :person => Person.create({ :name => 'McLovin', :email => 'mclovin@uni.com', :roles => [@student] }), :code => 'mclovin' })
Student.all.each { |student| CurriculumStudent.create( {:student => student, :active => true, :curriculum => @curriculum} ) }

# Academic Periods
AcademicPeriod.create({ :name => '2011.2', :start => '01/08/2011', :end => '20/12/2011' })

# Lectures
Lecture.create({ :code => 'T001', :discipline => Discipline.first, :academic_period => AcademicPeriod.first, :professors => [Professor.first], :students => Student.all })
