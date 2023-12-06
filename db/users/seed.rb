require "open-uri"


def create_users
  
  elise = User.create!(distance: [10, 20, 30, 40].sample, first_name: "Elise", email: "Elise@gmail.com", password: "secret", last_name: "Dubois", birthdate: "06/05/1992", description: "Je n'aime pas trop faire connaissance par message, mais avec plaisir pour aller manger un bout !", gender: "Femme", preferences: "Homme", diet: "Flexitarian")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1542596768-5d1d21f1cf98")
  elise.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  elise.save

  laetitia = User.create(distance: [10, 20, 30, 40].sample, first_name: "Laetitia", email: "Laetitia@gmail.com", password: "secret", last_name: "Martinez", birthdate: "12/04/1990", description: "Cherche quelqu'un avec qui croquer la vie à pleines dents", gender: "Femme", preferences: "Both", diet: "Omnivore")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1687441266692-de2df8197665")
  laetitia.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  laetitia.save

  gaetan = User.create(distance: [10, 20, 30, 40].sample, first_name: "Gaëtan", last_name: "Jaeger", email: "gae@gmail.com", password: "secret", birthdate: "05/12/1988", description: "Bon vivant, j'ai hâte de découvrir de nouvelles saveurs et de créer de nouveaux souvenirs", gender: "Homme", preferences: "Femme", diet: "Omnivore")

  maxime = User.create(distance: [10, 20, 30, 40].sample, first_name: "Maxime", email: "Maxime@gmail.com", password: "secret", last_name: "Mesnages", birthdate: "06/07/1995", description: "Pas prise de tête - Epicurien et curieux - Qui veut devenir mon dessert ?", gender: "Homme", preferences: "Both", diet: "Omnivore")

  mahdi = User.create(distance: [10, 20, 30, 40].sample, first_name: "Mahdi", email: "Mahdi@gmail.com", password: "secret", last_name: "Uchiwa", birthdate: "08/12/1987", description: "Ne dit-on pas qu’une femme qui éclabousse un homme, c’est un peu comme la rosée d’une matinée de printemps. C’est la promesse d’une belle journée et la perspective d’une soirée enflammée.", gender: "Homme", preferences: "Femme", diet: "Hallal")

  jessica = User.create(distance: [10, 20, 30, 40].sample, first_name: "Jessica", email: "Jessica@gmail.com", password: "secret", last_name: "Roy", birthdate: "06/08/1989", description: "Je te promets des nuits aussi épicées que tes meilleurs currys", gender: "Femme", preferences: "Homme", diet: "Omnivore")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1526511253005-9a4a8cde2956")
  jessica.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  jessica.save

  bastien = User.create(distance: [10, 20, 30, 40].sample, first_name: "Bastien", email: "Bastien@gmail.com", password: "secret", last_name: "Martin", birthdate: "12/03/1993", description: "Le gras c'est la vie - je digère mal le lactose mais qu'est-ce que j'aime la raclette !", gender: "Homme", preferences: "Femme", diet: "Omnivore")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1596075780750-81249df16d19")
  bastien.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  bastien.save

  romain = User.create(distance: [10, 20, 30, 40].sample, first_name: "Romain", email: "Romain@gmail.com", password: "secret", last_name: "Moreau", birthdate: "13/01/1992", description: "La vie est trop courte pour bouffer de la salade", gender: "Homme", preferences: "Femme", diet: "Omnivore")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1590086782792-42dd2350140d")
  romain.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  romain.save

  jonathan = User.create(distance: [10, 20, 30, 40].sample, first_name: "Jonathan", email: "Jonathan@gmail.com", password: "secret", last_name: "Mirabelle", birthdate: "05/11/1986", description: "Sportif et healthy, j'aime autant courir les restos que les marathons", gender: "Homme", preferences: "Both", diet: "Flexitarian")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1596075780750-81249df16d19")
  jonathan.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  jonathan.save

  aymeric = User.create(distance: [10, 20, 30, 40].sample, first_name: "Aymeric", email: "Aymeric@gmail.com", password: "secret", last_name: "Robin", birthdate: "07/97/1991", description: "J'aime me beurrer la biscotte - Si t'as la ref, je t'invite !", gender: "Homme", preferences: "Femme", diet: "Omnivore")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1507081323647-4d250478b919")
  aymeric.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  aymeric.save

  raphaelle = User.create(distance: [10, 20, 30, 40].sample, first_name: "Raphaelle", email: "Raphaelle@gmail.com", password: "secret", last_name: "Desbois", birthdate: "04/10/1993", description: "Vegane - je ne boude pas un bon brunch dominical", gender: "Femme", preferences: "Both", diet: "Vegan")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1489424731084-a5d8b219a5bb")
  raphaelle.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  raphaelle.save

  adelaide = User.create(distance: [10, 20, 30, 40].sample, first_name: "Adelaïde", email: "Adelaïde@gmail.com", password: "secret", last_name: "Dumirail", birthdate: "30/04/1995", description: "Avec moi pas de roman, juste un bon dîner en perspective ;)", gender: "Femme", preferences: "Homme", diet: "Vegan")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1530021232320-687d8e3dba54")
  adelaide.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  adelaide.save

  gwenaelle = User.create(distance: [10, 20, 30, 40].sample, first_name: "Gwenaelle", email: "Gwenaelle@gmail.com", password: "secret", last_name: "Valois", birthdate: "31/08/1992", description: "Jamais avant le 3ème restau ... non je plaisante ;)", gender: "Femme", preferences: "Both", diet: "Omnivore")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1525186402429-b4ff38bedec6")
  gwenaelle.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  gwenaelle.save

  sylvain = User.create(distance: [10, 20, 30, 40].sample, first_name: "Sylvain", email: "Sylvain@gmail.com", password: "secret", last_name: "Dubreuil", birthdate: "08/11/1993", description: "Tu montes chez moi pour le dessert ?", gender: "Homme", preferences: "Femme", diet: "Omnivore")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1527010154944-f2241763d806")
  sylvain.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  sylvain.save

  vincent = User.create(distance: [10, 20, 30, 40].sample, first_name: "Vincent", email: "Vincent@gmail.com", password: "secret", last_name: "Lafargue", birthdate: "21/02/1992", description: "Tu manges chinois ou chez moi ?", gender: "Homme", preferences: "Femme", diet: "Omnivore")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1492288991661-058aa541ff43")
  vincent.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  vincent.save

  anais = User.create(distance: [10, 20, 30, 40].sample, first_name: "Anaïs", email: "Anaïs@gmail.com", password: "secret", last_name: "Sanchez", birthdate: "06/11/1994", description: "Je cherche du sérieux, et une bonne pizza c'est TRES serieux !", gender: "Femme", preferences: "Homme", diet: "Flexitarian")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1455819760800-d2aa223b237a")
  anais.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  anais.save

  sarah = User.create(distance: [10, 20, 30, 40].sample, first_name: "Sarah", email: "Sarah@gmail.com", password: "secret", last_name: "Cohen", birthdate: "06/09/1991", description: "Gourmande et bec sucré, je suis dingue de patisseries", gender: "Femme", preferences: "Femme", diet: "Casher")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1687441266692-de2df8197665")
  sarah.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  sarah.save

  adele = User.create(distance: [10, 20, 30, 40].sample, first_name: "Adèle", email: "Adèle@gmail.com", password: "secret", last_name: "Leclerc", birthdate: "03/11/1989", description: "Végétarienne et voyageuse, je te ferai découvrir des plaisirs culinaires insolites", gender: "Femme", preferences: "Homme", diet: "Vegetarian")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1590086782792-42dd2350140d")
  adele.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  adele.save

  fatou = User.create(distance: [10, 20, 30, 40].sample, first_name: "Fatou", email: "Fatou@gmail.com", password: "secret", last_name: "Kechiche", birthdate: "11/12/1987", description: "Attends de goûter mon couscous et tu ne pourras plus te passer de moi", gender: "Femme", preferences: "Homme", diet: "Hallal")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1519721782138-5de3d68a2b32")
  fatou.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  fatou.save

  camille = User.create(distance: [10, 20, 30, 40].sample, first_name: "Camille", email: "Camille@gmail.com", password: "secret", last_name: "Rollin", birthdate: "17/10/1988", description: "Fan de la culture nippone, je te ferai découvrir le meilleur de la gastronomie japonaise ... et bien plus si tu es prêt pour le voyage !", gender: "Femme", preferences: "Homme", diet: "Flexitarian")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1528588522589-fa345f165593")
  camille.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  camille.save

  aurelie = User.create(distance: [10, 20, 30, 40].sample, first_name: "Aurélie", email: "Aurélie@gmail.com", password: "secret", last_name: "Nerval", birthdate: "04/09/1991", description: "Pêches et aubergines ...", gender: "Femme", preferences: "Both", diet: "Vegan")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1592275772614-ec71b19e326f")
  aurelie.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  aurelie.save

  pauline = User.create(distance: [10, 20, 30, 40].sample, first_name: "Pauline", email: "Pauline@gmail.com", password: "secret", last_name: "Balzac", birthdate: "14/07/1995", description: "Tu veux me rendre folle ? On rejoue la scène de La Belle et Le Clochard !", gender: "Femme", preferences: "Homme", diet: "Flexitarian")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1519721782138-5de3d68a2b32")
  pauline.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  pauline.save

  stephane = User.create(distance: [10, 20, 30, 40].sample, first_name: "Stéphane", email: "Stéphane@gmail.com", password: "secret", last_name: "Segafredo", birthdate: "07/03/1988", description: "Végétarien assumé, je ne mange pas que des graines !", gender: "Homme", preferences: "Homme", diet: "Vegetarian")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1489980557514-251d61e3eeb6")
  stephane.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  stephane.save

  valentin = User.create(distance: [10, 20, 30, 40].sample, first_name: "Valentin", email: "Valentin@gmail.com", password: "secret", last_name: "Pokora", birthdate: "10/01/1990", description: "Et sinon, j'te ramen chez moi ?", gender: "Homme", preferences: "Femme", diet: "Omnivore")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1520341280432-4749d4d7bcf9")
  valentin.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  valentin.save

  thomas = User.create(distance: [10, 20, 30, 40].sample, first_name: "Thomas", email: "Thomas@gmail.com", password: "secret", last_name: "Azam", birthdate: "05/07/1991", description: "Mon hobby ? Lever du coude dans un bon pub. Si tu aimes aussi le foot, alors on pourra jouer les prolongations", gender: "Homme", preferences: "Femme", diet: "Omnivore")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1507081323647-4d250478b919")
  thomas.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  thomas.save

  matt = User.create(distance: [10, 20, 30, 40].sample, first_name: "Matt", email: "Matt@gmail.com", password: "secret", last_name: "McGuiness", birthdate: "01/07/1989", description: "Cherche inlassable gourmande ...", gender: "Homme", preferences: "Femme", diet: "Omnivore")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1539506903458-4512befa7f2f")
  matt.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  matt.save

  yue = User.create(distance: [10, 20, 30, 40].sample, first_name: "Yue", email: "Yue@gmail.com", password: "secret", last_name: "Duan", birthdate: "04/08/1995", description: "On m'a dit que c'était ici les restos gratuits", gender: "Femme", preferences: "Homme", diet: "Omnivore")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1548142813-c348350df52b")
  yue.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  yue.save

  sakura = User.create(distance: [10, 20, 30, 40].sample, first_name: "Sakura", email: "Sakura@gmail.com", password: "secret", last_name: "Onizuka", birthdate: "18/03/1993", description: "Je veux du sérieux, mais sans ennui", gender: "Femme", preferences: "Homme", diet: "Flexitarian")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1492106087820-71f1a00d2b11")
  sakura.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  sakura.save

  remi = User.create(distance: [10, 20, 30, 40].sample, first_name: "Rémi", email: "Rémi@gmail.com", password: "secret", last_name: "Larson", birthdate: "11/07/1992", description: "Veux-tu être mon fruit de la passion ?", gender: "Homme", preferences: "Femme", diet: "Omnivore")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1519345182560-3f2917c472ef")
  remi.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  remi.save

  noel = User.create(distance: [10, 20, 30, 40].sample, first_name: "Noël", email: "Noël@gmail.com", password: "secret", last_name: "Flantier", birthdate: "13/04/1990", description: "J'ai oublié d'être sérieux, mais pas d'être gourmand !", gender: "Homme", preferences: "Homme", diet: "Omnivore")
  file = OpenURI.open_uri("https://images.unsplash.com/photo-1520975954732-35dd22299614")
  noel.pictures.attach(io: file, filename: "nes.png", content_type: "image/png")
  noel.save
  
end
