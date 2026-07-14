# This file ensures the existence of records required to run the application in every environment.
# Run with `bin/rails db:seed` (or alongside the database with `db:setup`).

puts "Clearing existing seed data..."

Order.delete_all
Product.delete_all
Payment.delete_all
Business.destroy_all
User.destroy_all
CmsBlock.destroy_all
ActionText::RichText.delete_all if defined?(ActionText::RichText)
ActiveStorage::Attachment.delete_all if defined?(ActiveStorage::Attachment)
ActiveStorage::Blob.delete_all if defined?(ActiveStorage::Blob)

def confirmed_user!(attributes)
  user = User.new(attributes)
  user.skip_confirmation! if user.respond_to?(:skip_confirmation!)
  user.confirmed_at ||= Time.current if user.respond_to?(:confirmed_at)
  user.save!
  user
end

def image_asset(filename)
  Rails.root.join("app/assets/images/#{filename}")
end

def attach_asset!(record, attachment_name, filename)
  path = image_asset(filename)
  return unless path.exist?

  record.public_send(attachment_name).attach(
    io: File.open(path),
    filename: File.basename(path),
    content_type: "image/png"
  )
end

confirmed_user!(
  email: "superadmin@erster-advent-bern.ch",
  password: "kiskec-sankA0-dypxuh",
  role: 2,
  name: "Erster Advent Bern",
  business_name: "Verein Erster Advent",
  address: "Postgasse 20\n3011 Bern",
  phone: "+41 31 311 11 11",
  category: "Organisation"
)

confirmed_user!(
  email: "admin@erster-advent-bern.ch",
  password: "bern-admin-2026",
  role: 1,
  name: "Leitung Untere Altstadt",
  business_name: "Erster Advent Bern",
  address: "Kramgasse 1\n3011 Bern",
  phone: "+41 31 312 24 24",
  category: "Administration"
)

businesses = [
  {
    email: "postgass.stube@erster-advent-bern.ch",
    password: "bern-seed-2026",
    owner: "Mara Stucki",
    business_name: "Postgass Stube",
    phone: "+41 31 311 20 01",
    address: "Postgasse 12\n3011 Bern",
    categories: [ "Essen & Trinken", "Saisonaler Markt" ],
    tags: [ "Unter Altstadt", "Fondue", "Aare" ],
    website: "https://erster-advent-bern.ch/postgass-stube",
    instagram: "https://instagram.com/postgassstube",
    map_query: "Postgasse 12 Bern",
    image: "home/bild_1.png",
    gallery: [ "home/bild_2.png", "home/bild_3.png", "home/bild_4.png" ],
    description: "Warme Kueche, Kerzenlicht und ein kleiner Adventstresen mitten in der Postgasse. Die Postgass Stube serviert am Ersten Advent Berner Klassiker in handlicher Form: kleine Fonduebroetli, hausgemachten Apfelpunsch und Suppen aus regionalem Gemuese. Der Betrieb ist seit Jahren Treffpunkt fuer Nachbarinnen, Handwerker und Besucherinnen der Unteren Altstadt.",
    specialities: [
      "Mini-Fondue im Broetli mit Greyerzer und Vacherin",
      "Heisser Apfelpunsch mit Berner Honig, auch alkoholfrei",
      "Sitzplaetze im Gewoelbekeller fuer kurze Waermepausen"
    ],
    products: [
      [ "Postgass Punschsirup", "Konzentrierter Apfel-Zimt-Sirup fuer winterliche Abende zuhause. Gekocht mit Most aus dem Berner Mittelland und Gewuerzen aus der Stube.", 14.50, [ "250 ml", "500 ml" ], "1-2 Tage" ],
      [ "Fondue-Gewuerz Bern", "Kleine Gewuerzmischung mit Pfeffer, Muskat und Knoblauch fuer das klassische Adventsfondue.", 8.90, [ "Glas 45 g" ], "Sofort abholbereit" ]
    ]
  },
  {
    email: "laubenwerk@erster-advent-bern.ch",
    password: "bern-seed-2026",
    owner: "Nils Gfeller",
    business_name: "Laubenwerk Bern",
    phone: "+41 31 312 44 08",
    address: "Kramgasse 46\n3011 Bern",
    categories: [ "Handgemachte Waren", "Dekoration" ],
    tags: [ "Lauben", "Holz", "Handwerk" ],
    website: "https://erster-advent-bern.ch/laubenwerk",
    instagram: "https://instagram.com/laubenwerkbern",
    map_query: "Kramgasse 46 Bern",
    image: "home/bild_2.png",
    gallery: [ "home/bild_1.png", "home/bild_5.png", "home/bild_6.png" ],
    description: "Laubenwerk fertigt kleine Serien aus Schweizer Holz: Kerzenhalter, Baumschmuck, Kartenstaender und reduzierte Wohnaccessoires. Am Ersten Advent arbeitet die Werkstatt im Schaufenster und zeigt, wie aus altem Kirschbaumholz neue Lieblingsstuecke fuer die Festtage entstehen.",
    specialities: [
      "Live-Schnitzen unter den Lauben von 12 bis 16 Uhr",
      "Personalisierte Holzanhanger mit Namen oder Jahrgang",
      "Kleine Geschenkverpackung aus Recyclingpapier inklusive"
    ],
    products: [
      [ "Zytglogge Holzornament", "Fein geschliffener Christbaumanhaenger aus Schweizer Nussbaum, inspiriert von den Formen der Berner Altstadt.", 18.00, [ "Einzelstueck", "3er Set" ], "2-3 Tage" ],
      [ "Lauben Kerzenbank", "Schlichte Kerzenbank aus geoltem Eschenholz fuer vier Adventskerzen.", 54.00, [ "Natur", "Dunkel geoelt" ], "3-5 Tage" ],
      [ "Aare Kartenhalter", "Kleiner Kartenhalter aus Restholz, passend fuer Menuekarten, Fotos oder Adventsgruesse.", 12.00, [ "Klein", "Gross" ], "Sofort abholbereit" ]
    ]
  },
  {
    email: "aaregold@erster-advent-bern.ch",
    password: "bern-seed-2026",
    owner: "Livia Fahrni",
    business_name: "Aaregold Schmuckatelier",
    phone: "+41 31 312 18 70",
    address: "Gerechtigkeitsgasse 54\n3011 Bern",
    categories: [ "Schmuck", "Handgemachte Waren" ],
    tags: [ "Goldschmiede", "Unikate", "Bern" ],
    website: "https://erster-advent-bern.ch/aaregold",
    instagram: "https://instagram.com/aaregoldbern",
    map_query: "Gerechtigkeitsgasse 54 Bern",
    image: "home/bild_3.png",
    gallery: [ "home/bild_2.png", "home/bild_6.png", "home/bild_7.png" ],
    description: "Aaregold ist ein kleines Schmuckatelier fuer klare Formen, reparierte Erbstuecke und neue Unikate. Die Kollektion zum Ersten Advent greift Linien der Aare, Laubenbogen und Sandsteinfarben auf. Besucherinnen koennen vor Ort Gravuren besprechen und Materialien anfassen.",
    specialities: [
      "Kostenlose Ringgroessen-Beratung am Veranstaltungstag",
      "Limitierte Aare-Linie in Silber und vergoldetem Messing",
      "Reparatursprechstunde fuer Lieblingsstuecke"
    ],
    products: [
      [ "Aarelinie Silberring", "Schmaler Silberring mit weich geschwungener Linie, von Hand poliert im Atelier an der Gerechtigkeitsgasse.", 118.00, [ "50", "52", "54", "56", "58" ], "5-7 Tage" ],
      [ "Laubenbogen Ohrstecker", "Dezente Ohrstecker aus recyceltem Silber, inspiriert von den Rundungen der Berner Lauben.", 76.00, [ "Silber", "Vergoldet" ], "3-5 Tage" ]
    ]
  },
  {
    email: "mattekaffi@erster-advent-bern.ch",
    password: "bern-seed-2026",
    owner: "Timo Nyffenegger",
    business_name: "Mattekaffi Roesterei",
    phone: "+41 31 331 09 15",
    address: "Mattenenge 5\n3011 Bern",
    categories: [ "Essen & Trinken", "Einzelhandel" ],
    tags: [ "Kaffee", "Matte", "Roesterei" ],
    website: "https://erster-advent-bern.ch/mattekaffi",
    instagram: "https://instagram.com/mattekaffi",
    map_query: "Mattenenge 5 Bern",
    image: "home/bild_4.png",
    gallery: [ "home/bild_1.png", "home/bild_3.png", "home/bild_5.png" ],
    description: "Die Mattekaffi Roesterei bringt frisch geroestete Bohnen aus dem Mattequartier in die Adventssonntage. Am Ersten Advent duftet es nach Espresso, Kardamom und warmem Gebaeck. Das Team beraet zu Mahlgrad, Zubereitung und passenden Geschenken fuer Kaffeefans.",
    specialities: [
      "Adventsroestung mit Noten von Kakao und getrockneter Pflaume",
      "Espresso-Bar vor dem Laden von 11 bis 17 Uhr",
      "Kaffee-Geschenksets mit Berner Schokolade"
    ],
    products: [
      [ "Adventsroestung Matte", "Mittelkraeftige Bohnenmischung fuer Siebtraeger und Bialetti, frisch geroestet im Mattequartier.", 17.90, [ "250 g", "500 g", "1 kg" ], "1-2 Tage" ],
      [ "Kaffee & Schoggi Box", "Geschenkbox mit Adventsroestung, dunkler Schokolade und einer kleinen Bruehanleitung.", 34.00, [ "Standard", "Mit Grusskarte" ], "2-3 Tage" ]
    ]
  },
  {
    email: "zytglogge.buch@erster-advent-bern.ch",
    password: "bern-seed-2026",
    owner: "Judith Hofer",
    business_name: "Zytglogge Buch & Papier",
    phone: "+41 31 311 77 03",
    address: "Kramgasse 74\n3011 Bern",
    categories: [ "Einzelhandel", "Bildung" ],
    tags: [ "Buecher", "Papeterie", "Altstadt" ],
    website: "https://erster-advent-bern.ch/zytglogge-buch",
    instagram: "https://instagram.com/zytgloggebuch",
    map_query: "Kramgasse 74 Bern",
    image: "home/bild_5.png",
    gallery: [ "home/bild_2.png", "home/bild_4.png", "home/bild_7.png" ],
    description: "Zwischen Zytglogge und Rathaus fuehrt Zytglogge Buch & Papier eine persoenliche Auswahl an Literatur, Karten, Kalendern und Schreibwaren. Fuer den Ersten Advent stellt das Team Berner Geschenkempfehlungen, Wintergeschichten und kleine Papierwaren aus regionalen Druckereien zusammen.",
    specialities: [
      "Buchberatung fuer Weihnachtsgeschenke ohne Termin",
      "Berner Adventskarten aus Risographie-Druck",
      "Kinder-Vorlesezeit um 14 Uhr"
    ],
    products: [
      [ "Berner Adventskarten Set", "Sechs illustrierte Karten mit Motiven aus der Unteren Altstadt, gedruckt auf Recyclingpapier.", 19.00, [ "6er Set" ], "Sofort abholbereit" ],
      [ "Winterlesen Paket", "Sorgfaeltig kuratiertes Buchpaket mit einem Roman, Tee und Lesezeichen.", 42.00, [ "Leise", "Spannend", "Familie" ], "2-3 Tage" ]
    ]
  },
  {
    email: "muenzplatz.blueten@erster-advent-bern.ch",
    password: "bern-seed-2026",
    owner: "Eliane Ruch",
    business_name: "Muenzplatz Blueten",
    phone: "+41 31 311 42 90",
    address: "Muenzplatz 3\n3011 Bern",
    categories: [ "Dekoration", "Handgemachte Waren" ],
    tags: [ "Floristik", "Kraenze", "Muenzplatz" ],
    website: "https://erster-advent-bern.ch/muenzplatz-blueten",
    instagram: "https://instagram.com/muenzplatzblueten",
    map_query: "Muenzplatz 3 Bern",
    image: "home/bild_6.png",
    gallery: [ "home/bild_1.png", "home/bild_5.png", "home/bild_7.png" ],
    description: "Muenzplatz Blueten bindet saisonale Kraenze, Trockenblumen und kleine Tischdekorationen mit viel Gespuer fuer Farbe. Zum Ersten Advent stehen Tannengrund, Beeren, Eukalyptus und Kerzen bereit. Viele Stuecke entstehen direkt am Stand und koennen nach Wunsch angepasst werden.",
    specialities: [
      "Adventskranz-Bar mit frei waehlbaren Kerzenfarben",
      "Mini-Kraenze fuer Tueren, Fenster und kleine Tische",
      "Materialien aus Schweizer Gärtnereien, wenn verfuegbar"
    ],
    products: [
      [ "Muenzplatz Adventskranz", "Handgebundener Kranz mit Tanne, Eukalyptus, Beeren und vier Kerzen in warmen Naturtoenen.", 68.00, [ "Klein", "Mittel", "Gross" ], "2-4 Tage" ],
      [ "Lauben Mini-Kranz", "Kleiner Trockenblumenkranz fuer Fenster, Tueren oder Geschenkverpackungen.", 24.00, [ "Natur", "Rot", "Gruen" ], "Sofort abholbereit" ]
    ]
  },
  {
    email: "rathausplatz.schoggi@erster-advent-bern.ch",
    password: "bern-seed-2026",
    owner: "Pascal Wenger",
    business_name: "Rathausplatz Schoggi",
    phone: "+41 31 312 66 02",
    address: "Rathausplatz 8\n3011 Bern",
    categories: [ "Süßwaren", "Essen & Trinken" ],
    tags: [ "Schokolade", "Pralinen", "Geschenke" ],
    website: "https://erster-advent-bern.ch/rathausplatz-schoggi",
    instagram: "https://instagram.com/rathausplatzschoggi",
    map_query: "Rathausplatz 8 Bern",
    image: "home/bild_7.png",
    gallery: [ "home/bild_2.png", "home/bild_3.png", "home/bild_6.png" ],
    description: "Rathausplatz Schoggi produziert Pralinen, Bruchschokolade und kleine Tafeln mit Berner Motiven. Die Adventsedition kombiniert dunkle Schokolade, Haselnuesse, Gewuerze und getrocknete Fruechte. Am Ersten Advent gibt es Degustationen und frisch verpackte Geschenkboxen.",
    specialities: [
      "Degustation der Adventspralinen im Laden",
      "Schoggi-Tafeln mit Zytglogge-Praegung",
      "Geschenkboxen werden vor Ort von Hand beschriftet"
    ],
    products: [
      [ "Zytglogge Schoggitaler", "Runde Schokoladentaler mit Zytglogge-Motiv, verpackt in einer kleinen Berner Geschenkbox.", 16.50, [ "Milch", "Dunkel", "Gemischt" ], "Sofort abholbereit" ],
      [ "Rathausplatz Pralinen", "Zwölf handgemachte Pralinen mit winterlichen Fuellungen wie Haselnuss, Orange und Gewuerzcaramel.", 29.00, [ "12er Box", "24er Box" ], "1-2 Tage" ]
    ]
  },
  {
    email: "nydegg.klang@erster-advent-bern.ch",
    password: "bern-seed-2026",
    owner: "Reto Ammann",
    business_name: "Nydegg Klangatelier",
    phone: "+41 31 332 30 18",
    address: "Nydeggstalden 2\n3011 Bern",
    categories: [ "Unterhaltung", "Handgemachte Waren" ],
    tags: [ "Musik", "Instrumente", "Nydegg" ],
    website: "https://erster-advent-bern.ch/nydegg-klang",
    instagram: "https://instagram.com/nydeggklang",
    map_query: "Nydeggstalden 2 Bern",
    image: "home/bild_1.png",
    gallery: [ "home/bild_4.png", "home/bild_5.png", "home/bild_7.png" ],
    description: "Das Nydegg Klangatelier repariert Instrumente, baut kleine Klangobjekte und organisiert Musikmomente im Quartier. Am Ersten Advent treten befreundete Musikerinnen in kurzen Sets auf. Dazu gibt es handgemachte Rasseln, Glocken und kleine Instrumente fuer Kinder.",
    specialities: [
      "Akustische Kurzkonzerte jeweils zur vollen Stunde",
      "Klangobjekte aus Holz, Messing und Fundstuecken",
      "Instrumenten-Check fuer mitgebrachte Gitarren und Geigen"
    ],
    products: [
      [ "Nydegg Klangstern", "Kleines handgefertigtes Klangobjekt aus Holz und Messing, zum Aufhaengen oder Verschenken.", 32.00, [ "Hell", "Warm", "Tief" ], "3-5 Tage" ],
      [ "Kinder-Rhythmusset", "Ein kleines Set mit Rassel, Schellenband und Spielkarte fuer gemeinsame Adventslieder.", 26.00, [ "Set" ], "Sofort abholbereit" ]
    ]
  }
]

businesses.each.with_index do |seed, index|
  user = confirmed_user!(
    email: seed.fetch(:email),
    password: seed.fetch(:password),
    role: 0,
    name: seed.fetch(:owner),
    business_name: seed.fetch(:business_name),
    address: seed.fetch(:address),
    phone: seed.fetch(:phone),
    category: seed.fetch(:categories).first,
    package_plan: index.even? ? 2 : 1,
    is_verified: true,
    payment_method: "bank_transfer"
  )

  business = user.create_business!(
    business_name: seed.fetch(:business_name),
    phone: seed.fetch(:phone),
    address: seed.fetch(:address),
    billing_address: seed.fetch(:address),
    contact_name: seed.fetch(:owner),
    email: seed.fetch(:email),
    website: seed.fetch(:website),
    instagram: seed.fetch(:instagram),
    tiktok: "",
    linkedin: "",
    facebook: "",
    map_link: "https://maps.google.com/?q=#{ERB::Util.url_encode(seed.fetch(:map_query))}",
    description: seed.fetch(:description),
    first_advent_specialities: "<ul>#{seed.fetch(:specialities).map { |item| "<li>#{ERB::Util.html_escape(item)}</li>" }.join}</ul>",
    tags: seed.fetch(:tags),
    categories: seed.fetch(:categories),
    confirmed: true,
    status: :confirmed
  )

  attach_asset!(business, :main_image, seed.fetch(:image))
  seed.fetch(:gallery).each.with_index(1) do |filename, gallery_index|
    attach_asset!(business, "image_gallery#{gallery_index}", filename)
  end

  Payment.create!(
    user: user,
    payment_image: "seeded-bank-transfer-#{user.id}.pdf",
    payment_session_id: "seed_bern_#{user.id}",
    customer_email: user.email,
    plan: index.even? ? "Vereinsmitglied Plus" : "Vereinsmitglied Basis",
    is_verified: index == 7 ? "Pending" : "approved"
  )

  seed.fetch(:products).each.with_index do |product_seed, product_index|
    title, description, price, sizes, delivery_time = product_seed
    image_number = ((index + product_index) % 7) + 1

    Product.create!(
      user: user,
      title: title,
      description: description,
      price: price,
      main_product_image: ActionController::Base.helpers.asset_path("home/bild_#{image_number}.png"),
      images_of_product: [
        ActionController::Base.helpers.asset_path("home/bild_#{(image_number % 7) + 1}.png"),
        ActionController::Base.helpers.asset_path("home/bild_#{((image_number + 1) % 7) + 1}.png")
      ],
      sizes: sizes,
      delievry_time: delivery_time,
      total_orders: 0
    )
  end
end

customers = [
  [ "Sophie Keller", "sophie.keller@example.ch", "Munstergasse 18\n3011 Bern", "+41 79 441 12 09" ],
  [ "Andrin Gerber", "andrin.gerber@example.ch", "Brunngasse 7\n3011 Bern", "+41 78 820 31 14" ],
  [ "Nora Aebi", "nora.aebi@example.ch", "Junkerngasse 21\n3011 Bern", "+41 76 335 44 91" ],
  [ "Luca Marti", "luca.marti@example.ch", "Laenggasse 40\n3012 Bern", "+41 77 612 08 52" ]
].map do |name, email, address, phone|
  confirmed_user!(
    email: email,
    password: "bern-customer-2026",
    role: 0,
    name: name,
    address: address,
    phone: phone,
    category: "Besucherinnen und Besucher"
  )
end

products = Product.order(:created_at).to_a
order_statuses = [ "accepted", "pending", "packed", "ready_for_pickup" ]

products.first(14).each.with_index do |product, index|
  customer = customers[index % customers.length]
  size = product.size_options[index % product.size_options.length]
  quantity = (index % 3) + 1

  Order.create!(
    product: product,
    customer: customer,
    quantity: quantity,
    size: size,
    order_no: "EA-BE-#{Time.current.year}-#{(index + 1).to_s.rjust(4, "0")}",
    accept_order: order_statuses[index % order_statuses.length],
    created_at: (index + 1).days.ago,
    updated_at: (index + 1).days.ago
  )

  product.increment!(:total_orders, quantity)
end

CmsBlock.create!(
  page: "home",
  position: 1,
  block_type: :content_block,
  is_active: true,
  button_text: "Geschäfte entdecken",
  button_url: "/stores",
  title: "Erster Advent in der Unteren Altstadt",
  content: "Am Ersten Advent oeffnen die Geschaefte, Werkstaetten, Galerien, Cafes und Restaurants der Unteren Altstadt Bern ihre Tueren. Zwischen Zytglogge, Postgasse, Gerechtigkeitsgasse, Rathausplatz und Matte entsteht ein persoenlicher Adventsweg mit Begegnungen, Musik, Handwerk und kulinarischen Pausen."
)

[
  [ "Kommt der Samichlous auch dieses Jahr?", "Ja, der Samichlous ist in der Unteren Altstadt unterwegs. Die genauen Zeiten werden kurz vor dem Anlass publiziert." ],
  [ "Wann haben die Geschaefte geoeffnet?", "Die teilnehmenden Geschaefte sind am Ersten Advent in der Regel von 11 bis 17 Uhr geoeffnet. Einzelne Gastronomiebetriebe koennen laenger offen bleiben." ],
  [ "Wo finde ich die teilnehmenden Geschaefte?", "Alle bestaetigten Geschaefte erscheinen in der Store-Uebersicht. Viele liegen rund um Postgasse, Kramgasse, Gerechtigkeitsgasse, Rathausplatz, Nydegg und Matte." ],
  [ "Muss ich mich anmelden?", "Besucherinnen und Besucher brauchen keine Anmeldung. Geschaefte melden sich ueber das Mitgliederportal oder direkt beim Verein Erster Advent Bern." ]
].each.with_index(2) do |(question, answer), position|
  CmsBlock.create!(
    page: "home",
    position: position,
    block_type: :qa_block,
    is_active: true,
    question: question,
    answer: answer
  )
end

puts "Seeded #{User.count} users, #{Business.count} Bern stores, #{Product.count} products, #{Order.count} orders, #{Payment.count} payments and #{CmsBlock.count} CMS blocks."
