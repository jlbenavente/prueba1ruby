opcion = 0

opciones_menu = <<menu
calificaciones y asistencia de alumnos
  1. Nombres y promedios de notas.
  2. Total de inasistencias.
  3. alumnos aprobados y reprobados.
  4. salir del programa.
menu

def borrar
 system 'clear'
end

def read_file
 file = File.open('alumnos.csv', 'r') { |f| f.readlines.map(&:chomp) }
 file.map { |line| line.delete(' ').split(',') }
end

def opcion1
 puts "nombres y promedios"
 read_file.each do |ele|
   cant = ele.length - 1
   nombre = ele.first
   notas = ele[1..cant]
   sum = 0
   promedio = 0
   notas.each do |num|
   sum += num.to_i
   promedio = sum.to_f / cant
 end
   p "El promedio final de #{nombre} es: #{promedio}"
 end

end

def opcion2
  puts "inasistencia es tomada con nota '0'"
  read_file.each do |ele|
   cant = ele.length - 1
   nombre = ele.first
   notas = ele[1..cant]

   inasistencia = 0
   notas.each do |asis|
   inasistencia += 1 if asis.delete(' ') == 'A'
  end
   puts "El total de inasistencias de #{nombre} es de: #{inasistencia}"
  end
end

def opcion3
  puts "promedio minimo para aprobar es '5'"
  read_file.each do |ele|
   cant = ele.length - 1
   nombre = ele.first
   notas = ele[1..cant]
   sum = 0
   promedio = 0
   notas.each do |num|
   sum += num.to_i
   promedio = sum.to_f / cant
  end

   if (promedio >= 5)
   puts "el alumno(a) #{nombre} esta: Aprobado(a)"
   else
    puts "el alumno(a) #{nombre} esta: Reprobado(a)"
   end

  end
end


while opcion != 4
  print opciones_menu
  opcion = gets.to_i
  case opcion
    when 1
      opcion1
    when 2
      opcion2
    when 3
      opcion3
    when 4
      print "saliendo."
      sleep(0.5)
      print "."
      sleep(0.5)
      print "."
      sleep(0.5)
         borrar
         exit
    else
      p "opcion invalida, por favor escoge una entre 1 y 4"
    end
end