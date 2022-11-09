kpmg = Company.create(name: 'KPMG')
pwc = Company.create(name: 'PwC')

User.create(company: kpmg, email: 'accountant@kpmg.com', password: 'password')
User.create(company: kpmg, email: 'manager@kpmg.com', password: 'password')
User.create(company: pwc, email: 'eavesdropper@pwc.com', password: 'password')

Quote.create(company: kpmg, name: 'First quote')
Quote.create(company: kpmg, name: 'Second quote')
Quote.create(company: kpmg, name: 'Third quote')
