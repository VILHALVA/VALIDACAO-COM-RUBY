require 'cpf_cnpj'

# Função para validar e salvar o resultado no arquivo
def salvar_validacao(dado, status)
  File.open("VALIDACAO.txt", "a") do |file|
    file.puts "#{dado} -> #{status}"
  end
end

# Função de validação global
def validacao(string)
  if string.empty?
    puts "O campo não pode estar vazio!"
    return nil
  else
    return string
  end
end

# Função de validação do CPF
def validar_cpf
  print "Digite um CPF para verificar sua validade:\n>>>"
  cpf = validacao(gets.chomp)
  return unless cpf
  cpf = cpf.gsub(/[^0-9]/, '')
  if CPF.valid?(cpf)
    puts "O CPF #{cpf} validado com sucesso!"
    salvar_validacao(cpf, "CPF VALIDO!")
  else
    puts "O CPF #{cpf} é inválido!"
    salvar_validacao(cpf, "CPF INVALIDO!")
  end
end

# Função de validação da data
def validar_data
  print "Digite uma data (no formato dd/mm/aaaa) para verificar sua validade:\n>>>"
  data = validacao(gets.chomp)

  return unless data
  if data.match?(/^\d{2}\/\d{2}\/\d{4}$/)
    puts "Data #{data} validada com sucesso!"
    salvar_validacao(data, "DATA VALIDA!")
  else
    puts "Formato de data inválido!"
    salvar_validacao(data, "FORMATO DE DATA INVALIDO!")
  end
end

# Função de validação do dinheiro
def validar_dinheiro
  print "Digite um valor em dinheiro para verificar sua validade:\n>>>"
  dinheiro = validacao(gets.chomp)
  return unless dinheiro
  if dinheiro.match?(/^\d+([\.,]\d{1,2})?$/)
    puts "Valor em dinheiro #{dinheiro} validado com sucesso!"
    salvar_validacao(dinheiro, "DINHEIRO VALIDO!")
  else
    puts "Formato de dinheiro inválido!"
    salvar_validacao(dinheiro, "FORMATO DE DINHEIRO INVALIDO!")
  end
end

# Função de validação do horário
def validar_horario
  print "Digite um horário (no formato hh:mm) para verificar sua validade:\n>>>"
  horario = validacao(gets.chomp)
  return unless horario
  if horario.match?(/^\d{2}:\d{2}$/)
    puts "Horário #{horario} validado com sucesso!"
    salvar_validacao(horario, "HORARIO VALIDO!")
  else
    puts "Formato de horário inválido!"
    salvar_validacao(horario, "FORMATO DE HORARIO INVALIDO!")
  end
end

# Menu de opções
loop do
  puts "================== MENU PRINCIPAL ======================"
  puts "1. CPF"
  puts "2. Data"
  puts "3. Dinheiro"
  puts "4. Horário"
  puts "5. Sair"
  print "\nSelecione uma opção de validação:\n>>>"
  opcao = gets.chomp.to_i
  case opcao
  when 1
    validar_cpf
  when 2
    validar_data
  when 3
    validar_dinheiro
  when 4
    validar_horario
  when 5
    puts "Saindo do programa..."
    break 
  else
    puts "Opção inválida. Tente novamente!"
  end
end
