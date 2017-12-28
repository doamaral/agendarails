namespace :utils do
  desc "Popular Banco de dados da aplicação"
  task seed: :environment do
    puts "Iniciando a população dos dados de teste..."
    puts "Criando Contatos..."
    10.times do |i|
      contact_instance = Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        kind: Kind.all.sample,
        rmk: Faker::ChuckNorris.fact
      )
      puts "Criando Contato ##{i} - #{contact_instance.name}"
    end

    puts "Criando Endereços para os Contatos..."
    Contact.all.each do |contato|
      puts "Criando endereço para #{contato.name}"
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        contact: contato
      )
    end
  end

end
