feature "it has a list of links on the homepage" do
	scenario "shows a link on the homepage" do
    Link.create(url: "http://www.bbc.co.uk", title: "BBC")
		visit "/links"
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('BBC')
    end
  end
end
