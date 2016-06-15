feature 'search by tag' do

  before :each do
    Link.create(url: 'www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'www.yahoo.com', title: 'Yahoo', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'www.bing.com', title: 'Bing', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
  end

  scenario 'show the links with search tag' do
    visit 'tags/search'
    within 'ul#links' do
      expect(page).to have_content('Google')
      expect(page).to have_content('Yahoo')
      expect(page).to have_content('Bing')
      expect(page).not_to have_content('Makers Academy')
    end
  end


end
