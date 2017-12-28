namespace :utils do
  desc "Popular Banco de dados da aplicação"
  task seed: :environment do
    puts "Iniciando a população dos dados de teste..."
    puts "\nCriando Contatos..."
    10.times do |i|
      contact_instance = Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        kind: Kind.all.sample,
        rmk: Faker::ChuckNorris.fact
      )
      puts "Criando Contato ##{i+1} - #{contact_instance.name}"
    end

    puts "\nCriando Endereços para os Contatos..."
    Contact.all.each do |contato|
      puts "Criando endereço para #{contato.name}"
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        contact: contato
      )
    end
    puts "\nCriando Telefones para os Contatos..."
    Contact.all.each do |contato|
      #Pega aleatoriamente um dos elementos do array
      #Gera esse número de Telefones para o Contato da vez
      #Com isso cada contato pode ter 1, 2 ou 3 telefones
      Random.rand(1..3).times do |j|
        puts "Criando telefones para #{contato.name}"
        Phone.create!(
          phone: Faker::PhoneNumber.phone_number,
          contact: contato
        )
      end
    end
  end

end
