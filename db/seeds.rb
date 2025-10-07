# This file ensures the existence of records required to run the application in every environment.
# Run with `bin/rails db:seed` (or alongside the database with `db:setup`).

default_users = [
  { email: "superadmin@example.com", password: "kiskec-sankA0-dypxuh", role: 2 }
]

default_users.each do |attributes|
  user = User.find_or_initialize_by(email: attributes.fetch(:email))
  user.assign_attributes(attributes)
  user.skip_confirmation! if user.respond_to?(:skip_confirmation!) && (user.new_record? || user.confirmed_at.nil?)
  user.confirmed_at ||= Time.current if user.respond_to?(:confirmed_at)
  user.save!
end

business_seeds = [
  {
    user: {
      email: "altstadt.wintermarkt@example.com",
      password: "wintermarkt123",
      role: 0,
      name: "Markt Meister",
      phone: "+49 30 1234567",
      category: "Seasonal Market",
      business_name: "Altstadt Wintermarkt",
      address: "Altstadtstrasse 1\n10117 Berlin"
    },
    business: {
      business_name: "Altstadt Wintermarkt",
      phone: "+49 30 1234567",
      address: "Altstadtstrasse 1\n10117 Berlin",
      billing_address: "Altstadtstrasse 1\n10117 Berlin",
      map_link: "https://maps.google.com/?q=Altstadtstrasse+1+Berlin",
      description: "Traditioneller Adventsmarkt mit lokalen Kunsthandwerken, Leckereien und taeglichem Buehnenprogramm.",
      tags: [ "Market", "Seasonal", "Handcrafted" ],
      confirmed: true
    }
  },
  {
    user: {
      email: "gluehweinmeisterei@example.com",
      password: "gluehwein123",
      role: 0,
      name: "Eva Gluehkind",
      phone: "+49 40 7654321",
      category: "Food & Drink",
      business_name: "Gluehweinmeisterei",
      address: "Winterallee 24\n20095 Hamburg"
    },
    business: {
      business_name: "Gluehweinmeisterei",
      phone: "+49 40 7654321",
      address: "Winterallee 24\n20095 Hamburg",
      billing_address: "Winterallee 24\n20095 Hamburg",
      map_link: "https://maps.google.com/?q=Winterallee+24+Hamburg",
      description: "Familienbetrieb mit eigenem Gluehwein, alkoholfreien Punschsorten und regionalen Gewuerzmischungen.",
      tags: [ "Food", "Drinks", "Regional" ],
      confirmed: true
    }
  },
  {
    user: {
      email: "lichterzauber.manufaktur@example.com",
      password: "lichterzauber123",
      role: 0,
      name: "Philipp Kerzenreich",
      phone: "+49 89 9988776",
      category: "Handmade Goods",
      business_name: "Lichterzauber Manufaktur",
      address: "Kerzenweg 7\n80331 Muenchen"
    },
    business: {
      business_name: "Lichterzauber Manufaktur",
      phone: "+49 89 9988776",
      address: "Kerzenweg 7\n80331 Muenchen",
      billing_address: "Kerzenweg 7\n80331 Muenchen",
      map_link: "https://maps.google.com/?q=Kerzenweg+7+Muenchen",
      description: "Manufaktur fuer handgezogene Kerzen, Lichterketten und individuelle Adventsdekorationen.",
      tags: [ "Handmade", "Lighting", "Decor" ],
      confirmed: true
    }
  },
  {
    user: {
      email: "nordlicht.baeckerei@example.com",
      password: "nordlicht123",
      role: 0,
      name: "Henrik Backfisch",
      phone: "+49 421 556677",
      category: "Bakery",
      business_name: "Nordlicht Baeckerei",
      address: "Hafenweg 12\\n28195 Bremen"
    },
    business: {
      business_name: "Nordlicht Baeckerei",
      phone: "+49 421 556677",
      address: "Hafenweg 12\\n28195 Bremen",
      billing_address: "Hafenweg 12\\n28195 Bremen",
      map_link: "https://maps.google.com/?q=Hafenweg+12+Bremen",
      description: "Familienbaeckerei mit frischen Stollen, Pfeffernuessen und maritimen Adventsspezialitaeten.",
      tags: [ "Bakery", "Seasonal", "Organic" ],
      confirmed: true
    }
  },
  {
    user: {
      email: "schwarzwald.holzkunst@example.com",
      password: "holzkunst123",
      role: 0,
      name: "Sabine Tannenreich",
      phone: "+49 761 334455",
      category: "Handcrafted Goods",
      business_name: "Schwarzwald Holzkunst",
      address: "Fichtenweg 5\\n79098 Freiburg"
    },
    business: {
      business_name: "Schwarzwald Holzkunst",
      phone: "+49 761 334455",
      address: "Fichtenweg 5\\n79098 Freiburg",
      billing_address: "Fichtenweg 5\\n79098 Freiburg",
      map_link: "https://maps.google.com/?q=Fichtenweg+5+Freiburg",
      description: "Werkstatt fuer handgeschnitzte Holzfiguren, Weihnachtspyramiden und individuelle Krippen.",
      tags: [ "Woodwork", "Handmade", "Decor" ],
      confirmed: true
    }
  },
  {
    user: {
      email: "sternstunden.fotografie@example.com",
      password: "sternstunden123",
      role: 0,
      name: "Laura Lichtblick",
      phone: "+49 211 778899",
      category: "Photography",
      business_name: "Sternstunden Fotografie",
      address: "Lichtallee 9\\n40213 Duesseldorf"
    },
    business: {
      business_name: "Sternstunden Fotografie",
      phone: "+49 211 778899",
      address: "Lichtallee 9\\n40213 Duesseldorf",
      billing_address: "Lichtallee 9\\n40213 Duesseldorf",
      map_link: "https://maps.google.com/?q=Lichtallee+9+Duesseldorf",
      description: "Fotostudio fuer winterliche Familienportraits, Weihnachtskarten und Eventreportagen.",
      tags: [ "Photography", "Events", "Seasonal" ],
      confirmed: true
    }
  },
  {
    user: {
      email: "berliner.lebkuchenhaus@example.com",
      password: "lebkuchen123",
      role: 0,
      name: "Mara Zuckerlieb",
      phone: "+49 30 8899776",
      category: "Confectionery",
      business_name: "Berliner Lebkuchenhaus",
      address: "Zuckerplatz 3\\n10178 Berlin"
    },
    business: {
      business_name: "Berliner Lebkuchenhaus",
      phone: "+49 30 8899776",
      address: "Zuckerplatz 3\\n10178 Berlin",
      billing_address: "Zuckerplatz 3\\n10178 Berlin",
      map_link: "https://maps.google.com/?q=Zuckerplatz+3+Berlin",
      description: "Lebkuchenmanufaktur mit klassischen Rezepturen, veganen Varianten und personalisierten Geschenkboxen.",
      tags: [ "Bakery", "Sweets", "Tradition" ],
      confirmed: true
    }
  },
  {
    user: {
      email: "alpenklang.musik@example.com",
      password: "alpenklang123",
      role: 0,
      name: "Jonas Bergklang",
      phone: "+49 89 445566",
      category: "Entertainment",
      business_name: "Alpenklang Musik",
      address: "Bergklangstrasse 14\\n80335 Muenchen"
    },
    business: {
      business_name: "Alpenklang Musik",
      phone: "+49 89 445566",
      address: "Bergklangstrasse 14\\n80335 Muenchen",
      billing_address: "Bergklangstrasse 14\\n80335 Muenchen",
      map_link: "https://maps.google.com/?q=Bergklangstrasse+14+Muenchen",
      description: "Live Musik Ensemble fuer Adventsfeiern, Strassenauftritte und winterliche Veranstaltungen.",
      tags: [ "Music", "Live", "Seasonal" ],
      confirmed: true
    }
  },
  {
    user: {
      email: "winterwald.schmuck@example.com",
      password: "winterwald123",
      role: 0,
      name: "Klara Silbermond",
      phone: "+49 351 667788",
      category: "Jewelry",
      business_name: "Winterwald Schmuckatelier",
      address: "Tannengrund 22\\n01067 Dresden"
    },
    business: {
      business_name: "Winterwald Schmuckatelier",
      phone: "+49 351 667788",
      address: "Tannengrund 22\\n01067 Dresden",
      billing_address: "Tannengrund 22\\n01067 Dresden",
      map_link: "https://maps.google.com/?q=Tannengrund+22+Dresden",
      description: "Atelier fuer filigranen Silberschmuck mit winterlichen Motiven und personalisierten Gravuren.",
      tags: [ "Jewelry", "Handmade", "Luxury" ],
      confirmed: true
    }
  },
  {
    user: {
      email: "lichterglanz.dekor@example.com",
      password: "lichterglanz123",
      role: 0,
      name: "Nora Sternschein",
      phone: "+49 40 998877",
      category: "Decor",
      business_name: "Lichterglanz Dekor",
      address: "Lichterufer 6\\n22303 Hamburg"
    },
    business: {
      business_name: "Lichterglanz Dekor",
      phone: "+49 40 998877",
      address: "Lichterufer 6\\n22303 Hamburg",
      billing_address: "Lichterufer 6\\n22303 Hamburg",
      map_link: "https://maps.google.com/?q=Lichterufer+6+Hamburg",
      description: "Dekorationsstudio mit nachhaltigen Lichtinstallationen, Kranzworkshops und Mietdekor.",
      tags: [ "Decor", "Lighting", "Workshops" ],
      confirmed: true
    }
  }
]

business_seeds.each do |entry|
  user_attributes = entry.fetch(:user)
  business_attributes = entry.fetch(:business)

  user = User.find_or_initialize_by(email: user_attributes.fetch(:email))
  user.assign_attributes(user_attributes)
  user.skip_confirmation! if user.respond_to?(:skip_confirmation!) && (user.new_record? || user.confirmed_at.nil?)
  user.confirmed_at ||= Time.current if user.respond_to?(:confirmed_at)
  user.save!

  business = user.business || user.build_business
  business.assign_attributes(business_attributes)
  business.save!
end
