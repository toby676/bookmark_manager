feature 'Add a single tag' do
  scenario 'add a tag to the apple website' do
    visit 'links/new'
    fill_in('title', with: 'Apple')
    fill_in('url', with: 'http://www.apple.com')
    fill_in('tags', with: 'technology')
    click_button('Submit')
    link = Link.first
    expect(link.tags.map{ |x| x.name }).to include('technology')
  end
end
