Event.create!([
  {title: "Gentse Feesten", text: "De Gentse Feesten zijn een feest dat tien dagen lang de hele binnenstad van Gent, de Kuip, inneemt. De Gentse Feesten behoren, samen met het Oktoberfest in München en Las Fallas in Valencia, tot de grootste volksfeesten van Europa.\r\n\r\nhttps://www.gentsefeesten.be/", startdate: "2015-07-17 00:00:00", enddate: "2015-07-26 23:59:00"},
  {title: "Belmundo", text: "Belmundo is een activiteitenreeks in Gent die internationale solidariteit op de voorgrond plaatst. Een heleboel Gentse organisaties organiseren een maand lang meer dan 40 activiteiten rond het thema ‘grondstoffen’. Er is debat, film, workshops, theater,… Kortom, voor ieder wat wils!", startdate: "2015-03-01 00:00:00", enddate: "2015-03-31 23:59:00"},
  {title: "Indienen practicum", text: "Voor dit practicum dien je opgaven 1, 2, en 3 hieronder elk afzonderlijk in als volgt:\r\n\r\n• Maak een zip-bestand aan waarin de hoofdmap van je project zit. Deze bevat submappen zoals app en db .\r\n• De bestandsnaam is itech-p1-g<groep>-o<opgave>.zip . Bijvoorbeeld: itech-p1-g05-o0.zip .\r\n• Zorg ervoor dat de databank in elk zip-bestand gevuld is met voldoende voorbeelden.\r\n\r\nHou ook steeds in het achterhoofd dat scores doorgaans omgekeerd evenredig zijn met de benodigde verbetertijd.\r\nBesteed dus voldoende aandacht aan duidelijke code en commentaar, en respecteer de bovenstaande afspraken.\r\nJe oplossingen zullen getest worden op Athena; zorg er dus zeker voor dat alles daar werkt.\r\n\r\n\r\n\r\n\r\nWHOOP WHOOP ITS DA SOUND OF DA POLICE", startdate: "2015-02-17 08:30:00", enddate: "2015-03-19 14:00:00"}
])
Person.create!([
  {email: "burgemeester@gent.be", name: "Daniël Termont", birthdate: "1953-05-19"},
  {email: "walter.de.buck@gentsefeesten.be", name: "Walter De Buck", birthdate: "1934-07-13"},
  {email: "lolbroek@localhost", name: "Lolbroek", birthdate: "1994-04-01"},
  {email: "tonte.chow@gmail.com", name: "Tonte Chow", birthdate: "1980-05-16"},
  {email: "jasper.dhaene@gmail.com", name: "Jasper D'haene", birthdate: "2015-02-11"},
  {email: "florian@floriandejonckheere.be", name: "Florian Dejonckheere", birthdate: "2015-10-27"}
])
Event::HABTM_People.create!([
  {event_id: 2, person_id: 1},
  {event_id: 2, person_id: 4},
  {event_id: 2, person_id: 3},
  {event_id: 1, person_id: 1},
  {event_id: 1, person_id: 2},
  {event_id: 1, person_id: 3},
  {event_id: 1, person_id: 4},
  {event_id: 1, person_id: 5},
  {event_id: 3, person_id: 5},
  {event_id: 3, person_id: 6},
  {event_id: 1, person_id: 6}
])
Message.create!([
  {person_id: 1, text: "Gisteren ging #belmundo van start met een knal. Nog hele maand maart zijn er activiteiten rond thema grondstoffen. http://www.belmundo.org", date: "2015-03-02 04:46:00", event_id: 2},
  {person_id: 4, text: "Klaar voor presentatie inzet #socialemedia voor #Belmundo in Vredeshuis #Gent", date: "2015-01-22 07:26:00", event_id: 2},
  {person_id: 2, text: "Mee mijne vlieger\r\nEn zijne steert\r\nHij goit omhuuge\r\n't Es 't ziene weert\r\n'k Geve maar klêwe\r\nOp mijn gemak\r\n'k Hè nog drei bollekes\r\nIn mijne zak", date: "2015-03-03 23:44:00", event_id: 1},
  {person_id: 1, text: "Zullen we even het alfabet opzeggen?", date: "2015-03-03 11:55:00", event_id: 1},
  {person_id: 1, text: "A", date: "2015-03-03 11:56:00", event_id: 1},
  {person_id: 3, text: "B", date: "2015-03-03 11:57:00", event_id: 1},
  {person_id: 1, text: "C", date: "2015-03-03 11:58:00", event_id: 1},
  {person_id: 3, text: "E", date: "2015-03-03 11:59:00", event_id: 1},
  {person_id: 3, text: "Euh, D...", date: "2015-03-03 12:00:00", event_id: 1},
  {person_id: 4, text: "Z", date: "2015-03-03 11:57:00", event_id: 1},
  {person_id: 4, text: "Z", date: "2015-03-03 21:58:00", event_id: 1}
])
