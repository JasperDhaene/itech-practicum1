Event.create!([
  {title: "Gentse Feesten", text: "De Gentse Feesten zijn een feest dat tien dagen lang de hele binnenstad van Gent, de Kuip, inneemt. De Gentse Feesten behoren, samen met het Oktoberfest in München en Las Fallas in Valencia, tot de grootste volksfeesten van Europa.\r\n\r\nhttps://www.gentsefeesten.be/", startdate: "2015-07-17 00:00:00", enddate: "2015-07-26 23:59:00", person_id: nil, message_id: nil},
  {title: "Belmundo", text: "Belmundo is een activiteitenreeks in Gent die internationale solidariteit op de voorgrond plaatst. Een heleboel Gentse organisaties organiseren een maand lang meer dan 40 activiteiten rond het thema ‘grondstoffen’. Er is debat, film, workshops, theater,… Kortom, voor ieder wat wils!", startdate: "2015-03-01 00:00:00", enddate: "2015-03-31 23:59:00", person_id: nil, message_id: nil}
])
Event::HABTM_People.create!([
  {event_id: 2, person_id: 1},
  {event_id: 1, person_id: 1},
  {event_id: 1, person_id: 2},
  {event_id: 1, person_id: 3},
  {event_id: 2, person_id: 5}
])
Message.create!([
  {person_id: 1, text: "Gisteren ging #belmundo van start met een knal. Nog hele maand maart zijn er activiteiten rond thema grondstoffen. http://www.belmundo.org", date: "2015-03-02 04:46:00", event_id: 2},
  {person_id: 5, text: "Klaar voor presentatie inzet #socialemedia voor #Belmundo in Vredeshuis #Gent", date: "2015-01-22 07:26:00", event_id: 2},
  {person_id: 2, text: "Mee mijne vlieger\r\nEn zijne steert\r\nHij goit omhuuge\r\n't Es 't ziene weert\r\n'k Geve maar klêwe\r\nOp mijn gemak\r\n'k Hè nog drei bollekes\r\nIn mijne zak", date: "2015-03-03 23:44:00", event_id: 1},
  {person_id: 1, text: "Zullen we even het alfabet opzeggen?", date: "2015-03-03 11:55:00", event_id: 1},
  {person_id: 1, text: "A", date: "2015-03-03 11:56:00", event_id: 1},
  {person_id: 3, text: "B", date: "2015-03-03 11:57:00", event_id: 1},
  {person_id: 1, text: "C", date: "2015-03-03 11:58:00", event_id: 1},
  {person_id: 3, text: "E", date: "2015-03-03 11:59:00", event_id: 1},
  {person_id: 3, text: "Euh, D...", date: "2015-03-03 12:00:00", event_id: 1},
  {person_id: 5, text: "Z", date: "2015-03-03 11:57:00", event_id: 1},
  {person_id: 5, text: "Z", date: "2015-03-03 21:58:00", event_id: 1}
])
Person.create!([
  {email: "burgemeester@gent.be", name: "Daniël Termont", birthdate: "1953-05-19"},
  {email: "walter.de.buck@gentsefeesten.be", name: "Walter De Buck", birthdate: "1934-07-13"},
  {email: "lolbroek@localhost", name: "Lolbroek", birthdate: "1994-04-01"},
  {email: "tonte.chow@gmail.com", name: "Tonte Chow", birthdate: "1980-05-16"}
])
Person::HABTM_Events.create!([
  {event_id: 2, person_id: 1},
  {event_id: 1, person_id: 1},
  {event_id: 1, person_id: 2},
  {event_id: 1, person_id: 3},
  {event_id: 2, person_id: 5}
])
