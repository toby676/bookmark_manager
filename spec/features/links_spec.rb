feature "it has a list of links on the homepage" do
	scenario "shows a link on the homepage" do
		visit "/"
		expect(page).to have_content "http://www.bbc.co.uk"
